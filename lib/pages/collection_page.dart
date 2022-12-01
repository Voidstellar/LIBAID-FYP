// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_application/pages/book_details.dart';
import 'package:library_application/util/book.dart';
import 'package:library_application/util/nav_bar.dart';

class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  final _SearchController = TextEditingController();
  List<Book> books = allBooks;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey[900],
        drawer: NavBar(),
        appBar: AppBar(
          title: Text(
            'Collections',
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: TextField(
                controller: _SearchController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_outlined),
                    hintText: 'Search Book Title...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                onChanged: searchBook,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

                  return ListTile(
                    leading: Image.asset(
                      book.urlImage,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(
                      book.title,
                      style: GoogleFonts.raleway(),
                    ),
                    subtitle: Text(
                      book.author,
                      style: GoogleFonts.raleway(),
                    ),
                    trailing: Icon(Icons.navigate_next_outlined),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookPage(book: book),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );

  void searchBook(String query) {
    final suggestions = allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();

      return bookTitle.contains(input);
    }).toList();

    setState(() => books = suggestions);
  }
}
