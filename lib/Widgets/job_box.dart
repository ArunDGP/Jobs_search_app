import 'package:flutter/material.dart';

class JobBox extends StatelessWidget {
  final String image;
  final String jobtitle;
  final String salary;
  JobBox(this.image,this.jobtitle,this.salary);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 50,
          width: 180,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Image.asset(image,height: 55, width: 55,),
                Container(color: Colors.grey.shade200,child: Center(child:
                Text('Full Time',style: TextStyle(fontSize: 15),)),)
              ],),
              Column(
                children: [
                  Text(jobtitle,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text(salary,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                ],
              ),

            ],),
          ),
        ),
      ),
    );
  }
}
