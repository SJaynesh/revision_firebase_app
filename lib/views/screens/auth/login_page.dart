import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revision_firebase_app/routes/routes.dart';
import 'package:revision_firebase_app/services/auth_service.dart';
import 'package:revision_firebase_app/views/screens/auth/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text("Login",
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
                  String msg = await AuthService.authService.loginUser(email: email, password: password);

                  if(msg == "Success") {
                    Get.snackbar('Login', "user login successfully",backgroundColor: Colors.green,);
                    Get.offNamed(Routes.home);
                  }else {
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
                child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 20,),),
              ),
            ),
            GestureDetector(
              onTap: () async {
                String msg = await AuthService.authService.signInWithGoogle();

                if(msg == "Success") {
                  Get.snackbar('Login', "user login successfully",backgroundColor: Colors.green,);
                  Get.offNamed(Routes.home);
                }else {
                  Get.snackbar('Error', msg,backgroundColor: Colors.redAccent,);
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.g_mobiledata,size: 40,color: Colors.white,),
                    Text("Sign In With Google",style: TextStyle(color: Colors.white,fontSize: 20,),),
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ?"),
                TextButton(
                    onPressed: (){
                      Get.toNamed(Routes.register);
                    },
                    child: Text("Register",
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
