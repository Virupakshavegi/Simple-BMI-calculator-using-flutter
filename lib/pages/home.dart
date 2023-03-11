import 'package:flutter/material.dart';
import 'package:bmi_app/constants/app_constants.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controllerheight=TextEditingController();

  TextEditingController _controllerweight=TextEditingController();

  double _result=0;

  String textresult="";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI App",
            style: TextStyle(
              color: accentColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          elevation: 0,
          centerTitle: true,

        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _controllerheight,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w400,
                        color: accentColor
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Height",
                        hintStyle: TextStyle(
                          fontSize: 39,
                          fontWeight: FontWeight.w400,
                          color: Colors.amberAccent,
                        )
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _controllerweight,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w400,
                          color: accentColor
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Weight",
                          hintStyle: TextStyle(
                            fontSize: 39,
                            fontWeight: FontWeight.w400,
                            color: Colors.amberAccent,
                          )
                      ),
                    ),
                  )
                ],

              ),
              SizedBox(height: 35,),
              GestureDetector(
                onTap: (){
                  double _he=double.parse(_controllerheight.text);
                  double _wi=double.parse(_controllerweight.text);
                  setState(() {
                    _result = _wi / (_he * _he);
                    if(_result > 25.0){
                      textresult = "You\'re over weight";
                    } else if(_result >= 18.5 && _result <= 25.0){
                      textresult = "You have normal weight";
                    }else{
                      textresult = "You\'re under weight";
                    }
                  });
                },
                child: Text(
                    'Calculate',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: accentColor
                  ),
                ),
              ),
              SizedBox(height: 35,),
              Container(
                child: Text(
                  _result.toStringAsFixed(2),
                  style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.w400,
                      color: accentColor
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Visibility(
                visible: true,
                child: Container(
                  child: Text(
                    textresult.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: accentColor
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}



