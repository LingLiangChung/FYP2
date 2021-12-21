import 'package:flutter/material.dart';
import 'package:jobnow_version_1/screens/admin/home/components/job/jobs_model.dart';
import 'package:jobnow_version_1/screens/admin/home/components/user/users_details.dart';
import 'package:jobnow_version_1/service/http_service.dart';

import 'employers_details.dart';
import 'employers_model.dart';

class EmployerPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAB47BC),
        title: Text("Employers Management"),
      ),
      body: FutureBuilder(
        future: httpService.getEmployer(),
        builder: (BuildContext context, AsyncSnapshot<List<EmployerModel>> snapshot) {
          if (snapshot.hasData) {
            List<EmployerModel>? employers = snapshot.data;
            return ListView(
              children: employers!
                  .map(
                    (EmployerModel employer) => ListTile(
                  title: Text( "Name: " + employer.name),
                  subtitle: Text( "Contact Number: " + "${employer.contactNumber}"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EmployerDetail(
                        employer: employer,
                      ),
                    ),
                  ),
                ),
              )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}