import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Login_screen.dart';
import 'package:animate_do/animate_do.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();

  var namectrl = TextEditingController();
  var emailctrl = TextEditingController();
  var passctrl = TextEditingController();

  Future<void> registerUser() async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailctrl.text.trim(),
        password: passctrl.text.trim(),
      );

      User? user = userCredential.user;
      if (user != null) {
        // Update user's display name
        await user.updateDisplayName(namectrl.text);
        await user.reload();

        // Navigate to login page after successful registration
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Determine if the screen is small (mobile) or large (tablet/web)
    bool isSmallScreen = screenWidth < 600;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.indigo.shade200,
              Colors.indigo.shade300,
              Colors.indigoAccent.shade400,
            ],
          ),
        ),
        child: Form(
          key: _formkey,
          child: Center(
            child: Card(
              elevation: 10,
              child: Container(
                width: isSmallScreen ? screenWidth * 0.85 : screenWidth * 0.4,
                padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 20 : 40,
                  horizontal: isSmallScreen ? 16 : 32,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 15),
                    FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: Text(
                        "REGISTER",
                        style: TextStyle(
                          fontSize: isSmallScreen ? 24 : 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    // Name Input
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1100),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                          controller: namectrl,
                          decoration: InputDecoration(
                            hintText: "Enter Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Email Input
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1200),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                          controller: emailctrl,
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Password Input
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1300),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          controller: passctrl,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    FadeInUp(
                      duration: Duration(milliseconds: 1400),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            registerUser();
                          }
                        },
                        child: const Text("Register"),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    FadeInUp(
                      duration: Duration(milliseconds: 1500),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text("Already have an account?"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
