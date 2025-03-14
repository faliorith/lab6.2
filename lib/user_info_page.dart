import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'translations/locale_keys.g.dart';

class UserInfoPage extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String password;

  const UserInfoPage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.user_info.tr()), // Локализованный заголовок
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(LocaleKeys.full_name.tr(), name),
            _buildInfoRow(LocaleKeys.email.tr(), email),
            _buildInfoRow(LocaleKeys.phone.tr(), phone),
            _buildInfoRow(LocaleKeys.password.tr(), '*' * password.length, isPassword: true),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(LocaleKeys.back.tr()), // Локализованная кнопка "Назад"
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 18, color: isPassword ? Colors.red : Colors.black),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
