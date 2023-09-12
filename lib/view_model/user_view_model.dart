import 'package:flutter/material.dart';
import 'package:mvvm_provider/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class  UserViewModel with ChangeNotifier{
Future<bool> savUser(UserModel user) async
{
  final SharedPreferences sp= await SharedPreferences.getInstance() ;
  sp.setString("token", user.token.toString());
  notifyListeners();
  return true;
}
 Future<UserModel> getUser() async
 {
   final SharedPreferences sp=await SharedPreferences.getInstance();
   final String? token=sp.getString("token");
   return UserModel(
     token: token.toString()
   );
 }

 Future<void> removeUser()
 async{
   final SharedPreferences sp=await SharedPreferences.getInstance();
   sp.remove('token');
   sp.clear();

 }

}