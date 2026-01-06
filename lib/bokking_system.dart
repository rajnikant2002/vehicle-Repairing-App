import 'package:flutter/material.dart';
import 'user_form.dart';

class RepairShopsScreen extends StatelessWidget {
  final String? shopName; // ✅ Named parameter for navigation
   RepairShopsScreen({super.key, this.shopName});

  final List<Map<String, dynamic>> shops = [
    {
      "name": "AutoFix Garage",
      "distance": "1.2 km",
      "rating": "4.5",
      "responseTime": "15 min"
    },
    {
      "name": "Speedy Repairs",
      "distance": "2.5 km",
      "rating": "4.3",
      "responseTime": "20 min"
    },
    {
      "name": "Quick Auto Care",
      "distance": "3.0 km",
      "rating": "4.7",
      "responseTime": "10 min"
    },
    {
      "name": "Rapid Auto Solutions",
      "distance": "1.8 km",
      "rating": "4.6",
      "responseTime": "12 min"
    },
    {
      "name": "Elite Car Repair",
      "distance": "4.1 km",
      "rating": "4.2",
      "responseTime": "25 min"
    },
    {
      "name": "Express Auto Fix",
      "distance": "2.2 km",
      "rating": "4.8",
      "responseTime": "8 min"
    },
    {
      "name": "ProMechanic Hub",
      "distance": "3.5 km",
      "rating": "4.4",
      "responseTime": "18 min"
    },
    {
      "name": "FastTrack Repairs",
      "distance": "5.0 km",
      "rating": "4.0",
      "responseTime": "30 min"
    },
    {
      "name": "Reliable Auto Service",
      "distance": "2.0 km",
      "rating": "4.9",
      "responseTime": "7 min"
    },
    {
      "name": "City Auto Clinic",
      "distance": "3.8 km",
      "rating": "4.1",
      "responseTime": "22 min"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // If user comes from map with a selected shop name
    final filteredShops = shopName != null
        ? shops.where((shop) => shop['name'] == shopName).toList()
        : shops;

    return Scaffold(
      appBar: AppBar(
        title: Text(shopName != null
            ? "Selected Shop"
            : "Nearby Repair Shops"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: filteredShops.length,
            itemBuilder: (context, index) {
              final shop = filteredShops[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  title: Text(
                    shop["name"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "📍 ${shop["distance"]} | ⭐ ${shop["rating"]} | ⏳ ${shop["responseTime"]}",
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceRequestScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Select Shop",
                      style: TextStyle(fontSize: 16),
                    ),
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
