import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revision_firebase_app/services/auth_service.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text("Register",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email.."
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password.."
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () async {
                String email = emailController.text;
                String password = passwordController.text;

               if(email.isNotEmpty && password.isNotEmpty) {
                 String msg = await AuthService.authService.registerUser(email: email, password: password);

                 if(msg == "Success") {
                   Get.back();
                   Get.snackbar('Success', "new user register successfully...",backgroundColor: Colors.greenAccent,);
                   emailController.clear();
                   passwordController.clear();
                 } else {
                   Get.snackbar('Error', msg,backgroundColor: Colors.redAccent,);
                 }

               }else {
                 Get.snackbar('Required', "please fill all field...",backgroundColor: Colors.redAccent,);
               }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xff6b24b4),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 20,),),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ?"),
                TextButton(
                  onPressed: (){
                    Get.back();
                  },
                  child: Text("Login",
                    style: TextStyle(
                      color: Colors.blue,
                    ),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
