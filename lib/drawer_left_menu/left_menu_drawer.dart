import 'package:flutter/material.dart';


class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/image/sukuna.png'),
            ),
            accountName: Text(''),
            accountEmail: Text('abcd123456@naver.com'),
            onDetailsPressed: () {},
            otherAccountsPictures: [
              CircleAvatar(
              )
            ],

          ),

          ListTile(
            leading: Icon(Icons.home),
            iconColor: colorScheme.primary,
            focusColor: colorScheme.primary,
            title: Text('홈'),
            onTap: () {},
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            leading: Icon(Icons.format_list_numbered),
            iconColor: colorScheme.primary,
            focusColor: colorScheme.primary,
            title: Text('배송 내역'),
            onTap: () {},
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            leading: Icon(Icons.mark_as_unread_sharp),
            iconColor: colorScheme.primary,
            focusColor: colorScheme.primary,
            title: Text('편지함'),
            onTap: () {},
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            leading: Icon(Icons.restore_from_trash),
            iconColor: colorScheme.primary,
            focusColor: colorScheme.primary,
            title: Text('휴지통'),
            onTap: () {},
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            iconColor: colorScheme.primary,
            focusColor: colorScheme.primary,
            title: Text('설정'),
            onTap: () {},
            trailing: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }

}