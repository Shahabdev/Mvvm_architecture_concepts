import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/view_model/auth_view_model.dart';
import 'package:mvvm_provider/resources/component/round_button.dart';
import 'package:mvvm_provider/utilities/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../utilities/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwardController = TextEditingController();

  ValueNotifier<bool> _passwardObsecure = ValueNotifier<bool>(true);

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwardFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final authModel=Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("log in"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  label: Text('email'),
                  hintText: 'email',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.blue),
                  )),
              onFieldSubmitted: (val) {
                Utils.ShowFocusNode(
                    _emailFocusNode, _passwardFocusNode, context);
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
            ValueListenableBuilder(
                valueListenable: _passwardObsecure,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwardController,
                    focusNode: _passwardFocusNode,
                    obscuringCharacter: '*',
                    obscureText: _passwardObsecure.value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text('passward'),
                      hintText: 'passward',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          _passwardObsecure.value = !_passwardObsecure.value;
                        },
                        child: _passwardObsecure.value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: height * 0.13,
            ),
            RoundButton(
              loading: authModel.loading,
                title: 'Login ',
                onPress: () {
                  if (_emailController.text.isEmpty) {
                          // flutter toastmessage
                   // Utils.ToastMessage('please enter email');

                         //flushbarmessage
                    Utils.FlushToastMessage( context,'please enter email');
                  } else if (_passwardController.text.isEmpty) {
                   // Utils.ToastMessage('please enter passward');
                    Utils.FlushToastMessage( context,'please enter passward');
                  } else if (_passwardController.text.length < 6) {
                   // Utils.ToastMessage('enter six digit passward');
                    Utils.FlushToastMessage(context,'enter six digit passward');
                  } else {
                     Map data={
                       'email':"eve.holt@reqres.in",
                       'password':"cityslicka"
                     };
                    authModel.loginApimodel(data, context);
                   // Utils.FlushToastMessage('welcome', context);
                    print('api hit');
                  }
                }),
            SizedBox(height: height*0.03,),
            InkWell(
                onTap: ()
                {
                  Navigator.pushNamed(context, RoutesName.signUp);
                },
                child: Text('Dont have an account? Sign Up'))
          ],
        ),
      ),
    );
  }
}
