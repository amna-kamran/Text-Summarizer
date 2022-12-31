import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:summarizer/screens/welcomescreen.dart';
import 'package:summarizer/services/firebase_auth_methods.dart';
import 'imageToTextScreen.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 56, 20, 56),
        child: ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Oflutter.com'),
              accountEmail: Text('example@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://external-preview.redd.it/4udwbOH6BR6-ZOcL9QO9r3FOx1L4VCuV_CQ8loaqUmE.jpg?auto=webp&s=508343782307b0187bc7bfa026c1dfb07d980b9b',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 22, 8, 22),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () => null,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => imgtotext(),
                  ),
                );
              },
              leading: Icon(
                Icons.document_scanner,
                color: Colors.white,
              ),
              title: Text(
                'Image to Text',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.description,
                color: Colors.white,
              ),
              title: Text(
                'Saved',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.white,
              ),
              title: Text(
                'Guide',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () => null,
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(
                Icons.help,
                color: Colors.white,
              ),
              title: Text(
                'Help and Support',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () => null,
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                'Sign Out',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onTap: () async {
                welcomescreen();
                final googleCurrentUser =
                    GoogleSignIn().currentUser ?? await GoogleSignIn().signIn();
                if (googleCurrentUser != null)
                  await GoogleSignIn().disconnect().catchError((e, stack) {});

                final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
                await _firebaseAuth.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
