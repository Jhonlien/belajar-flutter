import 'package:flutter/material.dart';
import '../mixins/validation.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}
//(with Validation) mengambil class validation yang telah dibuat pada validation.dart

class _RegisterScreenState extends State<RegisterScreen> with Validation{
  //membuat global key untuk validasi
  final formKey = GlobalKey<FormState>(); 
  
  //definisikan 3 variable
  String name ='';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey, //menggunakan global key
        child: Column(
          children: <Widget>[
            nameField(),
            emailField(),
            passwordField(),
            registerButton(),
          ],
        ),
      ),
    );
  }

  Widget nameField(){
  return TextFormField(
    decoration : InputDecoration(
      labelText: 'Nama Lengkap'
    ),
    validator: validateName, onSaved: (String value){
      name = value;
    },//panggil function validasi pada file validation.dart
  );
}

Widget emailField(){
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration : InputDecoration(
      labelText: 'Email',
      hintText: 'email@example.com'
    ),
        validator: validateEmail, onSaved: (String value){
      email = value;
    },
  );
}

Widget passwordField(){
  return TextFormField(
    obscureText: true,
    decoration : InputDecoration(
      labelText: 'Password',
      hintText: 'Enter Password'
    ),
        validator: validatePassword, 
        onSaved: (String value){
          password = value;
        },
  );
}

Widget registerButton(){
  return SizedBox(
    width: double.infinity,
    child: 
      RaisedButton(
        onPressed: (){
          //form key merupakan global key, kemudian diikuti dengan currentstate
          if(formKey.currentState.validate()){
            formKey.currentState.save();
            print('Nama : $name');
            print('email: $email');
            print('password: $password');
          }
        },
        color: Colors.blueAccent,
        child: Text('Register', style: TextStyle(color: Colors.white),),
      )
  );
}
}

