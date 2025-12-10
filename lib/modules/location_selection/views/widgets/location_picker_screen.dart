import 'package:fastery/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

// NOTE: You must replace 'AppColors.primaryRed' with a standard color if AppColors
// is not available in the context of this single file. I've used Colors.blue.
// Assuming AppColors is correctly imported, I've kept the original reference.
import '../../../../core/constants/app_colors.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentMapCenter;
  String _currentAddress = "Loading address...";
  bool _isLoading = false;

  late Future<CameraPosition> _initialCameraPositionFuture;

  @override
  void initState() {
    super.initState();
    // Start the location fetch and store the Future
    _initialCameraPositionFuture = _getInitialCameraPosition();
  }

  /// 📍 Fetches the user's initial location and creates the starting CameraPosition.
  Future<CameraPosition> _getInitialCameraPosition() async {
    try {
      final position = await _determinePosition();

      // Store the initial coordinates for immediate use and later reference
      _currentMapCenter = LatLng(position.latitude, position.longitude);

      // Perform initial reverse geocoding to show the address immediately
      await _reverseGeocodeLocation(_currentMapCenter!);

      // Return the CameraPosition object
      return CameraPosition(
        target: _currentMapCenter!,
        zoom: 16,
      );
    } catch (e) {
      // Handle errors (e.g., location denied) by falling back to a default location
      print("Error fetching initial location: $e");

      // Update UI state if the map is built with a default position
      setState(() {
        _currentAddress = "Location access denied. Showing default area.";
      });

      // Default position (e.g., Lucknow)
      return const CameraPosition(
        target: LatLng(26.8500, 80.9499),
        zoom: 14,
      );
    }
  }

  /// 🛰️ Checks location permissions and gets the current geographical position.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
  }

  /// 🎯 Re-centers the map camera to the current device location.
  Future<void> _fetchAndSetCurrentLocation() async {
    setState(() => _isLoading = true);
    try {
      final position = await _determinePosition();
      _currentMapCenter = LatLng(position.latitude, position.longitude);

      // Move the camera to the newly fetched location
      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_currentMapCenter!, 16),
      );

      // Update loading state immediately, address will be updated by _onCameraIdle
    } catch (e) {
      _currentAddress = "Error: ${e.toString()}";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_currentAddress)),
      );
    }
    // The loading indicator will be set to false when _onCameraIdle finishes.
  }

  /// 🏠 Converts LatLng coordinates to a human-readable street address.
  Future<void> _reverseGeocodeLocation(LatLng coordinates) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        coordinates.latitude,
        coordinates.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        // Construct a readable address string
        _currentAddress = "${place.street}, ${place.locality}, ${place.administrativeArea} ${place.postalCode}, ${place.country}";
      } else {
        _currentAddress = "Address not found for this location.";
      }
    } catch (e) {
      _currentAddress = "Error fetching address.";
    }
    setState(() {
      _isLoading = false; // Always stop loading here
    });
  }

  // --- Map Callbacks ---

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  /// 🛑 IMPROVED: ONLY updates coordinates. AVOID setState() here for performance.
  void _onCameraMove(CameraPosition position) {
    _currentMapCenter = position.target;
    // We update the address label temporarily to show 'Searching...' to the user
    // without triggering a full map rebuild via setState().
    _currentAddress = "Searching for address...";
  }

  /// ✅ IMPROVED: Calls reverse geocoding ONLY when the map stops moving.
  void _onCameraIdle() {
    if (_currentMapCenter != null) {
      // Set loading state and fetch the final address
      setState(() {
        _isLoading = true;
      });
      _reverseGeocodeLocation(_currentMapCenter!);
    }
  }

  // --- UI Components ---

  Widget _buildConfirmationSheet() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order will be delivered here',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Icon(Icons.location_on, color: AppColors.primaryRed, size: 24),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _currentAddress,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Show address update loading in the button area
          _isLoading
              ? const Center(child: LinearProgressIndicator(minHeight: 5))
              : SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // **TODO: Action to confirm the address**
                Navigator.pop(context, _currentAddress); // Example of returning the address
                print("Confirmed Address: $_currentAddress");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryRed,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Confirm & proceed',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: "Selection Location"),
      body: Stack(
        children: [
          // Use FutureBuilder to wait for the initial CameraPosition
          FutureBuilder<CameraPosition>(
            future: _initialCameraPositionFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a loading indicator while fetching location
                return const Center(child: CircularProgressIndicator());
              }

              // Use the fetched position or the default fallback position
              final initialPosition = snapshot.data ?? const CameraPosition(target: LatLng(0, 0), zoom: 1);

              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: initialPosition,
                onMapCreated: _onMapCreated,
                onCameraMove: _onCameraMove,
                onCameraIdle: _onCameraIdle, // Update address when map stops moving
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
              );
            },
          ),

          // Center Marker (The pin at the center of the map)
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Icon(
                Icons.location_on,
                color: AppColors.primaryRed,
                size: 40,
              ),
            ),
          ),

          // Current Location Button
          Positioned(
            right: 15,
            bottom: 200,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue.shade600,
              onPressed: _fetchAndSetCurrentLocation,
              child: Icon(Icons.my_location, color: AppColors.primaryRed,),
            ),
          ),

          // Confirmation Bottom Sheet (Overlay)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildConfirmationSheet(),
          ),
        ],
      ),
    );
  }
}