import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ///Sign out user
  Future<String> sigOut() async {
    await _firebaseAuth.signOut();
    await GoogleSignIn(scopes: <String>['email']).signOut();
    return 'Sign Out success';
  }


  ///Sign In
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}




class AuthClass {
  FirebaseAuth auth = FirebaseAuth.instance;

  // creating an account
  Future createAccount(
      {required String email, required String password, }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,

      );


      return "Account Created";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    }
  }

  //sign in user

  Future signIN(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Welcome";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is not correct.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return "Error Occurred";
    }
  }

  // reset
  Future resetPassword(
      {required String email}) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,

      );
      return "Email Sent";
    } catch(e) {
      return "Error Occurred";
    }

  }
  // log out

  void signOut() {
    auth.signOut();
  }
}


