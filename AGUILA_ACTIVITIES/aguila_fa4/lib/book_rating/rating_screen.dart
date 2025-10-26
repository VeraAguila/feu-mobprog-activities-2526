import 'package:aguila_fa4/book_rating/book_list.dart';
import 'package:aguila_fa4/book_rating/new_rating.dart';
import 'package:aguila_fa4/chart/chart.dart';
import 'package:aguila_fa4/data/books_data.dart';
import 'package:aguila_fa4/model/books.dart';
import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() {
    return _RatingScreenState();
  }
}

class _RatingScreenState extends State<RatingScreen> {
  void openAddModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewRating(
        addRating: addRating,
      ),
    );
  }

  void addRating(Books books) {
    setState(() {
      readBooks.add(books);
    });
  }

  void removeBook(Books books) {
    final bookIndex = readBooks.indexOf(books);

    setState(() {
      readBooks.remove(books);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Book deleted'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              readBooks.insert(bookIndex, books);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Widget content = Center(
      child: Text(
        'No books found.',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );

    if (readBooks.isNotEmpty) {
      content = BookList(
        books: readBooks,
        removeBook: removeBook,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Book Rating'),
        actions: [
          IconButton(
            onPressed: openAddModal,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: screenWidth < 600
          ? Column(
              children: [
                Chart(books: readBooks),
                Expanded(child: content),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(books: readBooks)),
                Expanded(child: content),
              ],
            ),
    );
  }
}
