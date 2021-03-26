import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:queueless/common-widgets/custom_elevated_button.dart';

class LoginForm extends StatelessWidget {
  final Function(String) textFieldOnChanged;
  final Function buttonFunc;

  LoginForm({
    this.textFieldOnChanged,
    this.buttonFunc,
  });

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to \nQueueless',
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 30),
          TextField(
            onChanged: textFieldOnChanged,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  '+91 - ',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.5,
                    color: _theme.hintColor,
                  ),
                ),
              ),
              hintText: 'Phone Number',
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              isDense: true,
            ),
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 1.5,
            ),
            keyboardType: TextInputType.numberWithOptions(),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              LengthLimitingTextInputFormatter(10),
            ],
          ),
          SizedBox(height: 35),
          CustomElevatedButton(
            label: 'GET OTP',
            onPressed: buttonFunc,
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
