// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_application/pages/book_details.dart';
import 'package:library_application/pages/collection_page.dart';
import 'package:library_application/pages/help_page.dart';
import 'package:library_application/pages/home_page.dart';
import 'package:library_application/pages/information_page.dart';
import 'package:library_application/pages/mylibrary_page.dart';
import 'package:library_application/pages/service_page.dart';
import 'package:library_application/pages/success_request.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Muqsit',
              style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              'muqs@gmail.com',
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/library-app-cc438.appspot.com/o/Profile%20Pic%2FYato.jpg?alt=media&token=ab6529e2-a309-4bac-88b5-bd697daf5651',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.grey[800],
                image: DecorationImage(
                  image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/library-app-cc438.appspot.com/o/Banner%2Fblack%20shape.png?alt=media&token=fa51cd59-c2b6-44e4-b3e3-bda7119ff375',
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text(
              'Home',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const HomePage(),
            )),
          ),

          // Divider
          Divider(
            thickness: 1,
          ),
          // Divider

          ListTile(
            leading: Icon(Icons.book),
            title: Text(
              'My Library',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const MyLibrary(),
            )),
          ),
          ListTile(
            leading: Icon(Icons.library_books_outlined),
            title: Text(
              'Collections',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Collection(),
            )),
          ),
          ListTile(
            leading: Icon(Icons.support_agent_outlined),
            title: Text(
              'Services',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Services(),
            )),
          ),

          // Divider
          Divider(
            thickness: 1,
          ),
          // Divider

          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.redAccent,
            ),
            title: Text(
              'Log Out',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                fontSize: 16,
              ),
            ),
            onTap: () => FirebaseAuth.instance.signOut(),
          ),

          // Divider
          Divider(
            thickness: 1,
          ),
          // Divider

          ListTile(
            leading: Icon(Icons.help),
            iconColor: Colors.grey[500],
            title: Text(
              'Help',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const HelpPage(),
            )),
          ),
          ListTile(
            leading: Icon(Icons.info),
            iconColor: Colors.grey[500],
            title: Text(
              'Information',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const InfoPage(),
            )),
          ),
        ],
      ),
    );
  }
}
