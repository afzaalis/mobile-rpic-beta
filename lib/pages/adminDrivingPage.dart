import 'package:flutter/material.dart';

class AdminDrivingPage extends StatefulWidget {
  const AdminDrivingPage({Key? key}) : super(key: key);

  @override
  _AdminDrivingPageState createState() => _AdminDrivingPageState();
}

class _AdminDrivingPageState extends State<AdminDrivingPage> {
  // Daftar PC yang tersedia
  List<String> availablePCs = List.generate(16, (index) => "D${index + 1}");
  List<String> damagedPCs = []; // List untuk menyimpan PC yang rusak

  // Fungsi untuk menghapus PC dari daftar yang tersedia
  void removePC(String pc) {
    setState(() {
      availablePCs.remove(pc);
      damagedPCs.add(pc); // Tambahkan ke daftar PC yang rusak
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("$pc has been marked as damaged.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin - Driving Simulator"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: availablePCs.length,
          itemBuilder: (context, index) {
            final pc = availablePCs[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(pc, style: TextStyle(fontSize: 18)),
                trailing: ElevatedButton(
                  onPressed: () => removePC(pc),
                  child: Text("Mark as Damaged"),
                  style: ElevatedButton.styleFrom(iconColor: Colors.red),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
