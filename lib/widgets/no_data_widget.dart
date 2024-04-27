import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double maxWidth = screenSize.width;
    double maxHeight = screenSize.height;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/no_data.svg',
            height: maxHeight * 0.35,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: maxWidth * 0.10),
            child: Text(
              'Looks like there is no Resume available. Press + icon and start creating it',
              style: TextStyle(
                fontSize: maxHeight * 0.020,
                color: const Color.fromARGB(255, 111, 108, 108),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: maxHeight * 0.1,
          ),
        ],
      ),
    );
  }
}
