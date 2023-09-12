import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../utilities/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPrefrence=Provider.of<UserViewModel>(context);
    return  Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: (){
                userPrefrence.removeUser().then((value){
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: Text('Log out'))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: ),


        ],
      ),
    );
  }
}
