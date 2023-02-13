import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled5/Shared/listView.dart';
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

    return listview(data: Provider.of<providerscreen>(context).data);



  }
}
