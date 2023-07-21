import 'package:climeto/pages/data_modal.dart';
import 'package:climeto/pages/main_screen.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {


  const SearchPage({super.key, });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
     final dataService=DataService();
     final  textController=TextEditingController();

     @override
  void dispose() {
    // TODO: implement dispose
    textController.dispose();
        super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
       crossAxisAlignment: CrossAxisAlignment.center,
     mainAxisAlignment: MainAxisAlignment.center,
     children:[ Padding(
       padding:const EdgeInsets.symmetric(horizontal: 50),
       child: Center(
            child: TextField(
              controller: textController,
            ),
       ),
     ),
      const Padding(
         padding:  EdgeInsets.symmetric(horizontal: 50),
         child:  Divider(height: 2,thickness: 3,),
       ),
       Center(child: Padding(
         padding: const EdgeInsets.symmetric(vertical: 20),
         child: TextButton(onPressed:moveTo, child:const Text('Search'),),
       ))

      ]),
    );
  }

  void moveTo() async {
         final   response=await dataService.getWeather(textController.text);
         print(response);
           Navigator.push(context,MaterialPageRoute(builder: (context){
           return MainScreen(cityName: response.cityName ,
               mainDesc:  response.weather.maindesc, desc:response.weather.description,
               icon: response.weather.icon,
               temp:  response.temp.temperature,press:response.temp.pressure,
               visib: response.visibility, humi:response.temp.humidity,
           speed: response.wind.speed,);


         }));
   }

}

