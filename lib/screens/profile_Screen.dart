import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Login_screen.dart';  // Import the Login page

class ProfilePage extends StatelessWidget {

  const ProfilePage({Key? key}) : super(key: key);



  @override


  Widget build(BuildContext context) {
    final Uri _url = Uri.parse('https://www.google.co.in/');

    //HTTPS screen
    Future<void> _googleUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Profile')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 5),
            // Circular Avatar
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://assets.goal.com/images/v3/bltd58c4d60ecd9275e/GOAL_-_Blank_WEB_-_Facebook_-_2023-06-13T135350.847.png?auto=webp&format=pjpg&width=3840&quality=60', // Replace with a real image URL
              ),
            ),
            SizedBox(height: 20),
            // User Info
            Text(
              'Ashique K',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'ashique.k@example.com', // Replace with real email
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            // Edit Profile Button
            ElevatedButton(
              onPressed: () {
                // Handle edit profile action
              },
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 20),
            // Additional Options
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigate to settings page
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help & Support'),
              onTap: () {
                _googleUrl();
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                // Perform Firebase sign-out
                await FirebaseAuth.instance.signOut();

                // Navigate to the Login page after sign-out
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                      (route) => false,  // Remove all previous routes
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
