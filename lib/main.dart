import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() => runApp(BMICalculator());
const activeColour=Color(0xFF1D1E33);
const inactiveColour=Color(0xFF111328);
enum gender{
male,
female
}
gender selectedGender;
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(

      ),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor=inactiveColour;
  Color femaleCardColor=inactiveColour;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21) ,
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusable(colour: selectedGender==gender.male ? activeColour :inactiveColour,
                    cardChild: MF(ico: FontAwesomeIcons.male,label: 'male',
                    ),
                    onPress: (){
                    setState(() {
                      selectedGender=gender.male;
                    });
                    },
                  ),
                ),
                Expanded(
                  child: Reusable(colour :selectedGender==gender.female ? activeColour:inactiveColour,
                  cardChild: MF(ico: FontAwesomeIcons.female, label: 'female'),
                  onPress: (){
                    setState(() {
                      selectedGender=gender.female;
                    });
                  },),

                )
              ],
            ),

          ),
          Expanded(
            child: Reusable(colour: inactiveColour,)
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusable(colour: inactiveColour,),
                ),
                Expanded(
                  child: Reusable(colour: inactiveColour,)
                )
              ],
            ),

          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            color: Color(0xFFB1555),
            height: 50.0,
          )
        ],

      ),

    );
  }
}

class MF extends StatelessWidget {
  MF({@required this.ico,@required this.label});
  final IconData ico;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          ico,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF8D8E98)
          ),
        )
      ],
    );
  }
}

class Reusable extends StatelessWidget {
 final Color colour;
 final Widget cardChild;
 final Function onPress;
  Reusable({@ required this.colour,this.cardChild,this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15),

        ),
      ),
    );
  }
}

