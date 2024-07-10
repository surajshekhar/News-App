// import 'package:flutter/material.dart';
// import 'package:newstech/backend/functions.dart';
// import 'package:newstech/components/newsbox.dart';
// import 'package:newstech/components/appbar.dart';
// import 'package:newstech/components/searchbar.dart';
// import 'package:newstech/utils/Constants.dart';
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   late Future<List> news;
//
//   @override
//   void initState() {
//     super.initState();
//     news = fetchnews(); // Call fetchnews() once in initState
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: appbar(),
//       body: Column(
//         children: [
//           SearchBar(), // Assuming SearchBar is a custom widget
//           Expanded(
//             child: Container(
//               width: w,
//               child: FutureBuilder<List>(
//                 future: news, // Use the news Future here
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return ListView.builder(
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context, index) {
//                         return NewsBox(
//                           url: snapshot.data![index]['url'],
//                           imageurl: snapshot.data![index]['urlToImage'] != null
//                               ? snapshot.data![index]['urlToImage']
//                               : Constants.imageurl,
//                           title: snapshot.data![index]['title'],
//                           time: snapshot.data![index]['publishedAt'],
//                           description:
//                               snapshot.data![index]['description'] ?? '',
//                         );
//                       },
//                     );
//                   } else if (snapshot.hasError) {
//                     return Center(
//                       child: Text("Error fetching news: ${snapshot.error}"),
//                     );
//                   } else {
//                     return Center(
//                       child: CircularProgressIndicator(
//                         color: Colors.pink[300],
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:newstech/backend/functions.dart';
import 'package:newstech/components/newsbox.dart';
import 'package:newstech/components/appbar.dart';
import 'package:newstech/components/searchbar.dart';
import 'package:newstech/utils/text.dart';
import 'package:newstech/utils/Constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: appbar(),
        body: Column(
          children: [
            SearchBaring(),
            Expanded(
              child: Container(
                  width: w,
                  child: FutureBuilder<List>(
                    future: fetchnews(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return NewsBox(
                                url: snapshot.data![index]['url'],
                                imageurl:
                                    snapshot.data![index]['urlToImage'] != null
                                        ? snapshot.data![index]['urlToImage']
                                        : Constants.imageurl,
                                title: snapshot.data![index]['title'],
                                time: snapshot.data![index]['publishedAt'],
                                description: snapshot.data![index]
                                        ['description']
                                    .toString(),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      // By default, show a loading spinner.
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.pink[300],
                      ));
                    },
                  )),
            ),
          ],
        ));
  }
}
