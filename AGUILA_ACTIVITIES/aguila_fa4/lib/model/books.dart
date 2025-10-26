import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum bookCategory { horror, fiction, romance, mystery }

enum favCategory { fav, notFav }

const categoryIcons = {
  bookCategory.horror: Icons.boy_rounded,
  bookCategory.fiction: Icons.precision_manufacturing_outlined,
  bookCategory.romance: Icons.people,
  bookCategory.mystery: Icons.location_searching_rounded,
};

const favIcons = {
  favCategory.fav: Icons.favorite,
  favCategory.notFav: Icons.favorite_outline_rounded,
};

class Books {
  Books({
    required this.title,
    required this.author,
    required this.rating,
    required this.category,
    required this.description,
    required this.favorite,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final String author;
  final double rating;
  final bookCategory category;
  final String description;
  favCategory favorite;
}

class BookBucket {
  const BookBucket({
    required this.category,
    required this.books
  });

  BookBucket.forCategory(List<Books> allBooks, this.category)
    : books = allBooks
        .where((book) => book.category == category)
        .toList();

  final bookCategory category;
  final List<Books> books;

  int get totalBooks {
    int sum = books.length;

    return sum;
  }
}
