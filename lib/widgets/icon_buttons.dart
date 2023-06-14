import 'package:flutter/material.dart';

/*class MyButtons extends StatelessWidget {
  final String buttonText;
  final Color? myColor;
  final Icon? myIcon;
  final double? myFontSize;
  final buttonTapped;

  const MyButtons({
    super.key,
    required this.buttonText,
    this.myColor,
    this.myIcon,
    this.myFontSize,
    this.buttonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: SizedBox(
          height: 65,
          width: 65,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            child: myIcon ??
                Text(
                  buttonText,
                  style: TextStyle(
                      fontSize: myFontSize ?? 26.0,
                      color: myColor ?? Colors.white),
                ),
          ),
        ),
      ),
    );
  }
}*/

class MyButtons extends StatelessWidget {
  final String buttonText;
  final Color? myColor;
  final Icon? myIcon;
  final double? myFontSize;
  final buttonTapped;

  const MyButtons({
    Key? key,
    required this.buttonText,
    this.myColor,
    this.myIcon,
    this.myFontSize,
    this.buttonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: SizedBox(
          height: 65,
          width: 65,
          child: ClipRect(
            child: Container(
              child: myIcon ??
                  Text(
                    buttonText,
                    style: TextStyle(
                        fontSize: myFontSize ?? 26.0,
                        color: myColor ?? Colors.white),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            child: myIcon ??
                Text(
                  buttonText,
                  style: TextStyle(
                      fontSize: myFontSize ?? 26.0,
                      color: myColor ?? Colors.white),
                ),
          ),
 */
