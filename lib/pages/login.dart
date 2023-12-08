import 'package:flutter/material.dart';
import 'package:plantsatu/components/bottom_bar.dart';
import 'package:plantsatu/data/firebase_auth_service.dart';
import 'package:plantsatu/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
    ),
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FireBaseAuthService _authService = FireBaseAuthService();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPass.dispose();
    super.dispose();
  }

  void login() async {
    setState(() {
      isLoading = true;
    });

    String email = controllerEmail.text;
    String password = controllerPass.text;
    User? user =
        await _authService.loginWithEmailandPassword(email, password, context);

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login berhasil"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomBar()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login gagal"),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Stack(
        children: [
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
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.75),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Login to continue",
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
                      login();
                    },
                    child: Text(
                      "Login",
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
                        'Don\'t have an account ? ',
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
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text(
                          'Sign Up',
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





















// import 'package:flutter/material.dart';
// import 'package:plantsatu/pages/home/home_page.dart';
// import 'package:plantsatu/pages/welcome/components/register.dart';
// import 'package:plantsatu/data/firebase_auth_service.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final FireBaseAuthService _authService = FireBaseAuthService();
//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController controllerEmail = TextEditingController();
//     final TextEditingController controllerPass = TextEditingController();

//     @override
//     void dispose() {
//       controllerEmail.dispose();
//       controllerPass.dispose();
//       super.dispose();
//     }

//     void login() async {
//       String email = controllerEmail.text;
//       String password = controllerPass.text;
//       User? user = await _authService.loginWithEmailandPassword(
//           email, password, context);

//       if (user != null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Login successful"),
//             backgroundColor: Colors.green,
//           ),
//         );
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => HomePage()));
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Login failed"),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Color(0xFFFFFFFF),
//           centerTitle: true,
//           title: Text(
//             'Sign In',
//             style: TextStyle(
//                 color: Color.fromARGB(255, 6, 6, 6),
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold),
//           ),
//           leading: GestureDetector(
//             onTap: () {},
//             child: const Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             ),
//           )),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 23),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Column(
//                   children: const <Widget>[
//                     Text(
//                       "Welcome Back",
//                       style: TextStyle(
//                         color: Colors.black87,
//                         fontFamily: 'Poppins Bold',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 24,
//                       ),
//                     ),
//                     SizedBox(height: 3),
//                     Text("Login to your account",
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 17,
//                           fontFamily: 'Poppins Light',
//                         )),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 25),
//               TextField(
//                 controller: controllerEmail,
//                 style: const TextStyle(
//                   fontFamily: 'Poppins Light',
//                   fontSize: 16,
//                 ),
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   labelText: "Email Address",
//                   hintText: "Email Address",
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//                   hintStyle: const TextStyle(
//                     fontFamily: 'Poppins Light',
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 18),
//               TextField(
//                   obscureText: true,
//                   controller: controllerPass,
//                   style: const TextStyle(
//                     fontFamily: 'Poppins Light',
//                     fontSize: 16,
//                   ),
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: "Password",
//                     hintText: "Password",
//                     contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 18),
//                     hintStyle: const TextStyle(
//                       fontFamily: 'Poppins Light',
//                       fontSize: 16,
//                     ),
//                   )),
//               const SizedBox(height: 5),
//               SizedBox(height: 100),
//               ElevatedButton(
//                 onPressed: () {
//                   login();
//                 },
//                 child: const Text("SIGN IN",
//                     style: TextStyle(
//                       fontFamily: 'Poppins Bold',
//                       fontSize: 18,
//                     )),
//                 style: ElevatedButton.styleFrom(
//                     primary: Color.fromARGB(255, 6, 6, 6),
//                     minimumSize: const Size.fromHeight(55),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     )),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Don't have an account?",
//                       style: TextStyle(
//                         fontFamily: 'Poppins Light',
//                         fontSize: 16,
//                         color: Colors.black,
//                       )),
//                   SizedBox(width: 7),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => Register()),
//                       );
//                     },
//                     child: const Text("Sign up",
//                         style: TextStyle(
//                           fontFamily: 'Poppins Light',
//                           fontSize: 16,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         )),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

