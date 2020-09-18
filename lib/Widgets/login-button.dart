import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String image;
  final String text;
  final Color color;
  final String route;

  const LoginButton({Key key, this.image, this.text, this.color, this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: color),
          height: 60,
          width: 350,
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  image,
                  scale: 1,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          )),
      onTap: () {
        Navigator.of(context).pushNamed('/$route');
      },
    );
  }
}
