import 'package:flutter/material.dart';
import 'package:medpaddy/helpers/custom_icons_icons.dart';
import 'package:flutter_svg/svg.dart';

class AppDrawer extends StatelessWidget {
  final Widget avatarSvg = SvgPicture.asset('assets/images/avatar.svg',
      semanticsLabel: 'Profile');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff55C97C),
      child: Column(
        children: <Widget>[
          Container(
            height: 180,
            child: Column(
              children:  <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child:avatarSvg ,
                ),
                Text("Devnest",style: TextStyle(color: Colors.white,fontSize: 18),)
              ],
            ),
          ),

          ListTile(
            leading: Icon(CustomIcons.settings,color: Color(0xff0D0428),),
            title: Text('Profile settings',style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),

          ListTile(
            leading: Icon(CustomIcons.comment_empty,color: Color(0xff0D0428),),
            title: Text('Orders',style: TextStyle(color: Colors.white)),
            onTap: () {
              // Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(CustomIcons.invite,color: Color(0xff0D0428),),
            title: Text('Manage Products' ,style: TextStyle(color: Colors.white),),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(CustomIcons.notif,color: Color(0xff0D0428),),
            title: Text('Notifiactions',style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(CustomIcons.emergency,color: Color(0xff0D0428),),
            title: Text('Emergency',style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(CustomIcons.help,color: Color(0xff0D0428),),
            title: Text('Help',style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),

          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: ListTile(
              leading: Icon(CustomIcons.logout,color: Color(0xff0D0428),),
              title: Text('LOGOUT',style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
          ),
          ListTile(
            leading: Icon(CustomIcons.medic,color: Color(0xff0D0428),),
            title: Text('LOGIN AS A MEDIC',style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),

        ],
      ),
    );
  }
}
