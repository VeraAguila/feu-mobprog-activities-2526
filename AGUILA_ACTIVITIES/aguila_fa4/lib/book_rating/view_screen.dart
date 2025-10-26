import 'package:aguila_fa4/model/books.dart';
import 'package:flutter/material.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key, required this.books});

  final Books books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              books.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  'Rate:  ${books.rating.toString()} / 5',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Spacer(),
              ],
            ),  
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  'Genre: ${books.category.toString().toUpperCase().substring(13)}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 30),
            // Text('Description ${books.description}'),
            Row(
              children: [
                SizedBox(
                  width: 450,
                  child: Text(
                    'Description: \n\n\t\t\t\t${books.description}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 20,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
