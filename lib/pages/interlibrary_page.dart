// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_application/pages/success_request.dart';

class InterLibrary extends StatefulWidget {
  const InterLibrary({super.key});

  @override
  State<InterLibrary> createState() => _InterLibraryState();
}

class _InterLibraryState extends State<InterLibrary> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _requesterController = TextEditingController();
  final _publisherController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _requesterController.dispose();
    _publisherController.dispose();
    super.dispose();
  }

  Future ILLRequest() async {
    addRequestDetails(
        _titleController.text.trim(),
        _authorController.text.trim(),
        _requesterController.text.trim(),
        _publisherController.text.trim());
  }

  Future addRequestDetails(
    String title,
    String author,
    String requester,
    String publisher,
  ) async {
    await FirebaseFirestore.instance.collection('ILL request').add({
      'book title': title,
      'author name': author,
      'requester email': requester,
      'publisher': publisher,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text(
            'Inter Library Loan',
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Greeting text
                  Text(
                    'Request Form',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // first name textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      style: GoogleFonts.montserrat(),
                      controller: _titleController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelText: 'Book Title',
                        /*fillColor: Colors.grey[200],
                    filled: true,*/
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // last name textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      style: GoogleFonts.montserrat(),
                      controller: _authorController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelText: 'Author Name',
                        /*fillColor: Colors.grey[200],
                    filled: true,*/
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // email textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      style: GoogleFonts.montserrat(),
                      controller: _publisherController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelText: 'Publisher',
                        /*fillColor: Colors.grey[200],
                    filled: true,*/
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      style: GoogleFonts.montserrat(),
                      controller: _requesterController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelText: 'Requester Email',
                        /*fillColor: Colors.grey[200],
                    filled: true,*/
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  //sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () {
                        ILLRequest();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SucessRequestPage()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 77, 112),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Request',
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
        ));
  }
}
