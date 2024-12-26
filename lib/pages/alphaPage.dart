import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:rpic_mobile_beta/local_notifications.dart'; 
import 'orderPage.dart'; 

class Alphapage extends StatefulWidget {
  final String pcType;  
  const Alphapage({super.key, required this.pcType});  
=======
import 'package:rpic_mobile_beta/local_notifications.dart';
import 'orderPage.dart';

class Alphapage extends StatefulWidget {
  const Alphapage({super.key});
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29

  @override
  _AlphapageState createState() => _AlphapageState();
}

class _AlphapageState extends State<Alphapage> {
<<<<<<< HEAD
  List<String> selectedPCs = [];  

  // Fungsi untuk mengubah status pemilihan PC
  void toggleSelection(String pc) {
    setState(() {
      if (selectedPCs.contains(pc)) {
        selectedPCs.remove(pc);  
      } else if (selectedPCs.length < 3) {
        selectedPCs.add(pc);  
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("You can only select up to 3 PCs.")),
        );
      }
    });
  }

  // Fungsi untuk menghitung total harga berdasarkan jumlah PC yang dipilih
  double calculateTotalPrice(List<String> selectedPCs) {
    double totalPrice = 0;
    double pricePerPC = 0;

    switch (widget.pcType) {
      case 'Alpha':
        pricePerPC = 15000;  
        break;
      case 'Beta':
        pricePerPC = 12000;  
        break;
      case 'Driving Simulator':
        pricePerPC = 20000;  
        break;
      default:
        pricePerPC = 0; 
    }

    // Menghitung total harga berdasarkan jumlah PC yang dipilih
    totalPrice = selectedPCs.length * pricePerPC;
    return totalPrice;
  }

=======
  // Daftar PC yang telah dipilih oleh pengguna
  List<String> selectedPCs = [];

  // Fungsi untuk menambahkan atau menghapus PC dari daftar yang dipilih
    void toggleSelection(String pc) {
      setState(() {
        if (selectedPCs.contains(pc)) {
          selectedPCs.remove(pc); // Jika sudah dipilih, hapus dari daftar
        } else if (selectedPCs.length < 3) { // Cek apakah sudah ada 3 PC yang dipilih
          selectedPCs.add(pc); // Jika belum dipilih dan belum mencapai batas, tambahkan ke daftar
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("You can only select up to 3 PCs."),
            ),
          );
        }
      });
    }

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
              "PC ${widget.pcType}",  
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Image.asset("images/imgPagePC/selectionNote.png", height: 30),  // Gambar tambahan
=======
              "PC ALPHA",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Image.asset(
              "images/imgPagePC/selectionNote.png",
              height: 30,
            ),
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
          ],
        ),
        backgroundColor: Color(0xFF2C2D59),
        iconTheme: IconThemeData(color: Colors.white),
      ),
<<<<<<< HEAD
      body: Center(
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 20.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.center,
            children: [
              // Menampilkan 16 PC untuk tipe Alpha
              for (int i = 1; i <= 16; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(75, 50),
                      backgroundColor: selectedPCs.contains("Alpha-$i") ? Color(0xFF640EF1) : Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    onPressed: () {
                      toggleSelection("Alpha-$i");  // Menggunakan ID Alpha-1, Alpha-2, dst
                      LocalNotifications.showSimpleNotification(
                        title: "PC Alpha-$i ${selectedPCs.contains("Alpha-$i") ? "Selected" : "Unselected"}",
                        body: "PC Alpha-$i has been ${selectedPCs.contains("Alpha-$i") ? "added" : "removed"} from the selection.",
                        payload: "PC Alpha-$i ${selectedPCs.contains("Alpha-$i") ? "selected" : "unselected"}",
                      );
                    },
                    child: Text(
                      "Alpha-$i",  // Menampilkan ID PC yang dipilih
                      style: TextStyle(color: selectedPCs.contains("Alpha-$i") ? Colors.white : Colors.black),
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
                "Selected PCs",  // Judul untuk menampilkan PC yang dipilih
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
=======
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
              toggleSelection("A$i"); 
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
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
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
                          selectedPCs[index],  // Menampilkan ID PC yang dipilih
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
                  if (selectedPCs.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select at least one PC")),
                    );
                    return;
                  }
                  double totalPrice = calculateTotalPrice(selectedPCs);  // Menghitung total harga
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderPage(
                        selectedPCs: selectedPCs,
                        totalPrice: totalPrice,  
                        pcType: widget.pcType,  
                      ),
                    ),
                  );
                },
                child: Text("Confirm Booking"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF640EF1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
=======
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
                            // Navigasi ke OrderPage dan kirim daftar PC yang dipilih
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderPage(selectedPCs: selectedPCs),
                              ),
                            );
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
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
