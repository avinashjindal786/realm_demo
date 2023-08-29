import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm_demo/home_screen.dart';
import 'package:realm_demo/realm_provider.dart';

class RegistrationScreen extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: email,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              obscureText: true,
              controller: pass,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Provider.of<RealmWithMongoDb>(context,listen: false).register(email.text,pass.text).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())));
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
