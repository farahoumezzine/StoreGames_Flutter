import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MotDePasseOublie extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  MotDePasseOublie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text(
          'Mot de passe oublié',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Username field
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nom d\'utilisateur requis';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Old password field
              TextFormField(
                controller: _oldPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Ancien mot de passe'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ancien mot de passe requis';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // New password field
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Nouveau mot de passe'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mot de passe requis';
                  } else if (value.length < 8) {
                    return 'Minimum 8 caractères requis';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),

              // Submit button
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final prefs = await SharedPreferences.getInstance();
                    final savedUsername = prefs.getString('username') ?? '';
                    final savedPassword = prefs.getString('password') ?? '';

                    if (_usernameController.text != savedUsername) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Nom d\'utilisateur incorrect'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else if (_oldPasswordController.text != savedPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Ancien mot de passe incorrect'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      await prefs.setString(
                        'password',
                        _newPasswordController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Mot de passe mis à jour avec succès'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  }
                },
                child: Text('Mettre à jour le mot de passe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
