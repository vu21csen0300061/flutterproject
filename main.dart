import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'new-widget.dart';
import 'constant.dart';
import 'results_page.dart';
import 'calculator_brain.dart';
void main() => runApp(BMICalculator());
const activecolor=Color(0xFF1D1E33);
const inactivecolor=Color(0xFF111328);
enum Gender{
  male,
  female
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(

            appBarTheme: AppBarTheme(
              color: Color(0xFF0C1234),
            ),
            scaffoldBackgroundColor: Color(0xFF0C1234),
            textTheme: TextTheme(
              bodyMedium:TextStyle(color: Color(0xFFFFFFFF)),
            ),


      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedgender;
  int height=180;
  int weight=60;
  int Age=19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedgender=Gender.male;
                    });
                  },

                  child: NewWidget(colour:selectedgender==Gender.male?activecolor:inactivecolor ,
                  cardchild: iconcontent(icon: FontAwesomeIcons.mars,label: 'MALE',),),
                ),


              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedgender=Gender.female;
                    });
                  },
                  child: NewWidget(colour: selectedgender==Gender.female?activecolor:inactivecolor,
                  cardchild: iconcontent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),),
                )
              )
            ],
          )),
          Expanded(child: NewWidget(colour: activecolor,
          cardchild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Height",style: knum),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(height.toString(),style:klabel),
                  Text("cm",style:knum)
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
                ),
              
                child: Slider(value: height.toDouble(),
                    max: 220.0,
                    min:120.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged:(double newvalue){
                         setState(() {
                           height=newvalue.round();
                         });;
                    },
                ),
              ),
            ],
          ),),),
          Expanded(child: Row(
            children: [Expanded(
              child: NewWidget(colour: activecolor,
              cardchild: Column(
                children: [
                  Text("Weight",style:knum),
                  Text(weight.toString(),style:klabel,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      button(icon: Icons.add,onPressed: (){setState(() {
                        weight++;
                      });},),
                      SizedBox(width: 10.0,),
                      button(icon:Icons.remove,onPressed: (){setState(() {
                        weight--;
                      });},)
                    ],
                  )
                ],
              ),)
            ),
              Expanded(
                child: NewWidget(colour: activecolor,cardchild: Column(
                  children: [
                    Text("Age",style:knum),
                    Text(Age.toString(),style:klabel),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        button(icon: Icons.add,onPressed: (){setState(() {
                          Age++;
                        });},),
                        SizedBox(width: 10.0,),
                        button(icon:Icons.remove,onPressed: (){setState(() {
                          Age--;
                        });},)
                      ],
                    )
                  ],
                ),)
              )
            ],
          )),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return(resultspage(
                  bmiresult: calc.calculateBMI(),
                  bmitext: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ));
              },),);
            },
            child: Container(
              child: Center(child: Text("Calculate",style: klarge,)),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top:10.0),
              width: double.infinity,
              height: 80,
            ),
          )
        ],
      ),
      /*floatingActionButton: Theme(
        data:ThemeData(colorScheme: ColorScheme.fromSwatch(
          primaryColorDark: Colors.purple
        )),
        child: FloatingActionButton(
          child: Icon(Icons.add),
        ),*/
      );


  }
}

class button extends StatelessWidget {
  button({this.icon,this.onPressed});
  IconData icon;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF4C4F5E),
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}



