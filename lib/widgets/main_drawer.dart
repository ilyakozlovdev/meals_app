import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile({String title, IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 22,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 22,
        ),
      ),
      onTap: () => null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(title: 'Meals', icon: Icons.restaurant),
          buildListTile(title: 'Settigns', icon: Icons.settings),
        ],
      ),
    );
  }
}
