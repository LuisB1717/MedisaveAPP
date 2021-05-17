import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medisave/Services/auth_2.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/pages/ayuda.dart';
import 'package:medisave/pages/configuraciones.dart';
import 'package:medisave/pages/recomendaciones.dart';
import 'package:medisave/pages/record_date.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: Material(
        color: AppColors.BACKGROUND,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 30),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: AppColors.BACKGROUND,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 80,
                      margin: EdgeInsets.only(
                        top: 50,
                        bottom: 8,
                      ),
                      child: CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: NetworkImage(user.photoURL),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '' + user.displayName,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '' + user.email,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
                height: 50,
                color: Colors.white,
                thickness: 1,
                indent: 18,
                endIndent: 18),
            SizedBox(height: 8),
            ListTile(
              leading:
                  Icon(Icons.library_add_check_rounded, color: Colors.white),
              title: Text('Recomendaciones',
                  style: TextStyle(color: Colors.white)),
              onTap: () => (Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          RecomendacionesPage()))),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.fiber_smart_record, color: Colors.white),
              title: Text('Historial', style: TextStyle(color: Colors.white)),
              onTap: () => (Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Buscarxfecha()))),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text(
                'Configuraciones',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => (Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Config()))),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.help, color: Colors.white),
              title: Text('Ayuda', style: TextStyle(color: Colors.white)),
              onTap: () => (Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Ayuda()))),
            ),
            Divider(
                height: 50,
                color: Colors.white,
                thickness: 1,
                indent: 18,
                endIndent: 18),
            SizedBox(height: 1),
            ElevatedButton.icon(
              icon: Icon(Icons.logout),
              style: ElevatedButton.styleFrom(
                primary: AppColors.BACKGROUND,
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              label: Text('Cerrar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
