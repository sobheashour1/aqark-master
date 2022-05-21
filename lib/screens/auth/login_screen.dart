import 'package:aqark/screens/app/bn_screens/categories_screen.dart';
import 'package:aqark/screens/auth/create_account_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/helpers.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>with Helper  {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController =  TextEditingController();
  final TextEditingController passwordController =  TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,

          onSaved:
              (value) {
            emailController.text = value!;
          },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock_outlined),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: const Text(

            "تسجيل الدخول",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'تسجيل دخول',
            style:Theme.of(context).textTheme.headline5,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                gradient:LinearGradient(
                begin:AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,

                    colors: [
                      Colors.green.shade200,
                      Colors.green.shade800,
                                  ]
                  )
              ),

                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(36.0),

                       child: Form(
                        key: _formKey,
                        child: Column(

                            mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                           children: <Widget>[
                            SizedBox(
                        height: 200,
                            child: Image.asset(
                          "assets/images/back.jpeg",height: 150,
                          fit: BoxFit.contain,
                        )),
                         const Text(
                      '...اهلا بكم في تطبيق عقارك',
                      style:  TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: 'Tajawal'
                      ),
                    ),
                           const Text(
                      ' ...ادخل بياناتك الشخصية',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                          fontFamily: 'Tajawal'
                                            ),
                                     ),

                             const SizedBox(height: 45),
                             emailField,
                           const SizedBox(height: 25),
                           passwordField,
                             const SizedBox(height: 35),
                            loginButton,
                             const SizedBox(height: 15),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(" ليس لديك حساب"),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CreateAccountScreen()));
                            },
                            child: const Text(
                              "انشأ الان",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential=
        await FirebaseAuth.instance.signInWithEmailAndPassword
          (email: email, password: password);

        Navigator.pushReplacementNamed(context,'/main_screen');

      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            showSnackBar(context, message: "Your email address appears to be malformed.", error: true);
            // errorMessage = ;

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }

      }
    }
  }
}






