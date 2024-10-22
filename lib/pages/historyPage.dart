import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart'; 

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05051E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Reservation History",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0XFF15162F),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 10, 
                  itemBuilder: (context, index) {
                    String status;
                    Color statusColor;

                    if (index == 0) {
                      status = "In Progress"; 
                      statusColor = Colors.yellow; 
                    } else if (index % 3 == 0) {
                      status = "Cancelled";
                      statusColor = Colors.red; 
                    } else {
                      status = "Completed";
                      statusColor = Colors.green; 
                    }

                    return Card(
                      color: const Color(0xFF1F1F2F),
                      child: ListTile(
                        title: Text(
                          "Reservation #${index + 1}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date: 2024-10-20",
                                style: const TextStyle(color: Colors.white)),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: statusColor.withOpacity(0.2), 
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    status,
                                    style: TextStyle(
                                      color: statusColor, 
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward, color: Colors.white),
                        onTap: () {
                          showPlatformDialog(
                            context: context,
                            builder: (context) => BasicDialogAlert(
                              title: const Text('Reservation Details'),
                              content: Text(
                                'Details for Reservation #${index + 1}\nStatus: $status\nDate: 2024-10-20',
                              ),
                              actions: <Widget>[
                                BasicDialogAction(
                                  title: const Text('Close'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
