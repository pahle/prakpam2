import 'package:flutter/material.dart';

class PageDetailUser extends StatelessWidget {
  final int idUser;
  final String userName;
  final String userEmail;
  final String userImageUrl;

  PageDetailUser({
    Key? key,
    required this.idUser,
    required this.userName,
    required this.userEmail,
    required this.userImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Detail"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50, // Adjust the size as needed
              backgroundImage: NetworkImage(userImageUrl),
            ),
            SizedBox(height: 20),
            Text(
              userName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              userEmail,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
