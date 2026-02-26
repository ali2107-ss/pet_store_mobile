import 'package:flutter/material.dart';

void main() => runApp(const PetStoreApp());

class PetStoreApp extends StatelessWidget {
  const PetStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Иконка лапки (логотип)
              const Icon(Icons.pets, size: 100, color: Colors.orange), 
              const SizedBox(height: 20),
              const Text(
                "Pet Store", 
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)
              ),
              const SizedBox(height: 40),
              // Поля ввода
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email', 
                  border: OutlineInputBorder()
                )
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Пароль', 
                  border: OutlineInputBorder()
                ), 
                obscureText: true
              ),
              const SizedBox(height: 24),
              // Кнопка входа
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Здесь будет логика входа
                  }, 
                  child: const Text("Войти")
                ),
              ),
              // Кнопка регистрации
              TextButton(
                onPressed: () {
                  // Здесь будет переход на регистрацию
                }, 
                child: const Text("Еще нет аккаунта? Зарегистрироваться")
              ),
            ],
          ),
        ),
      ),
    );
  }
}