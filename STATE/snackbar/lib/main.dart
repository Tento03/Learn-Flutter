import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snackbar Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Snackbar Demo')),
        body: Center(
          child: Builder(
            builder:
                (context) => ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Data berhasil disimpan!'),
                        duration: Duration(seconds: 2),
                        action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: () {
                            // Aksi ketika UNDO ditekan
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Aksi dibatalkan'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Text('Simpan'),
                ),
          ),
        ),
      ),
    );
  }
}
