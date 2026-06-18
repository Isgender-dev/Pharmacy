import 'package:flutter/widgets.dart';
import 'package:pharmacy/constants/constants.dart';
class FooterSection extends StatelessWidget {
  const FooterSection({super.key, required this.mainAxisAlignment, required this.text, required this.textButton});
  final MainAxisAlignment mainAxisAlignment;
  final String text;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(text, style: TextStyle(color: kGray)),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: GestureDetector(
            onTap: () {},
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
