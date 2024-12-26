import 'package:flutter/material.dart';
import 'package:rpic_mobile_beta/local_notifications.dart';
<<<<<<< HEAD
import 'orderPage.dart';

class BetaPage extends StatefulWidget {
  final String pcType; 

  const BetaPage({super.key, required this.pcType}); 
=======
import 'orderPage.dart'; // Import your OrderPage

class BetaPage extends StatefulWidget {
  const BetaPage({super.key});
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29

  @override
  _BetaPageState createState() => _BetaPageState();
}

class _BetaPageState extends State<BetaPage> {
<<<<<<< HEAD
  List<String> selectedPCs = [];

  // Fungsi untuk mengubah status pemilihan PC
  void toggleSelection(String pc) {
    setState(() {
      if (selectedPCs.contains(pc)) {
        selectedPCs.remove(pc); 
      } else {
        if (selectedPCs.length < 3) {
          selectedPCs.add(pc); 
        } else {
=======
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
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("You can only select a maximum of 3 PCs.")),
          );
        }
      }
    });
  }

<<<<<<< HEAD
  // Fungsi untuk menghitung total harga berdasarkan jumlah PC yang dipilih
  double calculateTotalPrice(List<String> selectedPCs) {
    return selectedPCs.length * 20000; 
  }

=======
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF05051E),
      appBar: AppBar(
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
<<<<<<< HEAD
              widget.pcType.toUpperCase(), 
=======
              "PC BETA",
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
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
<<<<<<< HEAD
              // Menampilkan 56 PC untuk tipe Beta
=======
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
              for (int i = 1; i <= 56; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(75, 50),
<<<<<<< HEAD
                      backgroundColor: selectedPCs.contains("Beta-$i") ? Color(0xFF640EF1) : Colors.white,
=======
                      backgroundColor: selectedPCs.contains("B$i") ? Color(0xFF640EF1) : Colors.white,
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
<<<<<<< HEAD
                      toggleSelection("Beta-$i"); // Menggunakan ID Beta-1, Beta-2, dst
                      LocalNotifications.showSimpleNotification(
                        title: "PC Beta-$i ${selectedPCs.contains("Beta-$i") ? "Selected" : "Unselected"}",
                        body: "PC Beta-$i has been ${selectedPCs.contains("Beta-$i") ? "added" : "removed"} from the selection.",
                        payload: "PC Beta-$i ${selectedPCs.contains("Beta-$i") ? "selected" : "unselected"}",
                      );
                    },
                    child: Text(
                      "Beta-$i", // Menampilkan ID PC yang dipilih
                      style: TextStyle(color: selectedPCs.contains("Beta-$i") ? Colors.white : Colors.black),
=======
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
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
<<<<<<< HEAD
        color: Color(0xFF2C2D59),
        padding: EdgeInsets.all(10),
        height: 180,
=======
        color: Color(0xFF2C2D59), 
        padding: EdgeInsets.all(10),
        height: 180, 
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
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
<<<<<<< HEAD
                          selectedPCs[index], // Menampilkan ID PC yang dipilih
=======
                          selectedPCs[index],
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Color(0xFF640EF1),
                      ),
                    );
                  },
                ),
              ),
<<<<<<< HEAD
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  if (selectedPCs.isNotEmpty) {
                    double totalPrice = calculateTotalPrice(selectedPCs); // Menghitung total harga
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPage(
                          selectedPCs: selectedPCs,
                          totalPrice: totalPrice,  // Mengirim total harga
                          pcType: widget.pcType,   // Mengirim tipe PC
                        ),
=======
              SizedBox(height: 5), 
              ElevatedButton(
                onPressed: () {
                  if (selectedPCs.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPage(selectedPCs: selectedPCs),
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select at least one PC.")),
                    );
                  }
                },
                child: Text("Confirm Booking"),
<<<<<<< HEAD
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF640EF1),
                ),
=======
                style: ElevatedButton.styleFrom(),
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
              ),
            ],
          ),
        ),
      ),
    );
  }
}
