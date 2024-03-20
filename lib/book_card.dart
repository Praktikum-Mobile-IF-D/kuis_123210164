import 'package:flutter/material.dart';
import 'data_buku.dart';
import 'book_detail_screen.dart';

class BookCard extends StatelessWidget {
  final DataBuku book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Image.network(book.imageLink),
        title: Text(
          book.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Author: ${book.author}\nPages: ${book.pages}',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailScreen(book: book),
            ),
          );
        },
      ),
    );
  }
}

