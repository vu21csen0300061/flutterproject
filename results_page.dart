import 'package:flutter/material.dart';
import 'constant.dart';
import 'new-widget.dart';
class resultspage extends StatelessWidget {
  //const resultspage({Key? key}) : super(key: key);
  resultspage({this.bmiresult,this.bmitext,this.interpretation});
  final String bmiresult;
  final String bmitext;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("BMI CALCULATOR"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            child: Center(child: Text("YOUR RESULT",style: ktitle,)),
          )),
          Expanded(
            flex: 5,
            child: NewWidget(colour: Color(0xFF1D1E33),
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(bmitext,style:kresult),
                  Text(bmiresult,style:kvalue),
                  Text(interpretation,textAlign:TextAlign.center,style:kmsg),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(child: Text("Re-Calculate",style: klarge,)),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top:10.0),
              width: double.infinity,
              height: 80,
            ),
          )
        ],
      ),
    );
  }
}
