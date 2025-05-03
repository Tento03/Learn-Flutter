import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: Scaffold(
        appBar: AppBar(title: Text("Bottom Sheet")),
        body: Builder(
          builder: (context) {
            return Center(
              // Biar tombolnya di tengah layar
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder:
                        (context) => Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Pilih Aksi",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.add),
                                label: Text("Add"),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size.fromHeight(50),
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.edit),
                                label: Text("Edit"),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size.fromHeight(50),
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.delete),
                                label: Text("Delete"),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size.fromHeight(50),
                                ),
                              ),
                            ],
                          ),
                        ),
                  );
                },
                child: Text("Click Me"),
              ),
            );
          },
        ),
      ),
    );
  }
}
