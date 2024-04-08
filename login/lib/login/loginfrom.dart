import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/conponets/my_button.dart';
import 'package:login/conponets/my_tex.dart';
import 'package:login/forget/forget_page.dart';
import 'package:login/login/lodiverder.dart';
import 'package:login/register/registerpage.dart';
import 'package:login/screen/home..dart';


class LoginFrom extends StatefulWidget {
  LoginFrom({Key? key, required this.onTap}) : super(key: key);
  final void Function()? onTap;

  @override
  State<LoginFrom> createState() => _LoginFromState();
}

class _LoginFromState extends State<LoginFrom> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void _handleLogin() async {
    if (_passwordController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _usernameController.text,
          password: _passwordController.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Home()), // Ana sayfanın yerine HomePage() kullanılmalı
        );
        // Başarılı giriş işlemi, isteğe bağlı olarak başka bir işlem yapılabilir
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Bu mail adresi kullanıcı bulunamadı."),
            ),
          );
          return;
        }
        if (e.code == 'invalid-email') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Lütfen geçerli bir e-posta girin."),
            ),
          );
        }
        if (e.code == 'network-request') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Lütfen gintarnet bağlantısını kontrol edin."),
            ),
          );
        }

        if (e.code == 'invalid-credential') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Şifreniz hatalı. Lütfen tekrar deneyin."),
            ),
          );
          return;
        }
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
                "Bir hata oluştu: ${e.code}"), // Hatanın kodunu yazdırıyoruz
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double mHeight = mediaQueryData.size.height;
    final double mWidth = mediaQueryData.size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: mHeight / 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
              hintText: "E-mail", // 'text' yerine 'hintText' kullanıldı
              obscureText:
                  false, // 'obscurText' yerine 'obscureText' kullanıldı
              controller: _usernameController,
              prefixIcon: Icon(Icons.email), // Ön ek ikon eklendi
            ),
            const SizedBox(height: 16),
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
              prefixIcon: Icon(Icons.lock), // Ön ek ikon eklendi
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgetPage()),
                );
              },
              child: Text(
                "Sifremi unutum",
                style: TextStyle(
                  color: Color.fromARGB(255, 233, 218, 218),
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
            )
          ],
        ),
        MyButton(
          buttonText: "GİRİŞ YAP",
          onTap: () {
            _handleLogin();
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: mHeight / 50),
          child: LoginDivider(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
             
              child: Image.asset(
                "assets/images/google.png",
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/images/new.png",
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Register()));
          },
          child: Text(
            "KAYDOL",
            style: TextStyle(
              color: Color.fromARGB(255, 240, 95, 95),
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
        )
      ],
    );
  }
}
