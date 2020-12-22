import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Form Validation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            autovalidate: true,
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  //validator: emailvalidate,
                  // Validate using Plugin
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Required'),
                    EmailValidator(errorText: 'Invalid Email'),
                  ]),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  obscureText: true,

                  //Validate Without using Plugin
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'required';
                    } else {
                      if (value.length < 6) {
                        return 'More than 6 numbers required';
                      } else {
                        return null;
                      }
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: RaisedButton(
                    onPressed: validate,
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validate() {
    if (formkey.currentState.validate()) {
      print('OK');
    } else {
      print('Error');
    }
  }

  // String emailvalidate(value) {
  //   if (value.isEmpty) {
  //     return 'Error';
  //   } else {
  //     return null;
  //   }
  // }
}
