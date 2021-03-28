import 'package:flutter/material.dart';
import '../../common-widgets/text_widget.dart';

class CompleteTaskWidget extends StatelessWidget {
  const CompleteTaskWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 280,
        height: 250,
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset("assets/images/complete_task.png",fit: BoxFit.cover,),
          SizedBox(height: 15,),
          TextWidget("No more appointments left")
        ],),
      ),
    );
  }
}
