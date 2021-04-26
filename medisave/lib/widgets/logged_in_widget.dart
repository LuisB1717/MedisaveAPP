import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medisave/Services/auth_2.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      //  alignment: Alignment.center,
      //color: Colors.blueGrey.shade900,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: AppColors.BACKGROUND,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: CircleAvatar(
                      maxRadius: 25,
                      backgroundImage: NetworkImage(user.photoURL),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Name: ' + user.displayName,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Email: ' + user.email,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),

            /* Text(
            'Logged In',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 8),
          CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(user.photoURL),
          ),
          SizedBox(height: 8),
          Text(
            'Name: ' + user.displayName,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 8),
          Text(
            'Email: ' + user.email,
            style: TextStyle(color: Colors.black),
          ),*/

            /* SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Text('Logout'),*/
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Invitar Amigo'),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configuraciones'),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Ayuda'),
            onTap: null,
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
