import 'package:flutter/material.dart';
import 'shope_dashbord.dart';

class ServiceRequestScreen extends StatefulWidget {
  @override
  _ServiceRequestScreenState createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> {
  TextEditingController _problemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Describe Your Issue")),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Describe your problem",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _problemController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Example: Engine not starting",
                    ),
                  ),
                  SizedBox(height: 24),
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
                                builder: (context) => ShopkeeperDashboard(),
                              ),
                            );
                          },
                          child: Text(
                            "Send Request",
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
