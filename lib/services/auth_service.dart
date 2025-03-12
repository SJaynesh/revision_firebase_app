import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

mixin Auth {
  Future<String> registerUser({required String email, required String password});
  Future<String> loginUser({required String email, required String password});
}

class AuthService with Auth{
  AuthService._();

  static AuthService authService = AuthService._();

  var auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();

  User? get currentUser => auth.currentUser;

  @override
  Future<String> loginUser({required String email, required String password}) async{
    String msg = "";
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      msg = "Success";
    }on FirebaseAuthException catch (e) {
      msg = e.code;
    }
    return msg;
  }

  @override
  Future<String> registerUser({required String email, required String password}) async {
    String msg = "";
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      msg = "Success";
    } on FirebaseAuthException catch(e) {
      msg = e.code;
    }
  return msg;
  }

  Future<String> signInWithGoogle() async {
    String msg = "";
    try {
      GoogleSignInAccount? userAccount = await googleSignIn.signIn();

      if(userAccount!=null) {
        GoogleSignInAuthentication googleSignInAuth =await userAccount.authentication;

        var credential =  GoogleAuthProvider.credential(
          accessToken: googleSignInAuth.accessToken,
          idToken: googleSignInAuth.idToken,
        );

        await auth.signInWithCredential(credential);

        msg = "Success";
      }
    } on FirebaseAuthException catch(e) {
      msg = e.code;
    }
  return msg;
  }

  Future<void> logout() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }
}