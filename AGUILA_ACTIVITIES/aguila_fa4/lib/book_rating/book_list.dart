import 'package:aguila_fa4/book_rating/book_item.dart';
import 'package:aguila_fa4/model/books.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  const BookList({
    super.key,
    required this.books,
    required this.removeBook,
  });

  final List<Books> books;
  final void Function(Books books) removeBook;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.2),
          margin: Theme.of(context).cardTheme.margin,
        ),
        key: ValueKey(books[index]),
        onDismissed: (direction) {
          removeBook(books[index]);
        },
        child: BookItem(
          books[index],
        ),
      ),
    );
  }
}
