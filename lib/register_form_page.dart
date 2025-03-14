import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'user_info_page.dart';
import 'translations/locale_keys.g.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _hidePass = true;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserInfoPage(
            name: _nameController.text,
            phone: _phoneController.text,
            email: _emailController.text,
            password: _passwordController.text, // Теперь передается пароль
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.register.tr())),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_nameController, LocaleKeys.full_name.tr(), Icons.person, TextInputType.name, LocaleKeys.name_error.tr()),
              SizedBox(height: 16.0),
              _buildTextField(_phoneController, LocaleKeys.phone.tr(), Icons.call, TextInputType.phone, LocaleKeys.phone_error.tr(), phoneValidator: true),
              SizedBox(height: 16.0),
              _buildTextField(_emailController, LocaleKeys.email.tr(), Icons.email, TextInputType.emailAddress, LocaleKeys.email_error.tr(), emailValidator: true),
              SizedBox(height: 16.0),
              _buildPasswordField(),
              SizedBox(height: 16.0),
              _buildConfirmPasswordField(),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(LocaleKeys.submit.tr()),
              ),
              SizedBox(height: 20),
              _buildLanguageSwitcher(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon, TextInputType inputType, String errorText,
      {bool phoneValidator = false, bool emailValidator = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
      keyboardType: inputType,
      validator: (value) {
        if (value == null || value.isEmpty) return errorText;
        if (phoneValidator && value.length != 10) return LocaleKeys.phone_error.tr();
        if (emailValidator && !value.contains('@')) return LocaleKeys.email_error.tr();
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _hidePass,
      decoration: InputDecoration(
        labelText: LocaleKeys.password.tr(),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: GestureDetector(
          onTap: () => setState(() => _hidePass = !_hidePass),
          child: Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
        ),
        border: OutlineInputBorder(),
      ),
      validator: (value) => value != null && value.length < 6 ? LocaleKeys.password_error.tr() : null,
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: _hidePass,
      decoration: InputDecoration(
        labelText: LocaleKeys.confirm_password.tr(),
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
      ),
      validator: (value) =>
          value != _passwordController.text ? LocaleKeys.password_mismatch.tr() : null,
    );
  }

  Widget _buildLanguageSwitcher() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => context.setLocale(Locale('en')),
          child: Text('English'),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () => context.setLocale(Locale('ru')),
          child: Text('Русский'),
        ),
      ],
    );
  }
}
