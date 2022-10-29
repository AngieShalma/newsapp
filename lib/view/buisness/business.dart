import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled5/provider/navProvider.dart';

class business extends StatefulWidget {
  const business({Key? key}) : super(key: key);

  @override
  State<business> createState() => _businessState();
}

class _businessState extends State<business> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<providerscreen>(context,listen: false).getDataFromApi(categoryname: 'business');

  }
  Widget build(BuildContext context) {

    return ListView.separated(itemBuilder:(context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
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
                  image: Provider.of<providerscreen>(context).data[index]['urlToImage']??'',
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
                  Text(Provider.of<providerscreen>(context).data[index]['title']??'',
                    style: TextStyle(
                        fontWeight: FontWeight.bold),
                    maxLines: 3,
                  overflow: TextOverflow.ellipsis,),
                  SizedBox(
                   height: 10,
                  ),
                  Text('${Provider.of<providerscreen>(context).data[index]['publishedAt']??''}' ,style: TextStyle(
                   fontWeight: FontWeight.bold,color: Colors.blue),),

                ],
              ),
            ),
          ],
        ),
      );
    },
        separatorBuilder:(context,index){
         return Divider(
           thickness: 1,
         );
    }, itemCount:Provider.of<providerscreen>(context).data.length);



  }
}
