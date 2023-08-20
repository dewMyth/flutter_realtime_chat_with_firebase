import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Screens
import 'package:flash_chat/screens/chat_screen.dart';

// Widgets
import 'package:flash_chat/common_widgets/rounded_button.dart';

// Costant
import 'package:flash_chat/utils/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  bool isLoading = false;

  late String email;
  late String password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
             Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black54,
                ),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kInputTextFieldDecoration.copyWith(
                    hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true, //To hide the text in the textfield
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                ),
                decoration: kInputTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                text: 'Login',
                onPressed: () async {
                  //Implement login functionality.
                  setState(() {
                    isLoading = true;
                  });
                  try{
                    final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    print(user);
                    if(user != null){
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      isLoading = false;
                    });
                  } catch(e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
        inAsyncCall: isLoading,
      ),
    );
  }
}
