
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled5/provider/navProvider.dart';
import 'package:untitled5/view/home/homescreen.dart';
void main(){
  runApp(ChangeNotifierProvider(
    create: (context){
     return providerscreen();
    },
      child: myapp()));
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home:homescreen()
    );
  }
}
