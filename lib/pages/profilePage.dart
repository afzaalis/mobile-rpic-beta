import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:provider/provider.dart'; 
<<<<<<< HEAD
import 'package:flutter_secure_storage/flutter_secure_storage.dart';  
import 'package:image_picker/image_picker.dart';  
import 'dart:io';  
import 'package:permission_handler/permission_handler.dart'; 
import '../model/user_provider.dart';
import 'login.dart'; 

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();  
  final ImagePicker _picker = ImagePicker();  
  File? _imageFile;  
=======
import '../model/user_provider.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

<<<<<<< HEAD
=======
    // Mengambil data pengguna dari UserProvider
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      key: _scaffoldMessengerKey,
      backgroundColor: const Color(0xFF0B0B12),
<<<<<<< HEAD
      appBar: AppBar(
=======
     appBar: AppBar(

>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2C2D59),
        actions: [
          IconButton(
            onPressed: () {
<<<<<<< HEAD
              _logout(context); 
=======
              Provider.of<UserProvider>(context, listen: false).clearUser();
              Navigator.pushReplacementNamed(context, '/login');
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 30, 
            ),
          ),
        ],
<<<<<<< HEAD
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 50.0), 
          child: Center(
            child: const Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
=======
  flexibleSpace: Padding(
    padding: const EdgeInsets.only(top: 50.0), 
    child: Center(
      child: const Text(
        "Profile",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
      ),
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
      body: Column(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        child: Image.asset(
                          "images/imgProfile/bannerprofile.png",
                          width: 412,
                          height: 158,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
<<<<<<< HEAD
                              Text(
                                user?.name ?? 'Nama pengguna',
=======
                              // Menampilkan nama dan email dari data pengguna yang login
                              Text(
                                user?.name ?? 'Nama Pengguna',
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                user?.email ?? 'email@example.com',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
<<<<<<< HEAD
                          GestureDetector(
                            onTap: _showImagePicker,  
                            child: _imageFile == null 
                                ? AdvancedAvatar(
                                    margin: EdgeInsets.only(right: 15),
                                    name: user?.name ?? 'Nama Pengguna',
                                    size: 70,
                                    statusColor: Colors.blue,
                                  )
                                : CircleAvatar(
                                    radius: 35,
                                    backgroundImage: FileImage(_imageFile!),
                                  ),
=======
                          AdvancedAvatar(
                            margin: EdgeInsets.only(right: 15),
                            name: user?.name ?? 'Nama Pengguna',
                            size: 70,
                            statusColor: Colors.blue,
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                top: false,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _buildBalanceSection(),
                    const SizedBox(height: 20),
                    _buildVoucherSection(context),  
                    const SizedBox(height: 20),
                    _buildFeedbackSection(context),  
                    const SizedBox(height: 8),
                    Divider(
                      height: 1,
                      color: Colors.grey[900],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

<<<<<<< HEAD
  // Fungsi logout yang menghapus data dan menavigasi kembali ke Login
  Future<void> _logout(BuildContext context) async {
    await _secureStorage.delete(key: 'userId');  
    await _secureStorage.delete(key: 'role');    

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.clearUser();  

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  // Fungsi untuk menampilkan pilihan gambar (kamera atau galeri)
Future<void> _showImagePicker() async {
  // Meminta izin akses galeri
  var galleryStatus = await Permission.photos.request();
  if (galleryStatus.isGranted) {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  } else {
    print("Galeri tidak diizinkan");
  }

  // Meminta izin akses kamera jika dibutuhkan
  var cameraStatus = await Permission.camera.request();
  if (cameraStatus.isGranted) {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  } else {
    print("Kamera tidak diizinkan");
  }
}


void _showPermissionDialog() {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Izin Diperlukan'),
        content: const Text('Aplikasi ini memerlukan izin untuk mengakses galeri. Anda dapat memberikan izin di pengaturan aplikasi.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings(); 
            },
            child: const Text('Pergi ke Pengaturan'),
          ),
        ],
      );
    },
  );
}


=======
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
  Widget _buildBalanceSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: const Color(0xFF15162F),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF2F80ED).withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.account_balance_wallet,
              color: Color(0xFF2F80ED),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
<<<<<<< HEAD
                '50.000',
=======
                'Rp100.000',
>>>>>>> c940960ae92cf8fb163d95ca605fb8287553cc29
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: List.generate(
                  8,
                  (index) => Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF2F80ED),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'TOP-UP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVoucherSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => VoucherPage()), 
        // );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: const Color(0xFF15162F),
        child: Row(
          children: [
            Image.asset(
              'images/imgProfile/Voucher.png', 
              width: 30, 
              height: 30, 
            ),
            const SizedBox(width: 12),
            const Text(
              'Voucher Saya',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: const Color(0xFF0B0B12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Feedback',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Bagaimana pengalaman Anda menggunakan aplikasi ini?',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Tulis feedback Anda...',
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Color(0xFF15162F),
              ),
              maxLines: 3,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // Handle feedback submission
            },
            style: ElevatedButton.styleFrom(),
            child: const Text('Kirim Feedback'),
          ),
        ],
      ),
    );
  }
}
