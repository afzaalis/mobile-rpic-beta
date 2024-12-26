<<<<<<< HEAD
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
=======
import 'package:flutter/material.dart';
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29

class AdminDrivingSimulatorPage extends StatefulWidget {
  const AdminDrivingSimulatorPage({Key? key}) : super(key: key);

  @override
  _AdminDrivingSimulatorPageState createState() => _AdminDrivingSimulatorPageState();
}

<<<<<<< HEAD
class BookingCard extends StatelessWidget {
  final Map<String, dynamic> booking;
  final VoidCallback onDelete;

  const BookingCard({required this.booking, required this.onDelete, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(
          "Booking ID: ${booking['id']}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User ID: ${booking['user_id']}"),
            Text("Total Price: \$${booking['total_price']}"),
            Text("Status: ${booking['status']}"),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Delete Booking'),
                  content: Text('Are you sure you want to delete this booking?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Tutup popup sebelum proses delete
                        onDelete();
                      },
                      child: Text("Yes", style: TextStyle(color: Colors.red)),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("No"),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}


class _AdminDrivingSimulatorPageState extends State<AdminDrivingSimulatorPage> {
List<Map<String, dynamic>> bookings = [];
  bool isLoading = true;
  final String apiUrl = 'http://10.0.2.2:3000/api/bookings';

Future<void> fetchConfirmedBookings() async {
  final url = Uri.parse('http://10.0.2.2:3000/api/bookings/confirmed');
  setState(() {
    isLoading = true;
  });

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      setState(() {
        bookings = data; 
        isLoading = false; 
      });
    } else {
      print('Failed to fetch bookings: ${response.statusCode}');
      setState(() {
        isLoading = false; 
      });
    }
  } catch (e) {
    print('Error fetching bookings: $e');
    setState(() {
      isLoading = false; 
    });
  }
}


  Future<void> deleteBooking(String bookingId) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      final response = await http.delete(Uri.parse('$apiUrl/$bookingId'));
      Navigator.of(context).pop(); 
      if (response.statusCode == 200) {
        setState(() {
          bookings.removeWhere((booking) => booking['id'] == bookingId);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Booking deleted successfully")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to delete booking")),
        );
      }
    } catch (error) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error deleting booking: $error")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchConfirmedBookings();
=======
class _AdminDrivingSimulatorPageState extends State<AdminDrivingSimulatorPage> {
  List<String> availablePCs = List.generate(16, (index) => "DS${index + 1}");

  void removePC(String pc) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Remove PC'),
          content: Text('Are you sure you want to mark $pc as damaged?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  availablePCs.remove(pc); 
                });
                Navigator.of(context).pop(); 
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$pc has been marked as damaged.")),
                );
              },
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }

  void addPCDialog() {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New PC'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter PC name (e.g. DS17)"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    availablePCs.add(controller.text); 
                  });
                  Navigator.of(context).pop(); 
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${controller.text} has been added.")),
                  );
                }
              },
              child: Text("Add"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text("Admin - Alpha PC Management"),
        backgroundColor: Color(0xFF2C2D59),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : bookings.isEmpty
              ? Center(
                  child: Text(
                    "No confirmed bookings found.",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  itemCount: bookings.length,
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: BookingCard(
                        booking: booking,
                        onDelete: () =>
                            deleteBooking(booking['id'].toString()),
                      ),
                    );
                  },
                ),
    );
  }
}
=======
        title: Text("Admin - Driving Simulator PC Management"),
        backgroundColor: Color(0xFF2C2D59),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: addPCDialog, 
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.9,
            ),
            itemCount: availablePCs.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          availablePCs[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          iconSize: 24.0,  
                          onPressed: () {
                            removePC(availablePCs[index]);
                          },
                        ),
                      ],
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
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
