import 'package:flutter/material.dart';

void main (){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //da 3lashan ashel el shreet el ahmar
      debugShowCheckedModeBanner: false,
      home: Calculator(),

    );
  }
}
class Calculator extends StatefulWidget {

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result='0';
  var finalResult='0';
  var num1=0.0;
  var num2=0.0;
  var opr='';


  void buttonPressed(btnval) async {
    if (btnval == 'AC') {
      finalResult = '0';
      num1 = 0.0;
      num2 = 0.0;
      opr = '';
    } else
    if (btnval == '+' || btnval == '-' || btnval == 'x' || btnval == "/") {
      num1=double.parse(result);
      opr=btnval;
      finalResult='0';
      result=result+btnval;
    } else if (btnval == '.') {
      if(finalResult.contains('.')){

      }else{
        finalResult=finalResult+btnval;
      }


    } else if (btnval == '+/-') {
      if(result.toString().contains(('-'))){

      }else if (btnval=='+/-'){
        if(result.toString().contains('-')){
          result.toString().substring(1);
          finalResult=result;
        }else{
          result='-'+result;
          finalResult=result;

        }

      }


    } else if (btnval == '%') {
      num2 = double.parse(result);
      finalResult = (num2 / 100).toString();
    }else if(btnval=='='){
      num2=double.parse(result);
      if(opr=='+') {
        finalResult = (num1 + num2).toString();
      }if(opr=='-') {
        finalResult = (num1 - num2).toString();
      }if(opr=='X') {
        finalResult = (num1 * num2).toString();
      }if(opr=='/') {
        finalResult = (num1 / num2).toString();
      }

    } else {
      finalResult = finalResult + btnval;
    }

    setState(() {
      result = finalResult.toString();
    });
  }
  Widget buuttonForm (txtButton ,Color txtColor,Color backgroundButton){
    if (txtButton!='0'){
      return Container(
        child: RawMaterialButton(
          onPressed: (){
            buttonPressed(txtButton);
          },
          shape: CircleBorder(),
          fillColor: backgroundButton,
          padding: EdgeInsets.all(15),
          child: Text(txtButton,style: TextStyle(
              fontSize: 35,
              color: txtColor
          ),) ,
        ),
      );
    }else{
      return Container(
        child: RawMaterialButton(
          onPressed: (){

          },
          shape: StadiumBorder(),
          fillColor: backgroundButton,
          padding: EdgeInsets.fromLTRB(34,20,128,20),
          child: Text(txtButton,style: TextStyle(
              fontSize: 35,
              color: txtColor
          ),) ,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(

          title: Text('CALCULATOR',
            style: TextStyle(
                color: Colors.white
            ),),
          backgroundColor: Colors.black,

        ),
        //ana delw2ty h2ol eny 3ndy 1 colmn w feh rows 3lshan anzm el donia

        body: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('$finalResult',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                    ),)
                ],
              ),
              // da bta3 el buttons w kda
              SizedBox( height: 30,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buuttonForm('AC',Colors.white,Colors.grey),
                  buuttonForm('+/-',Colors.white,Colors.grey),
                  buuttonForm('%',Colors.white,Colors.grey),
                  buuttonForm('/',Colors.white,Colors.yellow),
                ],
              ),
              SizedBox( height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buuttonForm('7',Colors.white,Colors.blueGrey),
                  buuttonForm('8',Colors.white,Colors.blueGrey),
                  buuttonForm('9',Colors.white,Colors.blueGrey),
                  buuttonForm('X',Colors.white,Colors.yellow),
                ],
              ),SizedBox( height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buuttonForm('4',Colors.white,Colors.blueGrey),
                  buuttonForm('5',Colors.white,Colors.blueGrey),
                  buuttonForm('6',Colors.white,Colors.blueGrey),
                  buuttonForm('-',Colors.white,Colors.yellow),
                ],
              ),
              SizedBox( height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buuttonForm('1',Colors.white,Colors.blueGrey),
                  buuttonForm('2',Colors.white,Colors.blueGrey),
                  buuttonForm('3',Colors.white,Colors.blueGrey),
                  buuttonForm('+',Colors.white,Colors.yellow),
                ],
              ),SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buuttonForm('0',Colors.white,Colors.blueGrey),
                  buuttonForm('.',Colors.white,Colors.blueGrey),
                  buuttonForm('=',Colors.white,Colors.yellow),
                ],
              ),
            ],
          ),

        )
    );
  }
}
