// ignore_for_file: prefer_interpolation_to_compose_strings,, prefer_const_literals_to_create_immutables, unused_label, unnecessary_new, avoid_unnecessary_containers
// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_application/pages/collection_page.dart';
import 'package:library_application/pages/mylibrary_page.dart';
import 'package:library_application/util/nav_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  int activeIndex = 0;
  final urlImages = [
    'lib/images/lib1-min.jpg',
    'lib/images/lib2-min.jpg',
    'lib/images/lib3-min.jpg',
    'lib/images/lib4-min.jpg',
    'lib/images/lib5-min.jpg',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey[900],
        drawer: NavBar(),
        appBar: AppBar(
          title: Text(
            'Homepage',
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            child: Column(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 170,
                    autoPlay: false,
                    reverse: false,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                  ),
                  itemCount: urlImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = urlImages[index];

                    return buildImage(urlImage, index);
                  },
                ),
                const SizedBox(height: 20),
                buildIndicator(),
                SizedBox(height: 20),

                // homepage content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const Collection(),
                    )),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Browse Collection',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const MyLibrary(),
                    )),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 66, 66, 66),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'MyLibrary',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        color: Colors.grey,
        width: double.infinity,
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect: ExpandingDotsEffect(
          dotHeight: 12,
          dotWidth: 12,
          dotColor: Color.fromARGB(255, 40, 88, 110),
          activeDotColor: Color.fromARGB(255, 16, 66, 88),
        ),
      );
}
