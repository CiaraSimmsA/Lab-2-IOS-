import 'package:flutter/material.dart';

class Book {
  String title;
  String author;
  int year;
  int pageCount;

  Book(this.title, this.author, this.year, this.pageCount);

  void displayInfo() {
    print("Title: $title");
    print("Author: $author");
    print("Year: $year");
    print("Page Count: $pageCount");
    print("\n");
  }
}

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
  }

  void removeBook(Book book) {
    books.remove(book);
  }

  void displayAllBooks() {
    print("Library Books:");
    for (var book in books) {
      book.displayInfo();
    }
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Library library = Library();

  @override
  Widget build(BuildContext context) {
    // Adding books to the library
    library.addBook(Book("The Great Gatsby", "F. Scott Fitzgerald", 1925, 180));
    library.addBook(Book("To Kill a Mockingbird", "Harper Lee", 1960, 281));
    library.addBook(Book("1984", "George Orwell", 1949, 328));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Book Library Management'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  library.displayAllBooks();
                },
                child: Text('Display All Books'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
