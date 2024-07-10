import 'package:flutter/material.dart';

import 'package:newstech/utils/text.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  appbar({Key? key})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [],
      backgroundColor: Colors.teal[600],
      elevation: 0,
      title: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              boldText(text: 'Geek', size: 20, color: Colors.white),
              modifiedText(text: 'Genesis', size: 20, color: Colors.white)
            ],
          )),
      centerTitle: true,
    );
  }
}
