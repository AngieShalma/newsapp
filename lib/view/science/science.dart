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

import '../../Shared/listView.dart';
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
    listview(data: Provider.of<providerscreen>(context).data);
  }
}