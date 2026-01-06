import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'bokking_system.dart';
import 'user_form.dart';

class MapScreen extends StatefulWidget {
  final String selectedVehicle;
  MapScreen({this.selectedVehicle = 'defaultVehicle'});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // ignore: unused_field
  late GoogleMapController _mapController;

  // Hardcoded list of nearby repair shops
  final List<Map<String, dynamic>> _repairShops = [
    {
      "name": "AutoFix Garage",
      "distance": "1.2 km",
      "rating": "4.5",
      "responseTime": "15 min",
      "position": LatLng(20.2985, 85.8259),
    },
    {
      "name": "Speedy Repairs",
      "distance": "2.5 km",
      "rating": "4.3",
      "responseTime": "20 min",
      "position": LatLng(20.2950, 85.8280),
    },
    {
      "name": "Quick Auto Care",
      "distance": "3.0 km",
      "rating": "4.7",
      "responseTime": "10 min",
      "position": LatLng(20.2940, 85.8215),
    },
    {
      "name": "Rapid Auto Solutions",
      "distance": "1.8 km",
      "rating": "4.6",
      "responseTime": "12 min",
      "position": LatLng(20.2992, 85.8220),
    },
    {
      "name": "Elite Car Repair",
      "distance": "4.1 km",
      "rating": "4.2",
      "responseTime": "25 min",
      "position": LatLng(20.3005, 85.8301),
    },
    {
      "name": "Express Auto Fix",
      "distance": "2.2 km",
      "rating": "4.8",
      "responseTime": "8 min",
      "position": LatLng(20.2928, 85.8265),
    },
    {
      "name": "ProMechanic Hub",
      "distance": "3.5 km",
      "rating": "4.4",
      "responseTime": "18 min",
      "position": LatLng(20.2972, 85.8199),
    },
    {
      "name": "FastTrack Repairs",
      "distance": "5.0 km",
      "rating": "4.0",
      "responseTime": "30 min",
      "position": LatLng(20.3010, 85.8170),
    },
    {
      "name": "Reliable Auto Service",
      "distance": "2.0 km",
      "rating": "4.9",
      "responseTime": "7 min",
      "position": LatLng(20.2936, 85.8290),
    },
    {
      "name": "City Auto Clinic",
      "distance": "3.8 km",
      "rating": "4.1",
      "responseTime": "22 min",
      "position": LatLng(20.2966, 85.8333),
    },
  ];

  // Function to get image based on selected vehicle
  String getVehicleImage(String vehicle) {
    switch (vehicle.toLowerCase()) {
      case 'bike':
        return 'assets/bike_logo.png';
      case 'scooty':
        return 'assets/scoty_logo.png';
      case 'car':
        return 'assets/car_logo.png';
      case 'truck':
        return 'assets/truck_logo.png';
      default:
        return 'assets/default_vehicle.png'; // Default image
    }
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> markers = {
      // Add center marker
      Marker(
        markerId: MarkerId('center'),
        position: LatLng(20.2961, 85.8245),
        infoWindow: InfoWindow(title: 'Your Location'),
      ),
      // Add repair shop markers
      ..._repairShops.map(
        (shop) => Marker(
          markerId: MarkerId(shop['name']),
          position: shop['position'],
          infoWindow: InfoWindow(title: shop['name']),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ServiceRequestScreen(),
              ),
            );
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      ),
    };

    return Scaffold(
      appBar: AppBar(title: Text('Nearby Repair Shops')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Vehicle image card
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  getVehicleImage(widget.selectedVehicle),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Google Map
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                clipBehavior: Clip.antiAlias,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(20.2961, 85.8245),
                    zoom: 14,
                  ),
                  mapType: MapType.normal,
                  onMapCreated: (controller) => _mapController = controller,
                  myLocationEnabled: false,
                  zoomControlsEnabled: true,
                  markers: markers,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Nearby shops button
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RepairShopsScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: Icon(
                      Icons.store_mall_directory_outlined,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Nearby Shops',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
