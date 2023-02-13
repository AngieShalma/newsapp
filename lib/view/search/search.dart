import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled5/Shared/listView.dart';
import 'package:untitled5/provider/navProvider.dart';
import '../home/homescreen.dart';
class searchscreen extends StatelessWidget {
  const searchscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: const Icon(Icons.arrow_back,size: 20,color: Colors.blue,),onPressed: (){
          Navigator.pop(context, MaterialPageRoute(builder:(context){
            return const homescreen();
          }));
        },),
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height/8,
        elevation: 0,
        title:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            onChanged: (value){
              Provider.of<providerscreen>(context,listen: false).search(keyword: value);
            },
            decoration: InputDecoration(
              hintText: 'search',
              suffixIcon: const Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.blue,

                  )
              ),
              focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.blue,

                  )
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Provider.of<providerscreen>(context).loadingSearch==true?
                const Center(child:  CircularProgressIndicator(),)
            :Expanded(child: listview(data: Provider.of<providerscreen>(context).searchData))
          ],
        ),
      ),
    );
  }
}
