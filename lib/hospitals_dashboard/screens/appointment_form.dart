import 'package:flutter/material.dart';
import 'package:queueless/common-widgets/custom_elevated_button.dart';
import 'package:queueless/common-widgets/text_widget.dart';

class AppointmentForm extends StatefulWidget {
  static const routeName = 'appointment-form';
  @override
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  String name;
  int age;
  String description;
  Widget _textField(hint,{maxLine : 1}) {
    return TextFormField(
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
        
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 10),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () => Navigator.of(context).pop()),
                    
                  ],
                ),
              ),
              Container(
                  //height: 500,
                  width: double.infinity,
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 40),
                      child: Column(
                        children: [
                          TextWidget("Appointment Form", size: 27, isBold: true),
                          SizedBox(height: 30),
                          _textField("Name"),
                          SizedBox(height: 25),
                          _textField("Age"),
                          SizedBox(height: 25),
                          _textField("Description",maxLine: 5),
                          SizedBox(height: 85),
                          CustomElevatedButton(
                            label: "Pay Fee",
                            onPressed: null,
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
