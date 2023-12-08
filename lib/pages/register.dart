import 'package:flutter/material.dart';
import 'package:plantsatu/data/firebase_auth_service.dart';
import 'package:plantsatu/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
    ),
    home: Register(),
  ));
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FireBaseAuthService _authService = FireBaseAuthService();
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPass.dispose();
    super.dispose();
  }

  void register() async {
    String username = controllerUsername.text;
    String email = controllerEmail.text;
    String password = controllerPass.text;
    User? user = await _authService.signUpWithEmailandPassword(
        username, email, password, context);

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("User is successfully created"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cannot create user"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Stack(
        children: [
          // Background Images
          Positioned(
            left: -99,
            top: -109,
            child: Container(
              width: 290,
              height: 270,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 70,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0x7C499E70),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 90,
                    top: 0,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0x7C499E70),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Content
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.75),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Create your account",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black.withOpacity(0.7400000095367432),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 60),
                  Container(
                    width: 325,
                    height: 51,
                    child: TextFormField(
                      controller: controllerUsername,
                      decoration: InputDecoration(
                        labelText: "Enter your username",
                        prefixIcon: Icon(Icons.person),
                        hintText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 325,
                    height: 51,
                    child: TextFormField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        labelText: "Enter your email",
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 325,
                    height: 51,
                    child: TextFormField(
                      controller: controllerPass,
                      decoration: InputDecoration(
                        labelText: "Enter your password",
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 65),
                  ElevatedButton(
                    onPressed: () {
                      register();
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xBF499E70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Color(0x7C499E70),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}























//sebelum di set profil

// import 'package:flutter/material.dart';
// import 'package:plantsatu/data/firebase_auth_service.dart';
// import 'package:plantsatu/pages/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// void main() {
//   runApp(MaterialApp(
//     theme: ThemeData.dark().copyWith(
//       scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
//     ),
//     home: Register(),
//   ));
// }

// class Register extends StatefulWidget {
//   const Register({Key? key}) : super(key: key);

//   @override
//   State<Register> createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   final FireBaseAuthService _authService = FireBaseAuthService();
//   final TextEditingController controllerEmail = TextEditingController();
//   final TextEditingController controllerPass = TextEditingController();

//   @override
//   void dispose() {
//     controllerEmail.dispose();
//     controllerPass.dispose();
//     super.dispose();
//   }

//   void register() async {
//     String email = controllerEmail.text;
//     String password = controllerPass.text;
//     User? user =
//         await _authService.signUpWithEmailandPassword(email, password, context);

//     if (user != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("User is successfully created"),
//           backgroundColor: Colors.green,
//         ),
//       );
//       Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Cannot create user"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFFFFFFF),
//       body: Stack(
//         children: [
//           // Background Images
//           Positioned(
//             left: -99,
//             top: -109,
//             child: Container(
//               width: 290,
//               height: 270,
//               child: Stack(
//                 children: [
//                   Positioned(
//                     left: 0,
//                     top: 70,
//                     child: Container(
//                       width: 200,
//                       height: 200,
//                       decoration: BoxDecoration(
//                         color: Color(0x7C499E70),
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 90,
//                     top: 0,
//                     child: Container(
//                       width: 200,
//                       height: 200,
//                       decoration: BoxDecoration(
//                         color: Color(0x7C499E70),
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Content
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Text(
//                     "Welcome",
//                     style: TextStyle(
//                       fontSize: 45,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black.withOpacity(0.75),
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   Text(
//                     "Create your account",
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Colors.black.withOpacity(0.7400000095367432),
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 60),
//                   Container(
//                     width: 325,
//                     height: 51,
//                     child: TextFormField(
//                       controller: controllerEmail,
//                       decoration: InputDecoration(
//                         labelText: "Enter your email",
//                         prefixIcon: Icon(Icons.email),
//                         hintText: "Email",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(22),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Container(
//                     width: 325,
//                     height: 51,
//                     child: TextFormField(
//                       controller: controllerPass,
//                       decoration: InputDecoration(
//                         labelText: "Enter your password",
//                         prefixIcon: Icon(Icons.key),
//                         hintText: "Password",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(22),
//                         ),
//                       ),
//                       obscureText: true,
//                     ),
//                   ),
//                   SizedBox(height: 65),
//                   ElevatedButton(
//                     onPressed: () {
//                       register();
//                     },
//                     child: Text(
//                       "Register",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       primary: Color(0xBF499E70),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(22),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 12.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Already have an account ? ',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 14,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => Login()),
//                           );
//                         },
//                         child: Text(
//                           'Sign In',
//                           style: TextStyle(
//                             color: Color(0x7C499E70),
//                             fontSize: 14,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

























