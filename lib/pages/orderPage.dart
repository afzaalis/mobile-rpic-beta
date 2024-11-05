import 'package:flutter/material.dart';
import 'paymentPage.dart';

class OrderPage extends StatefulWidget {
  final List<String> selectedPCs;

  const OrderPage({Key? key, required this.selectedPCs}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<String?> selectedDurations = [];
  List<String?> selectedStartTimes = [];

  @override
  void initState() {
    super.initState();
    selectedDurations = List<String?>.filled(widget.selectedPCs.length, null);
    selectedStartTimes = List<String?>.filled(widget.selectedPCs.length, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Page"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/')); 
          }
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selected PCs",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.selectedPCs.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.selectedPCs[index],
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Select Usage Time:",
                          style: TextStyle(fontSize: 16),
                        ),
                        DropdownButton<String>(
                          value: selectedDurations[index],
                          items: <String>['1 Hour', '2 Hours', '3 Hours'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedDurations[index] = newValue; 
                            });
                          },
                          hint: Text('Select Duration'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Select Start Time:",
                          style: TextStyle(fontSize: 16),
                        ),
                        DropdownButton<String>(
                          value: selectedStartTimes[index],
                          items: <String>[
                            '08:00 AM',
                            '09:00 AM',
                            '10:00 AM',
                            '11:00 AM',
                            '12:00 PM',
                            '01:00 PM',
                            '02:00 PM',
                            '03:00 PM',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedStartTimes[index] = newValue; 
                            });
                          },
                          hint: Text('Select Start Time'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Price: ${calculatePrice(widget.selectedPCs[index], selectedDurations[index])} IDR",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double totalPrice = 0;
                for (int i = 0; i < widget.selectedPCs.length; i++) {
                  totalPrice += double.parse(calculatePrice(widget.selectedPCs[i], selectedDurations[i]));
                }

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm Order"),
                      content: Text("Total Price: $totalPrice IDR\nAre you sure you want to confirm the order?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); 
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); 
                            _showPaymentPage(context, totalPrice.toString());
                          },
                          child: Text("Confirm"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Confirm Order"),
            ),
          ],
        ),
      ),
    );
  }

  String calculatePrice(String pcType, String? duration) {
    if (duration == null) return "0";
    int hours = int.parse(duration.split(' ')[0]);
    int pricePerHour;

    if (pcType.startsWith("A")) {
      pricePerHour = 15000;
    } else if (pcType.startsWith("B")) {
      pricePerHour = 10000;
    } else if (pcType.startsWith("D")) {
      pricePerHour = 20000;
    } else {
      pricePerHour = 0; 
    }

    return (hours * pricePerHour).toString();
  }

  void _showPaymentPage(BuildContext context, String totalPrice) {
    Navigator.push(
      context,
    MaterialPageRoute(builder: (context) => PaymentPage(totalPrice: totalPrice)), 
    );
  }
}
