import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
    child: Column(
      children: [
        Image.asset("assets/images/login_image.png",
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text("Welcome",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 16),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Username",
                  labelText: "Enter Username",
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Enter Password",
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(onPressed: (){
                print("Login Successful");
              }, child: Text("Login"),
              style: TextButton.styleFrom(),
              ),
            ],
          ),
        )
      ],
    ),
    );
  }
}
