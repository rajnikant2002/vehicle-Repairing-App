import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Auth/login_screen.dart';

class VehicleScreen extends StatefulWidget {
  final String userName;

  const VehicleScreen({super.key, required this.userName});

  @override
  // ignore: library_private_types_in_public_api
  _VehicleScreenState createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  String _selectedVehicle = "Bike"; // Default selection

  final List<Map<String, dynamic>> vehicles = [
    {"name": "Bike", "icon": Icons.motorcycle},
    {"name": "Scooty", "icon": Icons.electric_scooter},
    {"name": "Car", "icon": Icons.directions_car},
    {"name": "Truck", "icon": Icons.local_shipping},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: 'Sign out',
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome, ${widget.userName}! ',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Choose Your Vehicle:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: vehicles.map((vehicle) {
                      return RadioListTile(
                        title: Row(
                          children: [
                            Icon(
                              vehicle["icon"],
                              size: 28,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 16),
                            Text(
                              vehicle["name"],
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        value: vehicle["name"],
                        groupValue: _selectedVehicle,
                        onChanged: (value) {
                          setState(() {
                            _selectedVehicle = value.toString();
                          });
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 32),
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 400),
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 92, 117, 225),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MapScreen(selectedVehicle: _selectedVehicle),
                              ),
                            );
                          },
                          child: Text(
                            "Confirm Selection",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
