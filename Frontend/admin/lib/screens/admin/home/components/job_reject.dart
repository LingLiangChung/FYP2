import 'package:flutter/material.dart';
import 'package:jobnow_version_1/constants.dart';
import 'package:jobnow_version_1/screens/admin/home/components/body.dart';

class JobReject extends StatelessWidget {
  const JobReject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        title: Text(
        'Jobs Verification',
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Row(
          children: <Widget>[
            Center(
              child: TextButton(onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Body(),
                  )
              );
              }, 
              child: Text('Nothings here please back to home page',
              style: TextStyle(
                color: Colors.red,
              ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.transparent
              ),
              ),
            )
          ],
        ),
      )
    );
  }
}


class Card extends StatelessWidget {
  const Card({ 
    Key? key,
    required this.title,
    required this.content,
    required this.price,
    required this.duration,
    required this.isVisible
    }) : super(key: key);

    final String title,content,duration;
    final int price;
    final bool isVisible;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 5,
      ),
      width: size.width,
      child: 
      SingleChildScrollView(
        child: Column(
        children: [
          GestureDetector(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding/2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purpleAccent,
                  )
                ]
                ),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          
                        ),
                        children: [
                          TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button
                          ),
                          TextSpan(
                            text: "$content\n".toUpperCase(),
                          ),
                          TextSpan(
                            text: "$duration\n".toUpperCase(),
                          ),
                          TextSpan(
                            style: TextStyle(
                            
                            ),
                            text: '\RM$price'
                          )
                        ],
                        ),
                    ),
                    Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.greenAccent,
                      ),
                      onPressed: (){
                        
                      }, 
                      child: Text(
                        'Approve',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.redAccent,
                      ),
                      onPressed: (){
                      }, 
                      child: Text(
                        'Reject',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}