import 'package:flutter/material.dart';
import 'data_buku.dart';
import 'book_card.dart';

class BookListScreen extends StatelessWidget {
  final List<DataBuku> books;

  BookListScreen({required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (ctx, i) => BookCard(book: books[i]),
      ),
    );
  }
}