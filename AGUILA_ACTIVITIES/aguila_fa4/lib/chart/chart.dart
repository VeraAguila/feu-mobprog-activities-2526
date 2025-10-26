import 'package:aguila_fa4/chart/chart_bar.dart';
import 'package:aguila_fa4/model/books.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.books});

  final List<Books> books;

  List<BookBucket> get buckets {
    return [
      BookBucket.forCategory(books, bookCategory.horror),
      BookBucket.forCategory(books, bookCategory.fiction),
      BookBucket.forCategory(books, bookCategory.romance),
      BookBucket.forCategory(books, bookCategory.mystery),
    ];
  }

  int get maxTotalBooks {
    int maxTotalBooks = 0;

    for (final bucket in buckets) {
      if (bucket.totalBooks > maxTotalBooks) {
        maxTotalBooks = bucket.totalBooks;
      }
    }

    return maxTotalBooks;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.5),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    fill: bucket.totalBooks == 0
                        ? 0
                        : bucket.totalBooks / maxTotalBooks,
                  ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: buckets.map(
              (buckets) => Expanded(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 4,
                  ),
                  child: Icon(
                    categoryIcons[buckets.category],
                    color: isDarkMode
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  ),
                ),
              ),
            )
            .toList(),
          ),
        ],
      ),
    );
  }
}
