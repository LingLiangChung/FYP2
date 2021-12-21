import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobnow_version_1/screens/admin/home/components/job/jobs.dart';
import 'package:jobnow_version_1/screens/admin/home/components/user/users.dart';
import 'employer/employers.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                      color: Color(0xFFFFF176),
                      child: Center(
                        child: Text(
                          'Name: Admin 2',
                            style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                        ),
                      ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                      color: Color(0xFFFFF176),
                      child: Center(
                        child: Text(
                          'ID: admin_2',
                            style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                        ),
                      ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          InkWell(
            onTap: (){
              //display jobs that need verify
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => JobsPage(),
                  )
              );
            },
            child: Ink(
              height: 60,
              width: MediaQuery.of(context).size.width/3,
              decoration: BoxDecoration(
                color: Color(0xFFAB47BC),
              ),
              child: Icon(Icons.work, color: Colors.white,),
            ),
          ),
          InkWell(
            onTap: (){
              //display jobs that need verify
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => JobseekerPage(),
                  )
              );
            },
            child: Ink(
              height: 60,
              width: MediaQuery.of(context).size.width/3,
              decoration: BoxDecoration(
                color: Color(0xFFAB47BC),
              ),
              child: Icon(Icons.supervised_user_circle, color: Colors.white,),
            ),
          ),
          InkWell(
            onTap: (){
              //display jobs that need verify
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EmployerPage(),
                  )
              );
            },
            child: Ink(
              height: 60,
              width: MediaQuery.of(context).size.width/3,
              decoration: BoxDecoration(
                color: Color(0xFFAB47BC),
              ),
              child: Icon(Icons.supervised_user_circle_outlined, color: Colors.white,),
            ),
          ),

        ],
      ),
    );
  }
}
AppBar buildAppBar(){
  return AppBar(
    elevation: 4,
    title: Text('Admin Page'),
    centerTitle: true,
    backgroundColor: Color(0xFFAB47BC),
    automaticallyImplyLeading: false,
  );
}