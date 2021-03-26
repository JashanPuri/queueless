import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:queueless/common-widgets/custom_elevated_button.dart';

class OtpForm extends StatelessWidget {
  final String number;
  final Function(String) textFieldOnChanged;
  final Function buttonFunc;

  OtpForm({this.number, this.textFieldOnChanged, this.buttonFunc});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter OTP',
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
          ),
          Text(
            'Sent to +91-$number',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _theme.hintColor,
            ),
          ),
          SizedBox(height: 30),
          PinCodeTextField(
            appContext: context,
            backgroundColor: Colors.transparent,
            keyboardType: TextInputType.numberWithOptions(),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            animationType: AnimationType.fade,
            length: 4,
            onChanged: textFieldOnChanged,
            cursorColor: Colors.black,
            pinTheme: PinTheme(
              activeColor: _theme.primaryColor.withOpacity(0.75),
              inactiveColor: Colors.grey,
              fieldWidth: 50,
            ),
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            pastedTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 35),
          CustomElevatedButton(
            label: 'CONFIRM OTP',
            onPressed: buttonFunc,
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Resend OTP',
                style: TextStyle(
                  color: _theme.primaryColor.withOpacity(0.75),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
