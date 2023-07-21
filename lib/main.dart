import 'package:climeto/pages/search_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Climeto());
}

class Climeto extends StatelessWidget {
  const Climeto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark(),
      // theme: ThemeData(
      //   colorScheme:const ColorScheme.dark(
      //     primary: Colors.pinkAccent,
      //     background: Colors.pinkAccent
      //   )
      // ),
      debugShowCheckedModeBanner: false,
      home: const SearchPage(),

    );
  }
}
