
import 'package:climeto/pages/set_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MainScreen extends StatefulWidget {

  final String cityName;
  final String mainDesc;
  final String desc;
  final String icon;
  final double temp;
  final double? speed;
  final int press;
  final int visib;
  final int humi;

   MainScreen({required this.cityName, required this.mainDesc, required this.desc, required this.icon, required this.temp, required this.speed, required this.press, required this.visib, required this.humi});



  @override
  State<MainScreen> createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0,
        title:  Text(widget.cityName),
      titleSpacing: 2,
      centerTitle: true,),

      body:Column(
        children:  [
           Expanded(
              flex: 1,
      child: SvgPicture.asset('assets/anime_icon/${widget.icon}.svg',
      height:200 ,),
          ),
          //this is the top part of the coloumn
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 10),
            child: Container(
              decoration:const BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(45.0)),

              ),
              child:const Center(
                child: Text(
                  'Friday 20 January',
                  style:TextStyle(
                    color:Colors.black ,
                    fontSize:30,
                    fontWeight: FontWeight.w400,
                  ) ,
                ),
              ),
            ),
          ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: Text(widget.mainDesc,
            style: const TextStyle(
              color:Colors.white ,
              fontSize:30,
              fontWeight: FontWeight.w400,
            ) ,),
          ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            child: Text('${widget.temp.toInt()}°',
              style: const TextStyle(
        color:Colors.white ,
        fontSize:150,
        fontWeight: FontWeight.w600,
    ) ,),
          ),
          //this is day summary part
          Card(
            color: Colors.pinkAccent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(widget.desc,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                    ),),
                  ),
                  const Text('Now it seems that +25°, feelslike  +28° .'
                      'Today, the temperaturee is feit in the rand from +22° to +29°.'),

                ],
              ),
            ),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  SetData(icons:const  Icon(Icons.wind_power), InfoFor: 'Wind', NumData: widget.speed.toString(),),
                  SetData(icons: const Icon(Icons.water_drop), NumData: widget.humi.toString(), InfoFor: 'Humidity'),
                  SetData(icons: const Icon(Icons.remove_red_eye_outlined), NumData: widget.visib.toString(), InfoFor: 'Visibility'),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
