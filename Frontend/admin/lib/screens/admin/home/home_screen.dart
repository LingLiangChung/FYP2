import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobnow_version_1/screens/admin/home/components/body.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var nameController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFF176),
                  Color(0xFFFFF59D),
                  Color(0xFFFFF176),
                ]
              ),
            ),
          ),
          Padding(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Admin Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    height: 60,
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.password)
                    ),
                  ),
                  SizedBox(height: 45,),
                  OutlinedButton.icon(
                    onPressed: (){
                      login();
                    }, 
                  icon: Icon(
                    Icons.login,
                    size: 18,
                    color: Colors.black,
                  ), 
                  label: Text('Login',
                  style: TextStyle(
                    color: Colors.black
                  ),)),
                ],
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
  Future<void> login() async {
    if(passController.text.isNotEmpty && nameController.text.isNotEmpty){
      var response = await http.post(Uri.parse("http://192.168.0.136:8000/api/admin_login"),
      body: ({
        'name':nameController.text,
        'password':passController.text,
      }));
      if(response.statusCode==201){
        Navigator.push(context, 
          MaterialPageRoute(
            builder: (context) => Body()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: 
            Text("Invalid Credentials")));

      }
    } else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Blank Fields Not Allowed")));
    }
  }
}

