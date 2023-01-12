import 'package:flutter/material.dart';
import 'package:job_search/Widgets/my_textfield.dart';
import 'package:job_search/Widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool signUp = false;
  void toggleScreen() {
    setState((){
      signUp = !signUp;
    });
  }
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  Future usersignUp() async {
    FocusManager.instance.primaryFocus?.unfocus();
    showDialog(context: context, builder: (context) {
      return Center(child: CircularProgressIndicator());
    } );
    try {
      if(passwordController.text == confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        Navigator.of(context).pop();
      } else  {
        Navigator.of(context).pop();
        wrongCfmPassword();
        //Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (error){
      Navigator.of(context).pop();
      if(error.code == 'user-not-found') {
        wrongEmail();
      } else if(error.code == 'wrong-password') {
        wrongPassword();
      }
    }
  }

  Future usersignIn() async {
    FocusManager.instance.primaryFocus?.unfocus();
    showDialog(context: context, builder: (context) {
      return Center(child: CircularProgressIndicator());
    } );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.of(context).pop();

    } on FirebaseAuthException catch (error){
      Navigator.of(context).pop();
      if(error.code == 'user-not-found') {
        wrongEmail();
      } else if(error.code == 'wrong-password') {
        wrongPassword();
      }
    }
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  void wrongEmail() {
    showDialog(context: context, builder: (context) {
      return AlertDialog(title: Text('Wrong E-mail!'),);
    });
  }
  void wrongPassword() {
    showDialog(context: context, builder: (context) {
      return AlertDialog(title: Text('Wrong Password!'),);
    });
  }
  void wrongCfmPassword() {
    showDialog(context: context, builder: (context) {
      return AlertDialog(title: Text('Passwords don\'t match!'),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.grey[300],
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/originals/68/c8/a4/68c8a4096dff9cfb438214c63459752c.jpg'),
              fit: BoxFit.fill  )),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 17),
                Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle,),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(65),
                    child: Image.network(
                      fit:BoxFit.fill,
                        'https://th.bing.com/th/id/OIP.cG_zQSUV1TBDuCaSgnzRZgHaHa?pid=ImgDet&w=512&h=512&rs=1',
                        height: 100),
                  ),
                ),
                const SizedBox(height: 22),
                const Text('Are you ready for getting a job?',
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,),),
                const SizedBox(height: 30),
                MyTextField('E-mail', false, emailController),
                const SizedBox(height: 13),
                MyTextField('Password', true, passwordController),
                const SizedBox(height: 13),

                if(signUp) MyTextField('Confirm password', true, confirmpasswordController),
                const SizedBox(height: 13),

                if(signUp) MyButton(usersignUp , 'Sign Up')
                else MyButton(usersignIn, 'Sign In'),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Divider(thickness: 1, color: Colors.black26)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Text('Or continue with',
                            style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white, backgroundColor: Colors.black)),
                      ),
                      const Expanded(
                          child: Divider(
                        thickness: 1,
                        color: Colors.black26,
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 17),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('lib/images/google.jpg', height: 65),
                      const SizedBox(
                        width: 12,
                      ),
                      Image.asset('lib/images/apple.jpg', height: 65)
                    ],
                  ),
                ),
                //const SizedBox(height: 30),
                if(signUp)
                  Container(
                    padding: const EdgeInsets.only(top: 8,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already a member?", style: TextStyle(color: Colors.white,)),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: toggleScreen,
                          child: Text(
                            "click Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  )
                 else
                Container(
                  padding: const EdgeInsets.only(top: 8,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not a member?", style: TextStyle(color: Colors.white,)),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: toggleScreen,
                        child: Text(
                          "click Register Now.",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
