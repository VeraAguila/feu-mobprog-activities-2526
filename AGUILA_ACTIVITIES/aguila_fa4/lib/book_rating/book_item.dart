import 'package:aguila_fa4/model/books.dart';
import 'package:flutter/material.dart';
import 'package:aguila_fa4/book_rating/view_screen.dart';

class BookItem extends StatefulWidget {
  const BookItem(this.books, {super.key});

  final Books books;

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  void editFavorite () {
    if (widget.books.favorite.toString() == favCategory.fav.toString()) {
      setState(() {
        widget.books.favorite = favCategory.notFav;
      });
    } else if (widget.books.favorite.toString() == favCategory.notFav.toString()) {
      setState(() {
        widget.books.favorite = favCategory.fav;
      });
    }

  }

  void openBookModal () {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => ViewScreen(books: widget.books),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 1,
      ),
      child: GestureDetector(
        onTap: openBookModal,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 5,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Icon(
                      categoryIcons[widget.books.category],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.books.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          'Author: ${widget.books.author}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          widget.books.category.toString().toUpperCase().substring(13),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          widget.books.rating.toString(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 15),
                        IconButton(
                          onPressed: () {
                            editFavorite();
                          },
                          icon: Icon(favIcons[widget.books.favorite]),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
