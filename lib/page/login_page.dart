import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_clone/page/home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Instagram
              Text(
                'Instagrid',
                style: GoogleFonts.lobster(color: Colors.black, fontSize: 32, fontWeight: FontWeight.w200),
              ),
              SizedBox(height: 32),

              // TextField Username
              TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              SizedBox(height: 16),

              // TextField Password
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              SizedBox(height: 24),

              // Tombol Login
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Lupa Password
              TextButton(
                onPressed: () {
                  // Aksi lupa password
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: 32),

              // Divider
              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'OR',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Divider(thickness: 1),
                  ),
                ],
              ),
              SizedBox(height: 32),

              // Tombol Login dengan Facebook
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    'Log in with Facebook',
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 48),

              // Sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman Sign Up
                    },
                    child: Text(
                      'Sign Up.',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
