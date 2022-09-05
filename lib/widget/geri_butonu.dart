import 'package:flutter/material.dart';

class geriButonu extends StatefulWidget {
  const geriButonu({
    Key? key,
    required this.deviceHeight,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceHeight;
  final double deviceWidth;

  @override
  State<geriButonu> createState() => _geriButonuState();
}

class _geriButonuState extends State<geriButonu> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.pop(context);
        });
      },
      child: Container(
          height: widget.deviceHeight / 17,
          width: widget.deviceWidth / 8,
          decoration:
              BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
          child: Center(
              child: Icon(
            Icons.chevron_left,
            size: 45,
          ))),
    );
  }
}
