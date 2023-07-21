
import 'package:flutter/material.dart';

class SetData extends StatelessWidget {
  final  Icon icons;
  final String NumData;
  final String InfoFor;
  SetData({
    super.key, required this.icons, required this.NumData, required this.InfoFor,
  });


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
              icons,
            SizedBox(height: 20,),
            Text(NumData),
            SizedBox(height: 20,),
            Text(InfoFor),//different size
          ],
        ),
      ),
    );
  }
}
