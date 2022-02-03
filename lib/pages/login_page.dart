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
  final _formkey= GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    if(_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoute.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
    child: Form(
      key: _formkey,
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
                  validator: (value){
                    if(value!.isEmpty){
                      return "Username cannot be empty";
                    }
                    return null;
                   },
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
                  validator: (value){
                    if(value!.isEmpty){
                      return "Password cannot be empty";
                    }
                    else if(value.length<6){
                      return "Password length should be atleast 6";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changeButton?20:8),
                  child: InkWell(
                    splashColor: Colors.red,
                    onTap: ()=> (moveToHome(context)),
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
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    );
  }
}
