import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Request extends StatelessWidget{
  Request({Key?key}):super(key:key);
@override
Widget build(BuildContext context){
return Scaffold(appBar:AppBar(title:Text("Request age")),
body:
Positioned(child:Container(
  child:Column(children: [
    Row(children: [
      Text("To:"),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child:
           TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              //labelText: 'Username',
            ),
          ),
      ),
    ],),
    TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    //hintText: 'Enter a search term',
  ),
)
    
    
  ],))
));
}
}