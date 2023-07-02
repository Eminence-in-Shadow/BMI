import'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo0',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Kase(),
    );
  }
}
class Kase extends StatefulWidget {
  @override
  State<Kase> createState() => _KaseState();
}

class _KaseState extends State<Kase> {
  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();
  var result="";
  var bgColor=Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI'),
      ),
      body: Container(decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [
                Color(0xffffecd2),Color(0xfffcb69f)
              ],
              center: Alignment.bottomRight,
              stops: [0.5,1.0]
          )
        /*LinearGradient(
            colors: [
              Color(0xffffecd2),Color(0xfffcb69f),Color(0xffff9b7e)
             *//* Colors.orange.shade300,
              Colors.purple.shade300,
              Colors.pink.shade100*//*
            ],
            begin: FractionalOffset(1.0,0.5),
            end: FractionalOffset(0.0,0.5),
            stops: [0.2,0.4,1.0]
          )*/
      ),
        //color: bgColor,
        child: Center(
          child: Container(
              width: 300,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BMI',style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700),),
                  SizedBox(height: 21,),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('Enter your Weight (in Kgs)'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 11,),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                      label: Text('Enter your Height(in Feet)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 11,),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text('Enter your Height(in inch)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16,),
                  ElevatedButton(onPressed: (){
                    var wt=wtController.text.toString();
                    var ft=ftController.text.toString();
                    var inch=inController.text.toString();
                    if(wt!=""&& ft!=""&&inch!=""){
                      var iwt=int.parse(wt);
                      var ift=int.parse(ft);
                      var iInch=int.parse(inch);
                      var tInch=(ift*12)+iInch;
                      var tcm=tInch*2.54;
                      var tm=tcm/100;
                      var bmi=iwt/(tm*tm);
                      var msg="";
                      if(bmi>25){
                        msg="You are Overweight !!";
                        bgColor=Colors.orange.shade200;
                      }
                      else if(bmi<18){
                        msg="You are Underweight !!";
                        bgColor=Colors.red.shade400;
                      }
                      else{
                        msg="You are Healthy!!";
                        bgColor=Colors.green.shade300;
                      }
                      setState((){
                        result="$msg\nYour BMI is ${bmi.toStringAsFixed(2)}";
                      });
                    }
                    else{
                      setState((){
                        result='** Please fill all the required Blanks';
                      });
                    }
                  }, child: Text('Calculate')),
                  SizedBox(height: 16,),
                  Text(result,style: TextStyle(fontSize:19 ),),
                ],
              )
          ),
        ),
      ),
    );
  }
}