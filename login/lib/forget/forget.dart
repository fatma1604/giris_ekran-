import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/conponets/my_button.dart';
import 'package:login/conponets/my_tex.dart';


class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  final _emailController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Şifre sıfırlama butonuna basıldığında tetiklenen fonksiyon
  Future<void> _handleResetButtonPressed() async {
    try {
      // Kullanıcının email adresini kullanarak şifre sıfırlama maili gönderilir
      await _auth.sendPasswordResetEmail(email: _emailController.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Şifre sıfırlama bağlantısı e-postanıza gönderildi.'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      _showErrorDialog(e.message ?? 'Bir hata oluştu.');
    }
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hata'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(''),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Şifremi Unutum",
            style: TextStyle(
              color: Color.fromARGB(255, 241, 206, 206),
              fontWeight: FontWeight.w900,
              fontSize: 20,
              shadows: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MyTextField(
            hintText: "E-mail",
            obscureText: false,
            controller: _emailController,
            prefixIcon: const Icon(Icons.email),
          ),
          const SizedBox(height: 20),
          MyButton(
            buttonText: "Sifremi Resetle",
            onTap: _handleResetButtonPressed,
          ),
        ], // Column children
      ), // Column
    ); // Padding
  }
}
