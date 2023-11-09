import 'package:flutter/material.dart';

void main() => runApp(MyApp());

List<Persona> _personas = [
  Persona("José Nabor", "Ramírez", "20101524"),
  Persona("Luis Marcos", "Ruiz", "20101524"),
  Persona("Antonio", "Marquez", "20101524"),
  Persona("Heriberto", "Rodríguez", "20101524"),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Listado de personas'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.person_add),
        ),
        body: ListView.builder(
          itemCount: _personas.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title:
                  Text(_personas[index].name + ' ' + _personas[index].lastName),
              subtitle: Text(_personas[index].cuenta),
              leading: CircleAvatar(
                child: Text(_personas[index].name.substring(0, 1)),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          },
        ),
      ),
    );
  }
}

class Persona {
  String name;
  String lastName;
  String cuenta;

  Persona(this.name, this.lastName, this.cuenta);
}
