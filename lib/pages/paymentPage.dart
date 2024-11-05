import 'package:flutter/material.dart';
import 'package:rpic_mobile_beta/pages/introPage.dart';
import 'package:tab_container/tab_container.dart';
import '../components/bottom_nav_bar.dart';

class PaymentPage extends StatefulWidget {
  final String totalPrice;

  const PaymentPage({Key? key, required this.totalPrice}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _currentIndex = 0; // Keep track of the currently selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Page"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.grey[100], // Background color
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment Confirmation",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "Total Amount: ${widget.totalPrice} IDR",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[700]),
              ),
              SizedBox(height: 20),

              // Tab Container for Payment Methods
              TabContainer(
                tabs: const [
                  Text('Dana'),
                  Text('GoPay'),
                  Text('m-Banking'),
                ],
                // Define how to build the content for the tabs
                children: [
                  _buildPaymentMethodDetails('Dana'),
                  _buildPaymentMethodDetails('GoPay'),
                  _buildPaymentMethodDetails('m-Banking'),
                ],
                // Assuming 'onChange' or 'onTap' might not be present,
                // so we will handle tab switching using the stateful widget
              ),
              SizedBox(height: 20),

              // Back to Home button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); 
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()), 
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("Back to Home", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodDetails(String method) {
    String instructions;
    String virtualAccount;

    switch (method) {
      case 'Dana':
        instructions = "Transfer the total amount to the Dana account.";
        virtualAccount = "0812-3456-7890"; 
        break;
      case 'GoPay':
        instructions = "Transfer the total amount to the GoPay account.";
        virtualAccount = "0812-9876-5432"; 
        break;
      case 'm-Banking':
        instructions = "Transfer the total amount to the virtual account number.";
        virtualAccount = "869002135470"; 
        break;
      default:
        return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(instructions),
        SizedBox(height: 10),
        Text("Virtual Account: $virtualAccount"),
      ],
    );
  }
}
