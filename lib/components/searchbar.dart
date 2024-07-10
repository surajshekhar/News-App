import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newstech/backend/functions.dart';

class SearchBaring extends StatefulWidget {
  const SearchBaring({Key? key}) : super(key: key);
  static TextEditingController searchcontroller =
      TextEditingController(text: '');

  @override
  _SearchBaringState createState() => _SearchBaringState();
}

class _SearchBaringState extends State<SearchBaring> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Expanded(
                    child: TextField(
                  controller: SearchBaring.searchcontroller,
                  decoration: InputDecoration(
                      hintText: 'Search a Keyword or a Phrase',
                      hintStyle: GoogleFonts.lato(),
                      border: InputBorder.none),
                ))
              ],
            )),
          ),
        ),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            fetchnews();
          },
          child: Container(
            width: 45,
            height: 45,
            // decoration:
            // BoxDecoration(color: Colors.pink[100], shape: BoxShape.circl),
            child: Icon(
              Icons.search,
              color: Colors.pink,
            ),
          ),
        ),
        SizedBox(width: 10)
      ],
    );
  }
}
