import 'package:flutter/material.dart';

class CardOfItems extends StatelessWidget {
  final String title;
  final List<Widget> items;

  CardOfItems({this.title, this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
                child:
                    Text(title, style: Theme.of(context).textTheme.headline5)),
            ...items
          ],
        ),
      ),
    );
  }
}
