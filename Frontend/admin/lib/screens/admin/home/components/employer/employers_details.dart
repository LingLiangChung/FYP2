import 'package:flutter/material.dart';
import 'package:jobnow_version_1/screens/admin/home/components/body.dart';
import 'package:jobnow_version_1/screens/admin/home/components/user/users_model.dart';
import 'package:jobnow_version_1/service/http_service.dart';

import 'employers_model.dart';

class EmployerDetail extends StatelessWidget {
  final EmployerModel employer;
  final HttpService httpService = HttpService();
  EmployerDetail({required this.employer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFAB47BC),
          title: Text("Employer List"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Name"),
                        subtitle: Text(employer.name),
                      ),
                      ListTile(
                        title: Text("Contact Number"),
                        subtitle: Text("${employer.contactNumber}"),
                      ),
                      ListTile(
                        title: Text("Email"),
                        subtitle: Text(employer.email),
                      ),
                      ListTile(
                        title: Text("IC"),
                        subtitle: Text("${employer.nric}"),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(120, 5, 0, 0),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Body(),
                                ),
                              );
                            },
                            child: Text('Legal',
                                style: TextStyle(
                                    color: Colors.white
                                )),
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xFFAB47BC)
                            ),
                          ),
                          SizedBox(width: 10,),
                          TextButton(
                            onPressed: () async {
                              await httpService.deleteEmployer(employer.id);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Body(),
                                ),
                              );
                            },
                            child: Text('Block',
                                style: TextStyle(
                                    color: Colors.white
                                )),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.redAccent
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}