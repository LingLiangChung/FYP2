import 'package:flutter/material.dart';
import 'package:jobnow_version_1/screens/admin/home/components/job/send_notification.dart';
import 'package:jobnow_version_1/screens/admin/home/components/job/send_reject_notify.dart';
import 'package:jobnow_version_1/service/http_service.dart';
import 'jobs_model.dart';

class JobDetail extends StatelessWidget {
  final JobsModel job;
  final HttpService httpService = HttpService();
  JobDetail({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFAB47BC),
          title: Text(job.jobTitle),
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
                        title: Text("Title"),
                        subtitle: Text(job.jobTitle),
                      ),
                      ListTile(
                        title: Text("Job Content"),
                        subtitle: Text("${job.jobContent}"),
                      ),
                      ListTile(
                        title: Text("Total Payment(RM)"),
                        subtitle: Text(job.totalPayment.toString()),
                      ),
                      ListTile(
                        title: Text("Start Date"),
                        subtitle: Text(job.startDateAt),
                      ),
                      ListTile(
                        title: Text("End Date"),
                        subtitle: Text(job.endDateAt),
                      ),
                      ListTile(
                        title: Text("Start Time"),
                        subtitle: Text(job.startTimeAt),
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
                                  builder: (context) => SendNotification(),
                                ),
                              );
                            },
                            child: Text('Approve',
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
                              await httpService.deleteJob(job.id);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SendRejectNotification(),
                                ),
                              );
                            },
                            child: Text('Reject',
                            style: TextStyle(
                              color: Colors.white
                            )),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.redAccent
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}