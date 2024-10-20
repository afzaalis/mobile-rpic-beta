import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF05051E), 
      appBar: AppBar(
        title: Text("History"),
        backgroundColor: Color(0xFF05051E),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reservation History",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              // Contoh daftar riwayat reservasi
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // Ganti dengan jumlah item riwayat
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color(0xFF1F1F2F), // Sesuaikan warna card
                      child: ListTile(
                        title: Text("Reservation #${index + 1}", style: TextStyle(color: Colors.white)),
                        subtitle: Text("Date: 2024-10-20", style: TextStyle(color: Colors.white)), // Ganti dengan tanggal yang sesuai
                        trailing: Icon(Icons.arrow_forward, color: Colors.white),
                        onTap: () {
                          // Navigasi atau aksi lain saat item diklik
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
