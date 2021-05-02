import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medisave/Services/auth_2.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:provider/provider.dart';

class GoogleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: OutlineButton.icon(
          label: Text(
            'Acceder con Google',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          highlightedBorderColor: Colors.black,
          borderSide: BorderSide(color: Colors.black),
          textColor: Colors.black,
          icon: FaIcon(FontAwesomeIcons.google, color: AppColors.BACKGROUND),
          onPressed: () async {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);

            await provider.login();
            final user = FirebaseAuth.instance.currentUser;
            final userfound = await FirebaseFirestore.instance
                .collection('Usuarios')
                .where("id", isEqualTo: user.uid)
                .limit(1)
                .get();
            if (userfound.size == 0) {
              FirebaseFirestore.instance.collection('Usuarios').add({
                'id': user.uid,
                'nombrec': user.displayName,
                'correo': user.email,
                'foto': user.photoURL
              });
            }
          },
        ),
      );
}
