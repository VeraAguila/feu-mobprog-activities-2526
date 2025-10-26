import 'package:aguila_fa4/model/books.dart';

final List<Books> readBooks = [
  Books(
    title: 'Play Nice',
    author: 'Rachel Harrison',
    rating: 3.5,
    category: bookCategory.horror,
    favorite: favCategory.fav,
    description: "Is this how good all of Rachel’s books are? Because what the heck have I been doing not obsessing over reading every book she’s ever written? This book was straight up brilliant.",
  ),
  Books(
    title: 'The Wilderness',
    author: 'Angela Flournoy',
    rating: 4.0,
    category: bookCategory.fiction,
    favorite: favCategory.notFav,
    description: "the meaning of life is hanging out with your friends",
  ),
  Books(
    title: 'Red, White & Royal Blue',
    author: 'Casey McQuiston',
    rating: 3.8,
    category: bookCategory.romance,
    favorite: favCategory.notFav,
    description: "It was good",
  ),
  Books(
    title: 'A Good Girl\'s Guide to Murder',
    author: 'Holly Jackson',
    rating: 3.0,
    category: bookCategory.mystery,
    favorite: favCategory.fav,
    description: "this is a fun book that is sometimes really repetitive and sometimes really boring and only has half of a satisfying ending, and yet it's still a quick read.",
  ),
];
