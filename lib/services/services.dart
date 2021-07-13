
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<FirebaseUser> handleSignIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  print("signed in " + user.displayName);
  return user;

}

 // import package for oure Firabase and google sign
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
//
//
// /// Need create global and final var for Firebase auth class and Google sign class
//
//
// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();
//
// // background method for sign in
// Future<String> signInWithGoogle() async {
//
//   // final v
//
//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   try {
//     if (googleSignInAccount == null) {
//       // cancelled login
//       print('Google SignIn ERROR!! googleUser: null!');
//       return null;
//     }
//   }
//   catch(exception){
//     print('Something Went Wrong!!!! $exception');
//   }
//   final GoogleSignInAuthentication googleSignInAuthentication =
//   await googleSignInAccount.authentication;
//
//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );
//
//   final AuthResult authResult = await _auth.signInWithCredential(credential);
//   // Firabase User class in  this class Google Sign in
//   final FirebaseUser user = authResult.user;
//
//   assert(!user.isAnonymous);
//   assert(await user.getIdToken() != null);
//
//   final FirebaseUser currentUser = await _auth.currentUser();
//   assert(user.uid == currentUser.uid);
//
//   return 'signInWithGoogle succeeded: $user';
// }
//
// void signOutGoogle() async{
//   await googleSignIn.signOut();
//
//   print("User Sign Out");
// }
