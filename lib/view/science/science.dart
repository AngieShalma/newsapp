// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../provider/navProvider.dart';
// class science extends StatefulWidget {
//   const science({Key? key}) : super(key: key);
//
//   @override
//   State<science> createState() => _scienceState();
// }
//
// class _scienceState extends State<science> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Provider.of<providerscreen>(context, listen: false).getDataFromApi(
//         categoryname: 'science');
//   }
//     Widget build(BuildContext context) {
//     return Container(
//       child: Text('science'),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:untitled5/provider/navProvider.dart';
class science extends StatefulWidget {
  const science({Key? key}) : super(key: key);

  @override
  State<science> createState() => _SciencesScreenState();
}

class _SciencesScreenState extends State<science> {
  initState( ) {
    super.initState();
    Provider.of<providerscreen>(context,listen:false).getDataFromApi(categoryname: 'science');
  }

  Widget build(BuildContext context) {
    return  Provider.of<providerscreen>(context).loading==true?
    Center(
      child: CircularProgressIndicator(),
    ):
    ListView.separated(
      itemBuilder: (ctx,index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                    ),
                    clipBehavior: Clip.antiAlias,
                    child: FadeInImage.assetNetwork(
                      height:130 ,
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/loadingPicture.jpg',
                      image:    Provider.of<providerscreen>(context).data[index]['urlToImage']??'',
                      imageErrorBuilder: (c,v,b )  {
                        return Image.asset('assets/images/loadingPicture.jpg');
                      },
                    )
                ),
              ),
              SizedBox( width: 10,) ,
              Expanded(
                flex: 4,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${
                            Provider.of<providerscreen>(context).data[index]['title']??''
                        }',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(height: 10,),
                      Text( '${
                          Provider.of<providerscreen>(context).data[index]['publishedAt']??''
                      }',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                        ),)
                    ]

                ),
              )
            ],
          ),
        );
      },
      itemCount:
      Provider.of<providerscreen>(context).data.length
      ,
      separatorBuilder: (ctx,index){
        return Divider(
          height: 1,
          thickness: 1.5,

        );
      },
    );
  }
}