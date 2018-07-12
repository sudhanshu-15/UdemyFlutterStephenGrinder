import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: buildBox(),
        subtitle: buildBox(),
      ),
    );
  }

  Widget buildBox() {
    return Container(
      color: Colors.grey[400],
      height: 24.0,
      width: 150.0,
      margin: EdgeInsets.only(
        top: 4.0,
        bottom: 4.0,
      ),
    );
  }
}
