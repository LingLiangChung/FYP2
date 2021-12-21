import 'package:flutter/material.dart';

class JobConfirmation extends StatelessWidget {
  const JobConfirmation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}

confirmResult(bool isYes, BuildContext context){
  if(isYes){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: 
        Text('Job Verified')));

  } else{
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: 
        Text('Cancel Action')));
  }
}

rejectResult(bool isYes, BuildContext context){
  if(isYes){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: 
        Text('Job Rejected')));
  } else{
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: 
        Text('Cancel Action')));
  }
}

confirm(BuildContext context, String title){
  return showDialog(
    context: context, 
    barrierDismissible: true,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text(title),
        actions: [
          TextButton(
            onPressed: (){
              confirmResult(false, context);
            }, 
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: (){
              rejectResult(true, context);
            }, 
          child: Text('Yes'),
          )
        ],
      );
    }
  );
}
