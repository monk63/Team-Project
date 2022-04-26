import 'package:flutter/cupertino.dart';

class GoalButton extends StatelessWidget {
  final Color backgroundcolor;
  final String text;
  final Color textColor;

  const GoalButton({Key? key, required this.backgroundcolor, required this.text, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(color: backgroundcolor, borderRadius: BorderRadius.circular(40)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
