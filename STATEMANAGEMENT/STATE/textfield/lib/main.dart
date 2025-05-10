import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Form Input')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormExample(),
        ),
      ),
    );
  }
}

class FormExample extends StatefulWidget {
  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Semua input valid
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Data berhasil dikirim')));

      print("Nama: ${_nameController.text}");
      print("Email: ${_emailController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // Untuk validasi
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Nama',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama tidak boleh kosong';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email tidak boleh kosong';
              } else if (!value.contains('@')) {
                return 'Email tidak valid';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _submit,
            icon: Icon(Icons.send),
            label: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
