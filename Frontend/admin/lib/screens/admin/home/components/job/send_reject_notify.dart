import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../body.dart';

final String phoneNum = "123456789";

launchEmail() async {
  launch("mailto:employer@gmail.com?subject=Job Verification Result&body=Your job is rejected%20");
}

Widget cardEmail(BuildContext context){
  return InkWell(
    onTap: (){
      launchEmail();
    },
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.email,
            color: Colors.black,
            size: 100,
          ),
          Text('via Email'),
        ],
      ),
    ),
  );
}

Widget cardPhoneCall(BuildContext context){
  return InkWell(
    onTap: (){
      launch('sms:+12 3456789122?body=Your job is rejected');
    },
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            color: Colors.black,
            size: 100,
          ),
          Text('via SMS'),
        ],
      ),
    ),
  );
}
class SendRejectNotification extends StatelessWidget {
  const SendRejectNotification({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAB47BC),
        title: Text('Send Notification'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: [
                        cardEmail(context),
                        cardPhoneCall(context),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Body(),
                        ),
                      );
                    },
                    child: Text('Back to home',
                        style: TextStyle(
                            color: Colors.white
                        )),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFAB47BC),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}