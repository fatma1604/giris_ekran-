import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/conponets/google_button.dart';
import 'package:login/conponets/my_button.dart';
import 'package:login/conponets/my_tex.dart';
import 'package:login/login/loginpage.dart';
import 'package:login/screen/home..dart';

class RegisterPage extends StatefulWidget {
  void Function()? onTap;

  RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  void register(BuildContext context) async {
    if (_passwordController.text == _confirmPwController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Kayıt başarılı!'),
          ),
        );
        // Kayıt başarılı olduğunda, giriş sayfasına yönlendirme yapabilirsiniz
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } on FirebaseAuthException catch (e) {
        // Firebase Authentication hata durumlarını kontrol edin
        if (e.code == 'email-already-in-use') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Bu e-posta adresi zaten kullanılıyor.'),
            ),
          );
        } else if (e.code == 'invalid-email') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Geçersiz e-posta adresi.'),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Beklenmeyen bir hata oluştu.$e'),
            ),
          );
        }
      } catch (e) {
        // Diğer hata durumları için genel bir hata mesajı gösterin
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Beklenmeyen bir hata oluştu.'),
          ),
        );
      }
    } else {
      // Şifreler uyuşmazsa uyarı gösterin
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Şifreler eşleşmiyor.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double mHeight = mediaQueryData.size.height;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: mHeight / 10,
          ),
          MyTextField(
            hintText: "E-mail",
            obscureText: false,
            controller: _emailController,
            prefixIcon: const Icon(Icons.email),
          ),
          const SizedBox(height: 16),
          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: _passwordController,
            prefixIcon: const Icon(Icons.lock),
          ),
          const SizedBox(height: 15),
          MyTextField(
            hintText: "CONFIRM PASSWORD",
            obscureText: true,
            controller: _confirmPwController,
            prefixIcon: const Icon(Icons.lock),
          ),
          const SizedBox(height: 15),
          MyButton(
            buttonText: "Kayıtol",
            onTap: () => register(context),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GoogleSignInButton(),
              const SizedBox(width: 16),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Center(
                  child: Text(
                    'Giriş sayfasına git',
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
