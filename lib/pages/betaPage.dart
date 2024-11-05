import 'package:flutter/material.dart';
import 'package:rpic_mobile_beta/local_notifications.dart';
import 'orderPage.dart'; // Import your OrderPage

class BetaPage extends StatefulWidget {
  const BetaPage({super.key});

  @override
  _BetaPageState createState() => _BetaPageState();
}

class _BetaPageState extends State<BetaPage> {
  // Daftar PC yang telah dipilih oleh pengguna
  List<String> selectedPCs = [];

  // Fungsi untuk menambahkan atau menghapus PC dari daftar yang dipilih
  void toggleSelection(String pc) {
    setState(() {
      if (selectedPCs.contains(pc)) {
        selectedPCs.remove(pc); // Jika sudah dipilih, hapus dari daftar
      } else {
        if (selectedPCs.length < 3) {
          selectedPCs.add(pc); // Jika belum dipilih dan max belum tercapai, tambahkan ke daftar
        } else {
          // Menampilkan pesan jika sudah mencapai batas maksimum
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("You can only select a maximum of 3 PCs.")),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF05051E),
      appBar: AppBar(
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "PC BETA",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Image.asset(
              "images/imgPagePC/selectionNote.png",
              height: 30,
            ),
          ],
        ),
        backgroundColor: Color(0xFF2C2D59),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Wrap(
            spacing: 20.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 1; i <= 56; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(75, 50),
                      backgroundColor: selectedPCs.contains("B$i") ? Color(0xFF640EF1) : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      toggleSelection("B$i"); // Tambah atau hapus dari daftar yang dipilih
                      LocalNotifications.showSimpleNotification(
                        title: "PC B$i ${selectedPCs.contains("B$i") ? "Selected" : "Unselected"}",
                        body: "PC B$i has been ${selectedPCs.contains("B$i") ? "added" : "removed"} from the selection.",
                        payload: "PC B$i ${selectedPCs.contains("B$i") ? "selected" : "unselected"}",
                      );
                    },
                    child: Text(
                      "B$i",
                      style: TextStyle(color: selectedPCs.contains("B$i") ? Colors.white : Colors.black),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF2C2D59), 
        padding: EdgeInsets.all(10),
        height: 180, 
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Selected PCs",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedPCs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Chip(
                        label: Text(
                          selectedPCs[index],
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Color(0xFF640EF1),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 5), 
              ElevatedButton(
                onPressed: () {
                  if (selectedPCs.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPage(selectedPCs: selectedPCs),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select at least one PC.")),
                    );
                  }
                },
                child: Text("Confirm Booking"),
                style: ElevatedButton.styleFrom(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
