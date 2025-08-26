
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculadora extends StatefulWidget {
  
  State<StatefulWidget> createState() {
    return _Calculadora();
  }

}

class _Calculadora extends State<Calculadora>{
  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();
  int? resultado;


  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Calculadora',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            
              ),),
          ),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ), 
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _criaCampoTexto(label: 'Valor A', controlador: controllerA),
              _criaCampoTexto(label: 'Valor b', controlador: controllerB),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: (){
               String txta = controllerA.text;
               String txtb = controllerB.text;
               int valorA= int.parse(txta);
               int valorB= int.parse(txtb);
               
               setState(() {
                resultado = valorA + valorB;
               });
              }
              , child: Text('somar')),
              Text('$resultado',
              style: TextStyle(fontSize: 50),),

            ],
          )
        ),
      ),
    );
  }
  Widget _criaCampoTexto({ required String label, 
  required TextEditingController controlador,
  }){
    return  TextField(
            controller: controlador,
            decoration: InputDecoration(
              labelText: 'valor a',
              labelStyle: TextStyle(
                fontSize: 30,
              ),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          );
  }
}