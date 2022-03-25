import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String path;
  final Function() onPressed;

  // ignore: use_key_in_widget_constructors
  const HeaderWidget({
    required this.path,
    required this.onPressed,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width * 1,
      color: const Color(0xFF2ecc71),
      child: Center(
        child: Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: 25,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    path,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                child: Icon(
                  Icons.message,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
