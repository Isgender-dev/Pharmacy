import 'package:flutter/widgets.dart';
import 'package:pharmacy/constants/constants.dart';

class FooterSection extends StatelessWidget {
  FooterSection({
    super.key,
    required this.mainAxisAlignment,
    required this.text,
    required this.textButton,
    required this.onTap,
  });
  final MainAxisAlignment mainAxisAlignment;
  final String text;
  final String textButton;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(text, style: TextStyle(color: kGrey)),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: GestureDetector(
            onTap: onTap,
            // onDoubleTap: () {
            //   print('click 2');
            // },
            // onLongPress: () {
            //   showDialog(
            //     context: context,
            //     builder: (context) {
            //       return AlertDialog(title: Text('Hello'));
            //     },
            //   );
            // },
            child: Text(
              textButton,
              style: TextStyle(color: kDark, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
