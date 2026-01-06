import 'package:flutter/material.dart';

class ShopkeeperDashboard extends StatelessWidget {
  final List<Map<String, dynamic>> requests = [
  {"user": "John Doe", "vehicle": "Car", "issue": "Engine Issue", "distance": "2.0 km"},
  {"user": "Sarah Lee", "vehicle": "Bike", "issue": "Flat Tire", "distance": "1.5 km"},
  {"user": "Michael Smith", "vehicle": "Scooty", "issue": "Brake Failure", "distance": "3.2 km"},
  {"user": "Emily Johnson", "vehicle": "Truck", "issue": "Battery Dead", "distance": "4.5 km"},
  {"user": "David Brown", "vehicle": "Car", "issue": "Oil Leakage", "distance": "2.8 km"},
  {"user": "Emma Wilson", "vehicle": "Bike", "issue": "Chain Broken", "distance": "1.0 km"},
  {"user": "Daniel Martinez", "vehicle": "Scooty", "issue": "Punctured Tire", "distance": "2.4 km"},
  {"user": "Olivia Garcia", "vehicle": "Truck", "issue": "Overheating", "distance": "5.0 km"},
  {"user": "James Rodriguez", "vehicle": "Car", "issue": "Starter Problem", "distance": "3.5 km"},
  {"user": "Sophia Davis", "vehicle": "Bike", "issue": "Loose Handlebar", "distance": "1.3 km"},
  {"user": "William Lopez", "vehicle": "Scooty", "issue": "Broken Mirror", "distance": "4.0 km"},
  {"user": "Mia Hernandez", "vehicle": "Truck", "issue": "Low Coolant", "distance": "3.7 km"},
  {"user": "Benjamin Gonzalez", "vehicle": "Car", "issue": "Flat Tire", "distance": "2.6 km"},
  {"user": "Charlotte Clark", "vehicle": "Bike", "issue": "Faulty Horn", "distance": "1.7 km"},
  {"user": "Henry Lewis", "vehicle": "Scooty", "issue": "Fuel Leakage", "distance": "3.9 km"},
  {"user": "Amelia Walker", "vehicle": "Truck", "issue": "Brake Issue", "distance": "4.8 km"},
  {"user": "Ethan Hall", "vehicle": "Car", "issue": "Transmission Issue", "distance": "2.1 km"},
  {"user": "Harper Young", "vehicle": "Bike", "issue": "Chain Needs Oiling", "distance": "1.9 km"},
  {"user": "Alexander Allen", "vehicle": "Scooty", "issue": "Battery Dead", "distance": "3.0 km"},
  {"user": "Ava King", "vehicle": "Truck", "issue": "Smoke from Engine", "distance": "5.2 km"},
  {"user": "Sebastian Wright", "vehicle": "Car", "issue": "Check Engine Light On", "distance": "2.3 km"},
  {"user": "Scarlett Scott", "vehicle": "Bike", "issue": "Kickstart Not Working", "distance": "1.1 km"},
  {"user": "Jack Green", "vehicle": "Scooty", "issue": "Wiring Issue", "distance": "3.4 km"},
  {"user": "Luna Adams", "vehicle": "Truck", "issue": "Air Pressure Low", "distance": "4.7 km"},
  {"user": "Daniel Baker", "vehicle": "Car", "issue": "Clutch Problem", "distance": "2.9 km"},
  {"user": "Madison Nelson", "vehicle": "Bike", "issue": "Loose Pedals", "distance": "1.2 km"},
  {"user": "Leo Carter", "vehicle": "Scooty", "issue": "Rusting Exhaust", "distance": "3.1 km"},
  {"user": "Grace Mitchell", "vehicle": "Truck", "issue": "Rear Lights Not Working", "distance": "5.1 km"},
  {"user": "Elijah Perez", "vehicle": "Car", "issue": "Suspension Issue", "distance": "2.7 km"},
  {"user": "Nora Roberts", "vehicle": "Bike", "issue": "Seat Adjustment Needed", "distance": "1.6 km"},
  {"user": "Julian Campbell", "vehicle": "Scooty", "issue": "Brake Pads Worn Out", "distance": "3.6 km"},
  {"user": "Zoe Carter", "vehicle": "Truck", "issue": "Steering Problem", "distance": "4.9 km"},
  {"user": "Liam Turner", "vehicle": "Car", "issue": "Overheating Radiator", "distance": "2.5 km"},
  {"user": "Ella Phillips", "vehicle": "Bike", "issue": "Fuel Pipe Leaking", "distance": "1.4 km"},
  {"user": "Oliver Parker", "vehicle": "Scooty", "issue": "Horn Not Working", "distance": "3.3 km"},
  {"user": "Mila Evans", "vehicle": "Truck", "issue": "Axle Issue", "distance": "5.3 km"},
  {"user": "Lucas Edwards", "vehicle": "Car", "issue": "Noisy Engine", "distance": "2.2 km"},
  {"user": "Isabella Collins", "vehicle": "Bike", "issue": "Loose Chain", "distance": "1.8 km"},
  {"user": "Mason Stewart", "vehicle": "Scooty", "issue": "Side Stand Broken", "distance": "3.8 km"},
  {"user": "Avery Sanchez", "vehicle": "Truck", "issue": "Diesel Leakage", "distance": "4.6 km"},
  {"user": "Noah Morris", "vehicle": "Car", "issue": "Headlights Not Working", "distance": "2.4 km"},
  {"user": "Layla Murphy", "vehicle": "Bike", "issue": "Handlebar Loose", "distance": "1.0 km"},
  {"user": "Gabriel Jenkins", "vehicle": "Scooty", "issue": "Starter Motor Issue", "distance": "3.2 km"},
  {"user": "Chloe Foster", "vehicle": "Truck", "issue": "Engine Knocking Sound", "distance": "5.4 km"},
  {"user": "Carter Russell", "vehicle": "Car", "issue": "Fuel Pump Issue", "distance": "2.6 km"},
  {"user": "Victoria Torres", "vehicle": "Bike", "issue": "Brake Lever Loose", "distance": "1.7 km"},
  {"user": "Hudson Peterson", "vehicle": "Scooty", "issue": "Rear Brakes Not Working", "distance": "3.5 km"},
  {"user": "Lily Simmons", "vehicle": "Truck", "issue": "Emergency Brake Stuck", "distance": "4.2 km"},
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Service Requests")),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: requests.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  title: Text(
                    requests[index]["user"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "${requests[index]["vehicle"]} - ${requests[index]["issue"]} - ${requests[index]["distance"]}",
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.call, color: Colors.green),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.check, color: Colors.blue),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
