import 'package:flutter/material.dart';
import '../widgets/payment_option.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = '/donation-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text('Pay', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          iconSize: 35,
          color: Colors.black,
          onPressed: () async {
            bool exit = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                  'Do you really want to cancel the process?',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      return Navigator.of(context).pop(true);
                    },
                    child: Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      return Navigator.of(context).pop(false);
                    },
                    child: Text('No'),
                  )
                ],
              ),
            );
            if (exit) Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Registeration Fee: ",
                    style: TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'Rs 200',
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: Text(
                'Pay Using: ',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            PaymentOption(
              imagePath: 'gpay.jpeg',
              title: 'Google Pay',
            ),
            PaymentOption(
              imagePath: 'phonepe.jpeg',
              title: 'Phone Pe',
            ),
            PaymentOption(
              imagePath: 'paytm.png',
              title: 'Paytm',
            ),
            PaymentOption(
              imagePath: 'upi.png',
              title: 'Other UPI Apps',
            ),
            PaymentOption(
              imagePath: 'card.png',
              title: 'Credit/Debit Card',
            ),
          ],
        ),
      ),
    );
  }
}
