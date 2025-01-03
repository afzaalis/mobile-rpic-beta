import 'package:flutter/material.dart';
import 'package:rpic_mobile_beta/local_notifications.dart';
<<<<<<< HEAD
import 'orderPage.dart';

class DrivingPage extends StatefulWidget {
  final String pcType;

  const DrivingPage({super.key, required this.pcType});
=======
import 'orderPage.dart'; // Import your OrderPage

class DrivingPage extends StatefulWidget {
  const DrivingPage({super.key});
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29

  @override
  _DrivingPageState createState() => _DrivingPageState();
}

class _DrivingPageState extends State<DrivingPage> {
  List<String> selectedPCs = [];

<<<<<<< HEAD
  void toggleSelection(String pc) {
    setState(() {
      if (selectedPCs.contains(pc)) {
        selectedPCs.remove(pc); 
=======
  // Fungsi untuk menambahkan atau menghapus PC dari daftar yang dipilih
  void toggleSelection(String pc) {
    setState(() {
      if (selectedPCs.contains(pc)) {
        selectedPCs.remove(pc); // Jika sudah dipilih, hapus dari daftar
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
      } else {
        if (selectedPCs.length < 3) {
          selectedPCs.add(pc); 
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("You can only select a maximum of 3 PCs.")),
          );
        }
      }
    });
  }

<<<<<<< HEAD
  double calculateTotalPrice(List<String> selectedPCs) {
    return selectedPCs.length * 30000; 
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
              widget.pcType.toUpperCase(), // Menampilkan pcType di judul
=======
              "PC DRIVING SIMULATOR",
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
<<<<<<< HEAD
                      backgroundColor: selectedPCs.contains("DS-$i") ? Color(0xFF640EF1) : Colors.white,
=======
                      backgroundColor: selectedPCs.contains("D$i") ? Color(0xFF640EF1) : Colors.white,
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
<<<<<<< HEAD
                      toggleSelection("DS-$i");
                      LocalNotifications.showSimpleNotification(
                        title: "PC DS-$i ${selectedPCs.contains("DS-$i") ? "Selected" : "Unselected"}",
                        body: "PC DS-$i has been ${selectedPCs.contains("DS-$i") ? "added" : "removed"} from the selection.",
                        payload: "PC DS-$i ${selectedPCs.contains("DS-$i") ? "selected" : "unselected"}",
                      );
                    },
                    child: Text(
                      "DS-$i",
                      style: TextStyle(
                        color: selectedPCs.contains("DS-$i") ? Colors.white : Colors.black,
=======
                      toggleSelection("D$i"); // Tambah atau hapus dari daftar yang dipilih
                      LocalNotifications.showSimpleNotification(
                        title: "PC D$i ${selectedPCs.contains("D$i") ? "Selected" : "Unselected"}",
                        body: "PC D$i has been ${selectedPCs.contains("D$i") ? "added" : "removed"} from the selection.",
                        payload: "PC D$i ${selectedPCs.contains("D$i") ? "selected" : "unselected"}",
                      );
                    },
                    child: Text(
                      "D$i",
                      style: TextStyle(
                        color: selectedPCs.contains("D$i") ? Colors.white : Colors.black,
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
                      ),
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
<<<<<<< HEAD
                    double totalPrice = calculateTotalPrice(selectedPCs);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPage(
                          selectedPCs: selectedPCs,
                          totalPrice: totalPrice,  
                          pcType: widget.pcType,   
                        ),
=======
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
