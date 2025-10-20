import 'package:flutter/material.dart';
import 'api_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService api = ApiService();

  bool isLoading = false;

  Future<void> loginUser() async {
    setState(() => isLoading = true);

    final response = await api.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    setState(() => isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: response['status'] == 'success'
            ? const Color(0xFF43A047)
            : Colors.red,
        content: Text(response['message']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xFF1565C0),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, size: 100, color: Color(0xFF1565C0)),
            const SizedBox(height: 20),
            const Text(
              'Sign in to continue',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF1565C0),
              ),
            ),
            const SizedBox(height: 40),

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email, color: Color(0xFF1565C0)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF1565C0)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),

            isLoading
                ? const CircularProgressIndicator(color: Color(0xFF1565C0))
                : ElevatedButton(
              onPressed: loginUser,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
