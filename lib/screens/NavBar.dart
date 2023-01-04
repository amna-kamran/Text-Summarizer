import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:summarizer/screens/welcomescreen.dart';
import 'imageToTextScreen.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 56, 20, 56),
        child: ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Oflutter.com'),
              accountEmail: const Text('example@gmail.com'),
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
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 22, 8, 22),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              // ignore: avoid_returning_null_for_void
              onTap: () => null,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const imgtotext(),
                  ),
                );
              },
              leading: const Icon(
                Icons.document_scanner,
                color: Colors.white,
              ),
              title: const Text(
                'Image to Text',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const ListTile(
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
              leading: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              title: const Text(
                'Guide',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              // ignore: avoid_returning_null_for_void
              onTap: () => null,
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: const Icon(
                Icons.help,
                color: Colors.white,
              ),
              title: const Text(
                'Help and Support',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              // ignore: avoid_returning_null_for_void
              onTap: () => null,
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              // ignore: avoid_returning_null_for_void
              onTap: () => null,
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              title: const Text(
                'Sign Out',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onTap: () async {
                const welcomescreen();
                final googleCurrentUser =
                    GoogleSignIn().currentUser ?? await GoogleSignIn().signIn();
                if (googleCurrentUser != null) {
                  await GoogleSignIn().disconnect().catchError((e, stack) {});
                }

                final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                await firebaseAuth.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
