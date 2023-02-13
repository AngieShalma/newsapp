import 'package:flutter/material.dart';

import '../webscreen/webscreen.dart';
class listview extends StatelessWidget {
   listview({Key? key,required this.data}) : super(key: key);
List data;
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(itemBuilder:(context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=>webscreen(url: data[index]['url'],title: data[index]['title'],)));
          },
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    width: 100,
                    height: MediaQuery.of(context).size.height*0.15,
                    placeholder: 'assets/images/placeholder Image.png',
                    image: data[index]['urlToImage']??'',
                    imageErrorBuilder: (c,v,b){
                      return Image.asset('assets/images/placeholder Image.png');
                    },),

                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data[index]['title']??'',
                      style: TextStyle(
                          fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${data[index]['publishedAt']??''}' ,style: TextStyle(
                        fontWeight: FontWeight.bold,color: Colors.blue),),

                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
        separatorBuilder:(context,index){
          return Divider(
            thickness: 1,
          );
        }, itemCount:data.length);
  }
}
