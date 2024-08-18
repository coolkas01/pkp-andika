import 'package:flutter/material.dart';

class CheckPassword extends StatefulWidget {
  const CheckPassword({super.key});

  @override
  State<CheckPassword> createState() => _CheckPasswordState();
}

class _CheckPasswordState extends State<CheckPassword> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              key: _formKey,
              controller: _controller,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Password field can\'t be empty';
                }
                if (text.length < 8) {
                  return 'Password must have at least 8 characters';
                }
                if (!text.contains(RegExp(r'[A-Z]'))) {
                  return 'Password must have at least 1 uppercase';
                }
                if (!text.contains(RegExp(r'[0-9]'))) {
                  return 'Password must have at least 1 number';
                }
                if (!text.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
                  return 'Password must have at least 1 special';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
