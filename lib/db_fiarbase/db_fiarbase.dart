// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class FbAuthController {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//
//   Future<void> signIn({required String email , required String password}) async{
//     try{
//       UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword
//         (email: email, password: password);
//     }on FirebaseAuthException catch(e){
//       _controlAuthExceptions(e);
//     }catch( e){
//       print("Exception: $e");
//     }
//   }
//   Future<void> createAccount(BuildContext context,
//       {required String email , required String password}) async{
//
//     try{
//       UserCredential userCredential = await  _firebaseAuth.createUserWithEmailAndPassword
//         (email: email, password: password);
//     } on FirebaseAuthException catch(e){
//       _controlAuthExceptions(e);
//     }catch(e){
//       print('Exception: $e');
//     }
//   }
//   void _controlAuthExceptions(FirebaseAuthException e){
//
//     switch (e.code){
//       case 'invalid-email':break;
//       case 'user-disabled':break;
//       case 'user-not-found':break;
//       case 'wrong-password':break;
//       case 'email-already-in-use':break;
//       case 'operation-not-allowed':break;
//       case 'weak-password':break;
//     }
//   }
// }
