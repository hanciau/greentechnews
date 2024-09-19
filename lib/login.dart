import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  // Controllers untuk email dan password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkUserSignIn();
  }

  Future<void> _checkUserSignIn() async {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    setState(() {
      _user = user;
    });
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User canceled the sign-in
        return;
      }

      setState(() {
        _user = googleUser;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Welcome, ${_user?.displayName}!')),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign in failed. Please try again.')),
      );
    }
  }

  Future<void> _handleSignOut() async {
    await _googleSignIn.signOut();
    setState(() {
      _user = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _user == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Form untuk login
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika login dengan email dan password di sini
                        print("Email: ${_emailController.text}, Password: ${_passwordController.text}");
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 20),
                    const Text('OR'),
                    const SizedBox(height: 20),
                    // Tombol untuk Google Sign-In
                    ElevatedButton(
                      onPressed: _handleGoogleSignIn,
                      child: const Text('Sign in with Google'),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome, ${_user?.displayName}!'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _handleSignOut,
                      child: const Text('Sign out'),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
