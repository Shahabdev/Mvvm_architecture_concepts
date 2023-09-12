import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/auth_view_model.dart';
import '../resources/component/round_button.dart';
import '../utilities/routes/routes_name.dart';
import '../utilities/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        title: Text("sign up"),
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
                title: 'SignUp',
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
                    Utils.FlushToastMessage( context,'enter six digit passward');
                  } else {
                    Map data={
                      'email':_emailController.text.toString(),
                      'password':_passwardController.text.toString()
                    };
                    authModel.SignUpApiModel(data, context);
                    // Utils.FlushToastMessage('welcome', context);
                    print('api hit');
                  }
                }),
            SizedBox(height: height*0.03,),
            InkWell(
                onTap: ()
                {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text('Dont have an account? Sign Up'))
          ],
        ),
      ),
    );
  }
}
