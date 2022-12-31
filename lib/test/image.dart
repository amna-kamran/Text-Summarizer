// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';

// class image extends StatelessWidget {
//   const image({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/Section 19.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child:
//             Scaffold(backgroundColor: Colors.transparent, body: Container()));
//   }
// }


// import 'package:flutter/material.dart';

// class NavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         color: Color.fromARGB(255, 56, 20, 56),
//         child: ListView(
//           // Remove padding
//           padding: EdgeInsets.zero,
//           children: [
//             UserAccountsDrawerHeader(
//               accountName: Text('Oflutter.com'),
//               accountEmail: Text('example@gmail.com'),
//               currentAccountPicture: CircleAvatar(
//                 child: ClipOval(
//                   child: Image.network(
//                     'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
//                     fit: BoxFit.cover,
//                     width: 90,
//                     height: 90,
//                   ),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 159, 170, 179),
//                 image: DecorationImage(
//                   fit: BoxFit.fill,
//                   image: NetworkImage(
//                       'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
//                 ),
//               ),
//             ),
//             Container(
//               color: Color.fromARGB(255, 56, 20, 56),
//               child: ListTile(
//                 leading: Icon(Icons.person),
//                 title: Text('Profile'),
//                 onTap: () => null,
//               ),
//             ),
//             Container(
//               color: Color.fromARGB(255, 56, 20, 56),
//               child: ListTile(
//                 leading: Icon(Icons.document_scanner),
//                 title: Text('Image to Text'),
//                 onTap: () => null,
//               ),
//             ),
//             Container(
//               color: Color.fromARGB(255, 56, 20, 56),
//               child: ListTile(
//                 leading: Icon(Icons.description),
//                 title: Text('Saved'),
//               ),
//             ),
//             Container(
//               color: Color.fromARGB(255, 56, 20, 56),
//               child: ListTile(
//                 leading: Icon(Icons.info),
//                 title: Text('Guide'),
//                 onTap: () => null,
//               ),
//             ),
//             Container(
//               color: Color.fromARGB(255, 56, 20, 56),
//               child: Divider(
//                 color: Colors.black,
//               ),
//             ),
//             Container(
//               color: Color.fromARGB(255, 56, 20, 56),
//               child: ListTile(
//                 leading: Icon(Icons.help),
//                 title: Text('Help and Support'),
//                 onTap: () => null,
//               ),
//             ),
//             Container(
//               color: Color.fromARGB(255, 56, 20, 56),
//               child: ListTile(
//                 leading: Icon(Icons.settings),
//                 title: Text('Settings'),
//                 onTap: () => null,
//               ),
//             ),
//             Container(
//               child: Divider(
//                 color: Colors.black,
//               ),
//               color: Color.fromARGB(255, 56, 20, 56),
//             ),
//             Container(
//               color: Color.fromARGB(255, 56, 20, 56),
//               child: ListTile(
//                 title: Text('Sign Out'),
//                 leading: Icon(Icons.logout),
//                 onTap: () => null,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
