import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../widgets/sliding_card.dart';

class HospitalDetailScreen extends StatelessWidget {

  static const routeName = './hospital_details_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SlidingUpPanel(
          panel: SlidingCard(),
          minHeight: MediaQuery.of(context).size.height * 0.51,
          maxHeight: MediaQuery.of(context).size.height * 0.85,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://bsmedia.business-standard.com/_media/bs/img/article/2017-03/17/full/1489734350-5336.jpg',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                      icon: Icon(Icons.chevron_left),
                      color: Colors.black,
                      iconSize: 40,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
