import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  var wightController = TextEditingController();
  var gramController = TextEditingController();
  var fitController = TextEditingController();
  var inchController = TextEditingController();

  var result = '';
  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        color: bgColor ?? Colors.indigo.shade200,
        child: Center(
          child: Column(
            children: [
              Container(
                width: 300,
                //color: Colors.amberAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Calculate Your BMI',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: wightController,
                      decoration: InputDecoration(
                          label: Text('Enter your wight in kg'),
                          prefixIcon: Icon(Icons.line_weight)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: gramController,
                      decoration: InputDecoration(
                          label: Text('Enter your wight in grams'),
                          prefixIcon: Icon(Icons.line_weight)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: fitController,
                      decoration: InputDecoration(
                          label: Text('Enter your height in fits'),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: inchController,
                      decoration: InputDecoration(
                          label: Text('Enter your wight in inchs'),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          var wt = wightController.text.toString();
                          var gt = gramController.text.toString();
                          var ft = fitController.text.toString();
                          var inch = inchController.text.toString();

                          if (wt != '' && gt != '' && ft != '' && inch != '') {
                            //calculation

                            var intwt = int.parse(wt);
                            var intgt = int.parse(gt);
                            var intft = int.parse(ft);
                            var intinch = int.parse(inch);

                            var kg_weight_in_gram = intwt * 1000;
                            var total_wight_in_gram =
                                (kg_weight_in_gram + intgt);
                            var total_wight = (total_wight_in_gram / 1000);

                            var total_inch = ((intft * 12) + intinch);
                            var total_centimeter = (total_inch * 2.54);
                            var total_meter = (total_centimeter / 100);

                            var bmi =
                                (total_wight / (total_meter * total_meter));

                            setState(() {
                              if (bmi < 18.5) {
                                result = 'You are in Underweight';
                                bgColor = Colors.white54;
                              } else if (bmi >= 18.5 && bmi <= 24.9) {
                                result =
                                    'Congratulations!\nYou have a healthy weight.';
                                bgColor = Colors.green;
                              } else if (bmi >= 25 && bmi <= 29.9) {
                                result = 'You are in Overweight';
                                bgColor = Colors.yellow;
                              } else if (bmi >= 30 && bmi <= 39.9) {
                                result = 'You have Obesity';
                                bgColor = Colors.amber[900];
                              } else {
                                result = 'Danger zone!\nSeverely Obese.';
                                bgColor = Colors.red;
                              }
                              result +=
                                  '\nYour BMI is ${bmi.toStringAsFixed(2)}';
                            });
                          } else {
                            //print('Please enter all the fields.');
                            setState(() {
                              result = 'Please enter all the fields.';
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent[700]),
                        child: Text(
                          'Calculate',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      result,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                 padding: EdgeInsets.only(left: 30),
                child: Column(              
                  children: [                  
                    Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white54,
                            radius: 12,
                          ),
                          Text(
                            'UnderWeight     ',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Under 18.5    ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(    
                padding: EdgeInsets.only(left: 30),           
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green[400],
                      radius: 12,
                    ),
                    Text(
                      'Healthy Weaight     ',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '18.5-24.9 ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.yellow,
                      radius: 12,
                    ),
                    Text(
                      'OverWeight     ',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '25-29.9 ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.amber[900],
                      radius: 12,
                    ),
                    Text(
                      'Obese     ',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '30-39.9 ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 12,
                    ),
                    Text(
                      'Severely Obese     ',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '40 or Over ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
