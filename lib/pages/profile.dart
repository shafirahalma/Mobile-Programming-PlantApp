import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantsatu/pages/login.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile-page';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var userProfile;
  String uuid = '';
  bool _isPasswordVisible = false;

  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        uuid = user.uid;
        _emailController.text = user.email ?? '';
        _usernameController.text = user.displayName ?? '';
      });
    }
  }

  // UPDATE PROFILE
  void updateProfile() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        bool confirmed = await showConfirmationDialog(
          "Update Profile",
          "Are you sure you want to update your profile?",
        );

        if (confirmed) {
          // Memperbarui nama pengguna
          await user.updateDisplayName(_usernameController.text);

          // Memperbarui password jika diisi
          if (_passwordController.text != 'Enter Password') {
            await user.updatePassword(_passwordController.text);
          }

          getData();
        }
      }
    } catch (e) {
      print('Gagal memperbarui profil: $e');
    }
  }

  // DELETE ACCOUNT
  void deleteAccount() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        bool confirmed = await showConfirmationDialog(
          "Delete Account",
          "Are you sure you want to delete your account?",
        );

        if (confirmed) {
          await user.delete();

          Navigator.of(context).pop(); // Close the current screen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        }
      }
    } catch (e) {
      print('Gagal menghapus akun: $e');
    }
  }

  Future<bool> showConfirmationDialog(String title, String content) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true); // Confirmed
                  },
                  child: Text("Yes"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // Not confirmed
                  },
                  child: Text("No"),
                ),
              ],
            );
          },
        ) ??
        false; // Default to false if the user cancels the dialog
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xBF499E70),
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpeg'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Username",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 14,
                    ),
                    obscureText: false,
                    controller: _usernameController,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Email",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 14,
                    ),
                    obscureText: false,
                    controller: _emailController,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Password",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Ubah Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 14,
                    ),
                    obscureText: !_isPasswordVisible,
                    controller: _passwordController,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  updateProfile();
                },
                child: Text(
                  "Update",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0x7C499E70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  minimumSize: Size(double.infinity, 15),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  deleteAccount();
                },
                child: Text(
                  "Delete",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0x7C499E70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  minimumSize: Size(double.infinity, 15),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0x7C499E70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  minimumSize: Size(double.infinity, 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
