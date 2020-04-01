import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProyectoREST_UNACH',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'UNACH - Proyecto WS REST'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

   final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

appBar: new AppBar( title: Text("MENU PRINCIPAL UNACH"), backgroundColor: Colors.blue[700],),     //Aqui pueden configurar el color de fondo de la barra de menu
backgroundColor: Colors.green[100],  //Aqui pueden configurar el color de fondo del cuerpo de contenido
body: Container(
  padding: EdgeInsets.all(30.0),
	  child: GridView.count(
	         crossAxisCount:2,
	         children: <Widget>[
                Botones(title1: "Opcion 1", icon1: Icons.account_balance, bc1: Colors.brown,),
                Botones(title1: "Opcion 2", icon1: Icons.home, bc1: Colors.orange,),
                Botones(title1: "Opcion 3", icon1: Icons.local_library, bc1: Colors.blue,),

            ],
		      ), 
        )  
    );
  }
}

class Botones extends StatelessWidget {
Botones({this.title1, this.icon1, this.bc1});
final String title1;
final IconData icon1;
final MaterialColor bc1;

  @override
  Widget build(BuildContext context) {
    return Card(
    margin: EdgeInsets.all(8.0),
		child: InkWell(
			onTap:(){  print("Presionando el boton ... " + title1); },   //accion del evento Onclick del widget Card
			splashColor:Colors.green,
			child: Center(
			    child:Column(
            mainAxisSize:MainAxisSize.min,
				    children: <Widget>[
				              Icon(icon1, size: 70.0, color: bc1),
				              Text(title1, style : new TextStyle(fontSize: 17.0))
				                      ], 
				              ), 
				          ), 
			          ),
			);
  }
}
