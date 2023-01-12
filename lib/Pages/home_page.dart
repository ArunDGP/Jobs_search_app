import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_search/Widgets/job_box.dart';
import 'package:job_search/Widgets/recent_jobs.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  void signOut() async {
    showDialog(context: context, builder: (context) {
      return Center(child: CircularProgressIndicator());
    } );
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pop();
  }

  var padding = EdgeInsets.symmetric(vertical: 16,horizontal: 25);

  List jobs = [
    ['lib/images/facebook.png', 'Software Eng.', '\$3000/mon.'],
   ['lib/images/apple.jpg', 'Software Eng.', '\$2800/mon.'],
   ['lib/images/amazon.jpg', 'Sr. Manager', '\$3500/mon.'],
   ['lib/images/google.jpg', 'Tech. Head', '\$3200/mon.'],
    ['lib/images/amazon.jpg', ' Data Analyst ', '\$2800/mon.'],
    ['lib/images/facebook.png', 'Mobile App Dev.', '\$2000/mon.'],
  ];

   List recentjobs = [
     ['lib/images/google.jpg', 'Team Leader ','Google', '\$3300/mon.'],
     ['lib/images/amazon.jpg', ' Data Analyst ','Amazon', '\$2800/mon.'],
     ['lib/images/facebook.png', 'Mobile App Dev.','Facebook', '\$2000/mon.'],
     ['lib/images/apple.jpg', 'Ass. Director','Apple', '\$2500/mon.'],
     ['lib/images/facebook.png', 'Software Eng.','Facebook', '\$3000/mon.'],
     ['lib/images/apple.jpg', 'Software Eng.','Apple', '\$2800/mon.'],
     ['lib/images/amazon.jpg', 'Sr. Manager','Amazon', '\$3500/mon.'],
     ['lib/images/google.jpg', 'Tech. Head','Google', '\$3200/mon.'],
   ];

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
       body: Container(color: Colors.lightGreenAccent.shade100,
       child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
           Padding(
             padding: padding,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
               Icon(Icons.menu_book,size: 45,),
               Column(
                 children: [
                   GestureDetector(
                       onTap: signOut,
                       child: Icon(Icons.logout_rounded, size: 40,)),
                   Text('Logout',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
                 ],
               )
             ],),
           ),
           Padding(
             padding: EdgeInsets.symmetric(horizontal: 25),
             child: Text('Find your wishful jobs', style: GoogleFonts.lobster(textStyle:TextStyle(color: Colors.black, fontSize: 28),)),
           ),
            Padding(
              padding: padding,
              child: Row(
                children: [
                  Expanded(child: Container(
                      decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, size: 35,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8,right: 8),
                              child: TextField(
                                  decoration: InputDecoration(hintText: 'job search...', hintStyle: TextStyle(fontSize:15, color: Colors.grey.shade600),
                                      border: InputBorder.none),),
                            ),
                          ),
                        ],
                      ))),
                  SizedBox(width: 10,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ElevatedButton(onPressed: (){},
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade200,),),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 14, bottom: 14),
                          child: Text('search', style: TextStyle(fontSize:15, color: Colors.grey.shade600),),
                        )),
                  ),
                ],
              ),
            ),
             Padding(
               padding: const EdgeInsets.only(left: 10,right: 10),
               child: Divider(thickness: 1,color: Colors.black,),
             ),
             Padding(
               padding: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
               child: Text('Jobs for you', style: GoogleFonts.lobster(textStyle: TextStyle(color: Colors.black, fontSize: 28),)),
             ),
             Container(height: 130,
               child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: jobs.length,
                   itemBuilder: (context, index) {
                 return JobBox(jobs[index][0],jobs[index][1],jobs[index][2],);
               }),
             ),
             Padding(
               padding: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
               child: Text('Recent searches', style: GoogleFonts.lobster(textStyle: TextStyle(color: Colors.black, fontSize: 28),),)
             ),
             Expanded(
               child: ListView.builder(
                   itemCount: recentjobs.length ,
                   itemBuilder: (context, i) =>
                       RecentJobs(recentjobs[i][0], recentjobs[i][1], recentjobs[i][2], recentjobs[i][3])

               ),
             )
         ],),
       ),
       ),
                               // List recentjobs = [
      //      ['lib/images/google.jpg', 'Team Leader ', '\$3300/mon.'],
    );
  }
}
