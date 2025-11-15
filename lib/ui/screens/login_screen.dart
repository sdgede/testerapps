import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testerapps/ui/bloc/auth_block.dart';
import 'package:testerapps/ui/screens/home_page.dart';
import 'package:testerapps/ui/themes/color_thame.dart';
import 'package:testerapps/ui/widgets/allert_get_accun.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final formKey = GlobalKey<FormState>();
  final nisnController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Stack(
          children: [
            // Gambar atas
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/Effect.png",
                fit: BoxFit.cover,
                height: 280,
              ),
            ),

            // Gambar bawah
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/Effect.png",
                fit: BoxFit.cover,
                height: 220,
              ),
            ),

            // Form login (Card)
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 10),
                    ],
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'SIMAKS MOBILE',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF010336),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '“Sistem Informasi Manajemen dan\nAkuntansi Sekolah”',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                          ),
                        ),
                    
                        // Logo
                        Image.asset('assets/images/logo.png', height: 150),
                    
                        // NISN
                        TextFormField(
                          controller: nisnController,
                          decoration: InputDecoration(
                            hintText: "Masukkan NISN",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'NISN tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                    
                        // Password
                        TextFormField(
                          controller: passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: "Masukkan Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                    
                        // Tombol Login
                        BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              // Navigasi ke halaman utama jika login berhasil
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage()),
                                (route) => false,
                              );
                            } else if (state is LoginFailure) {
                              // Tampilkan pesan error jika login gagal
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.error)),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is LoginLoading) {
                              return const Center(child: CircularProgressIndicator(),);
                            }

                            return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorTheme.primaryColor,
                                  foregroundColor: ColorTheme.textColor,
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  if (formKey.currentState?.validate() ?? false) {
                                    final nisn = nisnController.text;
                                    final password = passwordController.text;
                                    print(nisn );
                                    print(password);

                                    // Memanggil event untuk login
                                    context.read<LoginBloc>().add(LoginButtonPressed(nisn: nisn, password: password));
                                  }
                                },
                                child: const Text(
                                  'LOGIN',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                    
                        // Teks Hubungi Admin
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Belum punya akun? "),
                            GestureDetector(
                              onTap: () {
                                // muncul popup untuk menghubungi admin
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertGetAccount();
                                  },
                                );
                              },
                              child: const Text(
                                "Hubungi Admin",
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
