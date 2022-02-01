import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalogue/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name="";
  bool changeButton=false;

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
        Text("Welcome $name",
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
                onChanged: (value){
                  name=value;
                  setState(() {
                  });
                },
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

              InkWell(
                onTap: () async {
                  setState(() {
                    changeButton=true;
                  });

                  await Future.delayed(Duration(seconds: 1));
                  Navigator.pushNamed(context, MyRoute.homeRoute);
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: changeButton? 120:150,
                  height: 48,
                  alignment: Alignment.center,
                  child: changeButton?(
                  Icon(Icons.done,
                  color: Colors.white,)
                  ):
                  Text("Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeButton?20:8),
                  ),
                ),
              ),

              // ElevatedButton(onPressed: (){
              //   Navigator.pushNamed(context, MyRoute.homeRoute);
              // }, child: Text("Login"),
              // style: TextButton.styleFrom(minimumSize: Size(150, 48)),
              // ),
            ],
          ),
        )
      ],
    ),
    );
  }
}
