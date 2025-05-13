import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/gestures.dart';
import 'package:testapp/g_store.dart';
import 'package:testapp/signup.dart';
import 'package:testapp/mot_de_passe_oublie.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _saveCredentials() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', _usernameController.text);
      await prefs.setString('password', _passwordController.text);
      print("Compte créé avec succès");
    }
  }

  Future<void> _checkCredentials() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      final savedUsername = prefs.getString('username') ?? '';
      final savedPassword = prefs.getString('password') ?? '';

      if (_usernameController.text == savedUsername &&
          _passwordController.text == savedPassword) {
        //print('Authentification réussie');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GStore(username: savedUsername),
          ),
        );
      } else {
        print('Identifiants incorrects');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text("S'authentifier", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // attach the form key
          child: Column(
            children: [
              Image.asset("lib/assets/fortnite.jpg", width: 250),

              // Username
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nom d\'utilisateur requis';
                    }
                    return null;
                  },
                ),
              ),

              // Password
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Mot de passe'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mot de passe requis';
                    } else if (value.length < 8) {
                      return 'Minimum 8 caractères requis';
                    }
                    return null;
                  },
                ),
              ),

              // Auth button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _checkCredentials,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('S\'authentifier'),
                ),
              ),
              SizedBox(height: 16),

              // Create account button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Créer un compte'),
                ),
              ),

              SizedBox(height: 32),

              // Forgot password
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Mot de passe oublié? ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextSpan(
                        text: 'cliquer ici',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MotDePasseOublie(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
