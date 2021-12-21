import 'package:flutter/material.dart';
import 'package:jobnow_version_1/constants.dart';
import 'package:jobnow_version_1/screens/admin/home/components/job_detail_two.dart';

class JobVerification extends StatelessWidget {
  const JobVerification({Key? key}) : super(key: key);

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
            Column(
              children: [
                Card(
              title: 'Hire pumbler',
              content: "Required max 1 worker" + '\n' + "with specific skill",
              price: 100,
              duration: 'Duration: 1 day',
              isVisible: false,
              ),
              Card(
                title: 'Hire gardener',
                content: "Required max 1 worker" + '\n' + "with specific skill",
                price: 300,
                duration: 'Duration: 3 days',
                isVisible: false,
              ),
            ],
            ),
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => JobDetailsTwo(),
                          )
                        );
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
// confirmResult(bool isYes, BuildContext context){
//   if(isYes){
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: 
//         Text('Job Verified')));

//   } else{
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: 
//         Text('Cancel Action')));
//   }
// }

// rejectResult(bool isYes, BuildContext context){
//   if(isYes){
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: 
//         Text('Job Rejected')));
//   } else{
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: 
//         Text('Cancel Action')));
//   }
// }

// confirm(BuildContext context, String title){
//   return showDialog(
//     context: context, 
//     barrierDismissible: true,
//     builder: (BuildContext context){
//       return AlertDialog(
//         title: Text(title),
//         actions: [
//           TextButton(
//             onPressed: (){
//               confirmResult(false, context);
//             }, 
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: (){
//               rejectResult(true, context);
//             }, 
//           child: Text('Yes'),
//           )
//         ],
//       );
//     }
//   );
// }
