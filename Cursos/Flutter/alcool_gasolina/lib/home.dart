import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _alcoolController = TextEditingController();
  TextEditingController _gasolinaController = TextEditingController();
  String _result = "";  



  void _calcular(){

    double? priceAlcool = double.tryParse(_alcoolController.text);
    double? priceGas = double.tryParse(_gasolinaController.text);
    
    if((priceAlcool!/priceGas!) >= 0.7){
       
       setState(() {
         _result = "Bão";
       });
    }else{
      setState(() {
        _result = "NÃO";      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(padding: EdgeInsets.only(bottom: 42),
                child: Image.asset("assets/imgs/logo.png"),),
                Padding(padding: EdgeInsets.only(bottom: 10),
                child: Text("Saiba qual é a melhor opção para abastecer",),),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Alcool"
                  ),
                  controller: _alcoolController,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Gasolina"
                  ),
                  controller: _gasolinaController,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(onPressed: _calcular, 
                  child: Text("Calcular")),
                ),
                Padding(padding: EdgeInsets.only(top: 20),
                child: Text(_result),)
              ],
            ),
          ),
      ),
    );
  }
}