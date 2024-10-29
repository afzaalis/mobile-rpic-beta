import 'package:flutter/material.dart';
import 'package:rpic_mobile_beta/local_notifications.dart';

class Alphapage extends StatefulWidget {
  const Alphapage({super.key});

  @override
  _AlphapageState createState() => _AlphapageState();
}

class _AlphapageState extends State<Alphapage> {
  // Daftar PC yang telah dipilih oleh pengguna
  List<String> selectedPCs = [];

  // Fungsi untuk menambahkan atau menghapus PC dari daftar yang dipilih
  void toggleSelection(String pc) {
    setState(() {
      if (selectedPCs.contains(pc)) {
        selectedPCs.remove(pc); // Jika sudah dipilih, hapus dari daftar
      } else {
        selectedPCs.add(pc); // Jika belum dipilih, tambahkan ke daftar
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
              "PC ALPHA",
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
     body: Center(
  child: SingleChildScrollView(
    child: Wrap(
      spacing: 20.0,
      runSpacing: 10.0,
      alignment: WrapAlignment.center,
      children: [
        for (int i = 1; i <= 16; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(75, 50),
                backgroundColor: selectedPCs.contains("A$i") ? Color(0xFF640EF1) : Colors.white, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
             onPressed: () {
              toggleSelection("A$i"); // Tambah atau hapus dari daftar yang dipilih
              LocalNotifications.showSimpleNotification(
                title: "PC A$i ${selectedPCs.contains("A$i") ? "Selected" : "Unselected"}",
                body: "PC A$i has been ${selectedPCs.contains("A$i") ? "added" : "removed"} from the selection.",
                payload: "PC A$i ${selectedPCs.contains("A$i") ? "selected" : "unselected"}",
              );
            },
            child: Text(
              "A$i",
              style: TextStyle(
                color: selectedPCs.contains("A$i") ? Colors.white : Colors.black,
              ),
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
            mainAxisSize: MainAxisSize.min, // Mengatur tinggi kolom agar tidak mengambil ruang lebih
            crossAxisAlignment: CrossAxisAlignment.center, // Memusatkan konten secara horizontal
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
                  // Aksi yang dilakukan saat tombol diklik
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Confirm Booking"),
                        content: Text("Are you sure you want to book the selected PCs?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Tindakan saat dibatalkan
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Tindakan saat konfirmasi
                              // Lakukan pemesanan atau tindakan lainnya di sini
                            },
                            child: Text("Confirm"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Confirm Booking"),
                style: ElevatedButton.styleFrom(
                ),
              ),
            ],
          ),
      ),
      ),
    );
  }
}
