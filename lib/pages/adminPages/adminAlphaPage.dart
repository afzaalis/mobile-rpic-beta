import 'package:flutter/material.dart';

class AdminAlphaPage extends StatefulWidget {
  const AdminAlphaPage({Key? key}) : super(key: key);

  @override
  _AdminAlphaPageState createState() => _AdminAlphaPageState();
}

class _AdminAlphaPageState extends State<AdminAlphaPage> {
  List<String> availablePCs = List.generate(16, (index) => "A${index + 1}");

  // Function to remove a PC with a confirmation dialog
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

  // Function to add a new PC
  void addPCDialog() {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New PC'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter PC name (e.g. A17)"),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin - Alpha PC Management"),
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
                  onTap: () {
                  },
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
