// import 'package:flutter/material.dart';
// void main(){
//   runApp(const MyApp());
// }
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   var weightController = TextEditingController();
//   var feetController = TextEditingController();
//   var inchController = TextEditingController();
//   var result = '';
//   @override
//   Widget build(BuildContext context) {
//
//
//     return MaterialApp(
// debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Your BMI', style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 25
//           ),),
//           centerTitle: true,
//           backgroundColor: Colors.red,
//         ),
//         body: Center(
//           child: Container(
//             width: 300,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text('BMI', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
//                 TextField(
//                 controller: weightController,
//                   decoration: InputDecoration(
//                     hintText: 'Enter Your Weight',
//                     prefixIcon: Icon(Icons.line_weight),
//                 ),
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 20,),
//                 TextField(
//                   controller: feetController,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.height),
//                     hintText: 'Enter your height in feet'
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//
//                 SizedBox(height: 20,),
//                 TextField(
//                   controller: inchController,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.height_rounded),
//                     hintText: 'Enter your height in inch',
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 20,),
//
//                 InkWell(
//                   onTap: (){
//                     var weightText = weightController.text.toString();
//                     var feetText = feetController.text.toString();
//                     var inchText = inchController.text.toString();
//                     if(weightText != '' && feetText != '' && inchText != ''){
//                       // bmi calculator logic
//                       double weight = double.parse(weightController.text);
//                       double heightInMeters = (double.parse(feetController.text) * 0.3048) + (double.parse(inchController.text) * 0.0254);
//                       double bmi = weight / (heightInMeters * heightInMeters);
//
//                       setState(() {
//                         result = "Your BMI is: ${bmi.toStringAsFixed(2)}";
//                       });
//
//                     }else{
//                       setState(() {
//                         result = "Please fill all the blanks";
//                       });
//                     }
//                   },
//                   child: Container(
//                     height: 50,
//                     width: 100,
//                     child: Center(child: Text('Calculate')),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(10)
//                     ),
//
//                   ),
//                 ),
//                 Text(result,style: TextStyle(color: Colors.black),),
//               ],
//
//
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//





import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchController = TextEditingController();

  String result = ''; // Moved result variable here
  var bgColor=Colors.orangeAccent.shade700;
  var msg = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Your BMI',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Container(
              color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: weightController,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Weight',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: feetController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.height),
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      hintText: 'Enter your height in feet',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: inchController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.height_rounded),
                      hintText: 'Enter your height in inch',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      var weightText = weightController.text;
                      var feetText = feetController.text;
                      var inchText = inchController.text;
                      if (weightText.isNotEmpty && feetText.isNotEmpty && inchText.isNotEmpty) {
                        // BMI calculator logic
                        var weightInt = int.parse(weightText);
                        var feetInt = int.parse(feetText);
                        var inchInt = int.parse(inchText);
                        var heightInInches = feetInt * 12 + inchInt;
                        var heightInCm = heightInInches * 2.54;
                        var heightInMeter = heightInCm /100;
                        var BMI = weightInt/ (heightInMeter * heightInMeter);

                        if(BMI > 25){
                          msg = "you're overweight";
                          bgColor = Colors.grey;
                        }else if(BMI < 18){
                          msg = "you're underweight";
                          bgColor = Colors.pink;
                        }else{
                          msg = "your weight is healthy";
                          bgColor = Colors.green;
                        }
                        setState(() {
                          result = "Your BMI is  ${BMI.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all the blanks";
                        });
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      child: Center(child: Text('Calculate',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),)),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Added space between button and result text
                  Text(
                    result,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(msg,
                    style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
