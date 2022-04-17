import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _weightController = TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  

  void handleRadioValueChanged(dynamic value) {
    setState(() {
      radioValue = value;
      // print(radioValue);
      switch (radioValue) {
        case 0: _finalResult = calculateWeight(_weightController.text, 0.06);
        break;

        case 1: _finalResult = calculateWeight(_weightController.text, 0.38);
        break;

        case 2: _finalResult = calculateWeight(_weightController.text, 0.91);
        break;
        
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight on Planet X'),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.5),
          children: [
            Image.asset("assets/planet.png",
            height: 133.0,
            width: 200.0,),

            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Your Weight on Earth',
                      hintText: 'In Pounds',
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<int>(value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged, activeColor: Colors.brown,),
                      Text(
                        'Pluto',
                        style: TextStyle(
                          color: Colors.white30
                        ),
                      ),
                      Radio<int>(value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged, activeColor: Colors.red,),
                      Text(
                        'Mars',
                        style: TextStyle(
                          color: Colors.white30
                        ),
                      ),
                      Radio<int>(value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged, activeColor: Colors.orangeAccent,),
                      Text(
                        'Venus',
                        style: TextStyle(
                          color: Colors.white30
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(15.6)),
                  Text(
                    '$_finalResult',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      // weight = mass * multiplier (surface gravity)
      return int.parse(weight) * multiplier;
    } else {
      print('wrong');

      return int.parse("180") * 0.38;
    }
  }
}