import 'package:aguila_fa4/model/books.dart';
import 'package:flutter/material.dart';

class NewRating extends StatefulWidget {
  const NewRating({super.key, required this.addRating});

  final void Function(Books books) addRating;

  @override
  State<NewRating> createState() {
    return _NewRating();
  }
}

class _NewRating extends State<NewRating> {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final ratingController = TextEditingController();
  final descriptionController = TextEditingController();
  bookCategory selectedGenre = bookCategory.horror;

  void submitRatingData() {
    double? enteredRate = double.tryParse(ratingController.text);
    if (titleController.text.trim().isEmpty ||
        authorController.text.trim().isEmpty ||
        descriptionController.text.trim().isEmpty ||
        enteredRate == null ||
        enteredRate <= 0 ||
        enteredRate > 5) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Data'),
          content: Text('Please fill out all valid data'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );

      return;
    }

    Books newBook = Books(
      title: titleController.text.trim(),
      author: authorController.text.trim(),
      rating: enteredRate,
      category: selectedGenre,
      favorite: favCategory.notFav,
      description: descriptionController.text.trim(),
    );

    widget.addRating(newBook);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Book successfully added',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Text(
          'Book was saved',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: Text(
              'OK',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    authorController.dispose();
    ratingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              style: Theme.of(context).textTheme.titleMedium,
              controller: titleController,
              maxLength: 50,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text('Title'),
              ),
            ),
            TextField(
              style: Theme.of(context).textTheme.titleMedium,
              controller: authorController,
              maxLength: 50,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text('Author'),
              ),
            ),
            TextField(
              style: Theme.of(context).textTheme.titleMedium,
              controller: descriptionController,
              maxLength: 150,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text('Description'),
              ),
            ),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: TextField(
                    style: Theme.of(context).textTheme.titleMedium,
                    controller: ratingController,
                    maxLength: 20,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text('Rate'),
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: DropdownButton(
                    value: selectedGenre,
                    items: bookCategory.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Row(
                              spacing: 10,
                              children: [
                                Icon(categoryIcons[category]),
                                Text(category.name.toString().toUpperCase()),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        selectedGenre = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: submitRatingData,
                  child: Text('Save Rating'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
