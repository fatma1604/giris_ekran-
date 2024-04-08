import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/login/loginpage.dart'; // Eklediğimiz Firebase Auth paketini import ettik

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // Çıkış fonksiyonu
  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut(); // Firebase'den çıkış yapılıyor
      Navigator.pushNamedAndRemoveUntil(
          context,
          '/login',
          (route) =>
              false); // Giriş sayfasına geri dönülüyor ve geri dönüş yapılamıyor
    } catch (e) {
      print("Çıkış yapılırken bir hata oluştu: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text("home"),
      ),
    );
  }
}
