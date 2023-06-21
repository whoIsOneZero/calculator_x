import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String buttonText;
  final Color? myColor;
  final Icon? myIcon;
  final void Function()? buttonTapped;

  const MyButtons({
    Key? key,
    required this.buttonText,
    this.myColor,
    this.myIcon,
    this.buttonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 0.0),
        child: Material(
          elevation: 1.0,
          shadowColor: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(20),
          //TODO: Resize the buttons
          child: SizedBox(
            width: 5.0,
            height: 5.0,
            child: Container(
              ///The buttons themselves
              color: Theme.of(context).scaffoldBackgroundColor,
              alignment: Alignment.center,
              child: myIcon ??
                  Text(
                    buttonText,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 26.0, color: myColor ?? Colors.white),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
