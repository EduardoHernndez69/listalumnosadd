import 'package:flutter/material.dart';

void main() => runApp(MyApp());

List<Persona> _personas = [
  Persona("José Nabor", "Ramírez", "20101524"),
  Persona("Luis Marcos", "Ruiz", "20101524"),
  Persona("Antonio", "Marquez", "20101524"),
  Persona("Heriberto", "Rodríguez", "20101524"),
];

final nom = TextEditingController();
final ape = TextEditingController();
final cue = TextEditingController();

String tnom = "";
String tape = "";
String tcue = "";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de personas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MyHomePage2()));
        },
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
    );
  }
}

//Segundo widget
class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({
    super.key,
  });

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar alumno'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: TextField(
                  controller: nom,
                  decoration: InputDecoration(
                    hintText: 'Nombre',
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                child: TextField(
                  controller: ape,
                  decoration: InputDecoration(
                    hintText: 'Apellidos',
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                child: TextField(
                  controller: cue,
                  decoration: InputDecoration(
                    hintText: 'Cuenta',
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              Container(
                child: TextButton(
                    onPressed: () {
                      tnom = nom.text;
                      tape = ape.text;
                      tcue = cue.text;
                      _personas.add(Persona(tnom, tape, tcue));
                      nom.clear();
                      ape.clear();
                      cue.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyHomePage()));
                    },
                    child: Text(
                      "Guardar",
                      style: TextStyle(fontSize: 25.0, color: Colors.pink),
                    )),
              ),
            ],
          ),
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
