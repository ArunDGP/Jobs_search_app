import 'package:flutter/material.dart';

class RecentJobs extends StatelessWidget {
  final String image;
  final String jobtitle;
  final String comapnyname;
  final String salary;
  RecentJobs(this.image, this.jobtitle, this.comapnyname, this.salary);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: Colors.white,
          child: ListTile(
           // tileColor: Colors.red,
            leading: Image.asset(image,height: 55, width: 55,),
            title: Text(jobtitle),
            subtitle: Text(comapnyname),
            trailing: Text(salary),
          ),
        ),
      ),
    );
  }
}
