import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class CalculatorButton extends StatefulWidget {
  @override
  State<CalculatorButton> createState() => _CalculatorButton();
}

class _CalculatorButton extends State<CalculatorButton> {
  var inputs = '';
  var results = '';
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

void onCompute(){
  String finalResult = inputs;
  finalResult = inputs.replaceAll('x', '*');
 
    Parser p = Parser();
    Expression exp = p.parse(finalResult);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    results = eval.toString();
}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _builderUserInputs(context, userInputs: inputs),
                _builderUserResult(context, userResult: results)
              ],
            ),
          )
        ),

        Expanded(
          flex: 3,
          child: Container(
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4
                ),
              itemBuilder: (BuildContext context, int index){
                if(index == 0){
                  return _builderButtons(
                    context, 
                    buttonName: buttons[index], 
                    buttonColor: Colors.red, 
                    buttontapped: (){
                        setState(()
                          {
                          inputs = '';
                          results = '0';
                          }
                        );
                      }
                    );
                } else if(index >= 1 && index <=3 ){
                  return _builderButtons(context, buttonName: buttons[index], buttonColor: Colors.green, buttontapped: (){setState((){inputs += buttons[index];});});
                } else if(index == 18) {
                  return _builderButtons(context, buttonName: buttons[index], buttonColor: Colors.yellow, buttontapped: (){
                    setState((){onCompute();});
                    });
                } else {
                  return _builderButtons(context, buttonName: buttons[index], buttonColor: Colors.blue, buttontapped: (){setState((){inputs += buttons[index];});});
                }
                
              }
            ),
          ),
        ),
      ],
    );
  }

}

Widget _builderUserInputs(
  BuildContext context,{
    userInputs,
  }
) {
  return GestureDetector(
    child: Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerRight,
            child: Text(
              userInputs
            ),
          ),
  );
}

Widget _builderUserResult(
  BuildContext context,{
    userResult,
  }
) {
  return GestureDetector(
    child: Container(
            padding: EdgeInsets.all(40.0),
            alignment: Alignment.centerRight,
            child: Text(
              userResult
            ),
          ),
  );
}

Widget _builderButtons(
  BuildContext context,{
  required buttonName,
  buttonColor,
  final buttontapped
  }
) {
  return GestureDetector(
    child: TextButton(onPressed: buttontapped, 
      child: Text(
          buttonName,
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 20.0,
            color: Colors.black
            ),
        ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor),
        fixedSize: MaterialStateProperty.all(Size(10.0, 10.0)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))
        ))
        ),
    ),
  );
}



 
