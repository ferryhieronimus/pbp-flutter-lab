import 'package:counter_7/page/mywatchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/widget/drawer.dart';

class WatchListDetailPage extends StatelessWidget {
  final String title;
  final bool watched;
  final double rating;
  final String releasedDate;
  final String review;

  const WatchListDetailPage(
      {Key? key,
        required this.title,
        required this.watched,
        required this.rating,
        required this.releasedDate,
        required this.review})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Watch List',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
        drawer: const DrawerApp(),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 32, color: Colors.black),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Status: ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      watched ? "watched" : "not watched",
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                        "Released Date: ",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      releasedDate,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Rating: " ,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      rating.toString() + "/5",
                      style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Review: " + review,
                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => const MyWatchListPage()),
                    );
                  },
                  child: const Text(
                    "Back",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}