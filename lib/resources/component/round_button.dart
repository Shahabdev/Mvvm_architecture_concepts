import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/resources/component/Colors.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onPress;
  String title;
 final bool loading;
 RoundButton(
      {Key? key, required this.title, this.loading=false, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 220,
        height: 50,
        child: Center(
            child: loading ?CircularProgressIndicator(color: Colors.white
              ,):Text(
          title,
          style: TextStyle(fontSize: 20, color: AppColors.white),
        )),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.buttonColor,
        ),
      ),
    );
  }
}
