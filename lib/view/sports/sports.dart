import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Shared/listView.dart';
import '../../provider/navProvider.dart';
class sports extends StatefulWidget {
  const sports({Key? key}) : super(key: key);

  @override
  State<sports> createState() => _sportsState();
}

class _sportsState extends State<sports> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<providerscreen>(context, listen: false).getDataFromApi(
        categoryname: 'sports');

  }
  @override
  Widget build(BuildContext context) {

    return  Provider.of<providerscreen>(context).loading==true?
    Center(
      child: CircularProgressIndicator(),
    ):
    listview(data: Provider.of<providerscreen>(context).data);
  }
}



