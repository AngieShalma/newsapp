import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled5/view/buisness/business.dart';
import 'package:untitled5/view/science/science.dart';
import 'package:untitled5/view/sports/sports.dart';
import '../../provider/navProvider.dart';
class homescreen extends StatelessWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.white,
              title: Text('News App'),
              actions: [
                IconButton(icon:Icon(Icons.search), onPressed: (){},),
                IconButton(icon:Icon(Icons.lightbulb), onPressed: (){},),
              ],
              bottom: TabBar(
                tabs: [
                  Tab(text:'Business',icon:Icon(Icons.business) ,),
                  Tab(text:'science',icon:Icon(Icons.science) ,),
                  Tab(text:'sports',icon:Icon(Icons.sports) ,),
                ],
              ),
            ),
          body:TabBarView(
            children: [
              business(),
              science(),
              sports(),
            ],
          ),
          ),
        );


  }
}