// class LoginScreen extends StatefulWidget {
//  const LoginScreen({Key? key}) : super(key: key);
//
//  @override
//   _LoginScreenState createState() => _LoginScreenState();
//
//
// class _LoginScreenState extends State<LoginScreen> {
//   //final _auth = FirebaseAuth.instance;
//   late User signedInUser;
//   late String email;
//   late String password;
//
//   void getCurrentUser() {
//
//     //try{
//       //final user = _auth.currentUser;
//       //if (user != null){
//       //  signedInUser = user;
//   //       print(signedInUser.email);
//   //     }
//   //   }
//   //   catch(e){
//   //     print(e);
//   //   }
//   // }
//
//
//   late TextEditingController _emailTextController;
//   late TextEditingController _passwordTextController;
//
//   String? _emailError;
//   String? _passwordError;
//
//   late TapGestureRecognizer _tapGestureRecognizer;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getCurrentUser();
//     _emailTextController = TextEditingController();
//     _passwordTextController = TextEditingController();
//
//     _tapGestureRecognizer = TapGestureRecognizer()
//       ..onTap = navigateToCreateAccount;
//     //_tapGestureRecognizer.onTap = navigateToCreateAccount;
//   }
//
//   void navigateToCreateAccount() =>
//       Navigator.pushNamed(context, '/create_account_screen');
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _emailTextController.dispose();
//     _passwordTextController.dispose();
//     _tapGestureRecognizer.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.black),
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           'تسجيل دخول',
//           style:Theme.of(context).textTheme.headline5,
//         ),
//         backgroundColor: Colors.transparent,
//       ),
//       body: SingleChildScrollView(
//         physics: const NeverScrollableScrollPhysics(),
//         child: Container(
//           decoration: BoxDecoration(
//           gradient:LinearGradient(
//             begin:AlignmentDirectional.topStart,
//               end: AlignmentDirectional.bottomEnd,
//
//               colors: [
//                 Colors.green.shade200,
//                 Colors.green.shade800,
//               ]
//           )
//           ),
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(20, 111, 20, 200),
//             child: Column(
//               children: [
//                 SizedBox(
//                     child: Image.asset('assets/images/back.jpeg',height: 150,)),
//
//                 const Text(
//                   '...اهلا بكم في تطبيق عقارك',
//                   style:  TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 24,
//                     fontFamily: 'Tajawal'
//                   ),
//                 ),
//                 const Text(
//                   ' ...ادخل بياناتك الشخصية',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w300,
//                     fontSize: 18,
//                     fontFamily: 'Tajawal'
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 TextField(
//                   controller: _emailTextController,
//                   cursorColor: Colors.pink,
//                   cursorWidth: 5,
//                   cursorRadius: const Radius.circular(10),
//                   // cursorHeight: 10,
//                   showCursor: false,
//                   maxLength: 30,
//                   buildCounter: (
//                     context, {
//                     required int currentLength,
//                     required bool isFocused,
//                     required int? maxLength,
//                   }) {
//                     return null;
//                     // return Text('($currentLength | $maxLength)');
//                   },
//                   onChanged: (String value) {
//                   },
//                   style:
//                       const TextStyle(color: Colors.black, fontWeight: FontWeight.w100),
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                     errorText: _emailError,
//                     errorBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Colors.red,
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         width: 1,
//                         color: Colors.red.shade900,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     hintText: 'رقم الهاتف ',
//                     enabled: true,
//                     disabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(
//                         color: Colors.red.shade100,
//                         width: 1,
//                       ),
//                     ),
//
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         color: Colors.grey,
//                         width: 1,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(
//                         color: Colors.red.shade100,
//                         width: 1,
//                       ),
//                     ),
//
//                     prefixIcon: const Icon(Icons.phone),
//                     fillColor: Colors.grey.shade200,
//                     filled: true,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: _passwordTextController,
//                   obscureText: true,
//                   onChanged: (value){
//                     password = value;
//                   },
//
//                   style: const TextStyle(
//                     color: Colors.black,
//                   ),
//                   decoration: InputDecoration(
//                     errorBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Colors.red,
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         width: 1,
//                         color: Colors.red.shade900,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     errorText: _passwordError,
//                     fillColor: Colors.grey.shade300,
//                     filled: true,
//                     hintText: 'كلمة السر',
//                     prefixIcon: const Icon(Icons.lock),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(
//                         color: Colors.grey.shade400,
//                         width: 1,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(
//                         color: Colors.blue.shade400,
//                         width: 1,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   //onPressed: () {
//                   //
//                   //   try{
//                   //     final user =await _auth.createUserWithEmailAndPassword(email: email, password: password);
//                   //     if(user != null ){
//                   //       Navigator.pushNamed(context, '/categories_screen');
//                   //     }
//                   //   }catch(e){
//                   //     print(e);
//                   //   }
//
//                   //   // _performLogin();
//                   //
//                   // },
//                    child: const Text('تسجيل دخول');
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(double.infinity, 50),
//                //   ),}
//
//                   const SizedBox(height: 10),
//                 Center(
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       text: 'ليس لديك حساب \'',
//                       style: const TextStyle(
//                         color: Colors.black,
//                       ),
//                       children: [
//                         const TextSpan(text: ' '),
//                         TextSpan(
//                           recognizer: _tapGestureRecognizer,
//                           text: 'انشأ الان!',
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _performLogin() {
//     if(checkData()){
//       login();
//     }
//   }
//
//   // bool checkData() {
//   //   if (_emailTextController.text.isNotEmpty &&
//   //       _passwordTextController.text.isNotEmpty) {
//   //     checkErrors();
//   //     return true;
//   //   } else {
//   //     checkErrors();
//   //   }
//   //   showSnackBar(
//   //     message: 'ادخل البيانات المطلوبة',
//   //     error: true,
//   //   );
//   //   return false;
//   // }
//
//   void checkErrors() {
//     setState(() {
//       _emailError = _emailTextController.text.isNotEmpty ? null : 'خطأ بالايميل';
//       _passwordError =
//           _passwordTextController.text.isNotEmpty ? null : 'خطأ بكلمة السر';
//     });
//   }
//
//   void showSnackBar({required String message, bool error = false}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: error ? Colors.red : Colors.green,
//       ),
//     );
//   }
//
//   void login(){
//     Navigator.pushReplacementNamed(context, '/main_screen');
//   }
// }
