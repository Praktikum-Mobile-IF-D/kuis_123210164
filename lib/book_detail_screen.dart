import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data_buku.dart';

class BookDetailScreen extends StatefulWidget {
  final DataBuku book;

  BookDetailScreen({required this.book});

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: GestureDetector(
                    child: Image.network(widget.book.imageLink),
                    onTap: () => launch(widget.book.link),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Author : ${widget.book.author}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Language : ${widget.book.language}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Country : ${widget.book.country}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Pages : ${widget.book.pages}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Year : ${widget.book.year}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Status : ${widget.book.isAvailable ? 'Available' : 'Not Available'}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 18),
                    ),
                    child: Text('Borrow'),
                    onPressed: widget.book.isAvailable ? () {
                      setState(() {
                        widget.book.isAvailable = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Berhasil Meminjam Buku ${widget.book.title}'),
                        ),
                      );
                    } : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}