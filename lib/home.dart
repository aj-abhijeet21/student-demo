import 'dart:convert';

import 'package:flutter/material.dart';

const String studentData = '''
  [{
	"roll_number": 85,
  "student_grade": "C",
	"date": "1984-12-31",
	"firstname": "Olivette",
	"lastname": "Pacorro",
	"city": "Taichung",
	"country": "Nicaragua",
	"countryCode": "GM",
	"email uses current data": "Olivette.Pacorro@gmail.com"
},
{
	"roll_number": 56,
  "student_grade": "F",
	"date": "1998-06-22",
	"firstname": "Laure",
	"lastname": "Elvyn",
	"city": "Simferopol",
	"country": "Gambia",
	"countryCode": "FO",
	"email uses current data": "Laure.Elvyn@gmail.com"
},
{
	"roll_number": 56,
  "student_grade": "A+",
	"date": "1998-06-22",
	"firstname": "Laure",
	"lastname": "Elvyn",
	"city": "Simferopol",
	"country": "Gambia",
	"countryCode": "FO",
	"email uses current data": "Laure.Elvyn@gmail.com"
},
{
	"roll_number": 55,
  "student_grade": "B",
	"date": "1982-04-25",
	"firstname": "Vanessa",
	"lastname": "Alabaster",
	"city": "Lviv",
	"country": "Ecuador",
	"countryCode": "JM",
	"email uses current data": "Vanessa.Alabaster@gmail.com"
},
{
	"roll_number": 26,
  "student_grade": "A",
	"date": "1995-11-04",
	"firstname": "Belva",
	"lastname": "Atcliffe",
	"city": "Valparaíso",
	"country": "Sierra Leone",
	"countryCode": "MP",
	"email uses current data": "Belva.Atcliffe@gmail.com"
}
]''';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List jsonData = json.decode(studentData);

  Future showModal(BuildContext context, Map<String, dynamic> json) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Student Details: ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Name: ${json['firstname']} ${json['lastname']}',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                'Roll no: ' + json['roll_number'].toString(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                'Grade: ' + json['student_grade'],
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                'Admission Date: ' + json['date'],
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                'City: ' + json['city'],
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                'Country: ' + json['country'],
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                'Email: ' + json['email uses current data'],
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: ListView.builder(
        itemCount: jsonData.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => showModal(
              context,
              jsonData[index],
            ),
            child: StudentCard.fromJson(
              jsonData[index],
            ),
          );
        },
        padding: EdgeInsets.all(8.0),
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  String student_name;
  String student_roll;
  String student_grade;
  String student_city;
  String student_admission_date;

  StudentCard.fromJson(Map<String, dynamic> json)
      : student_name = json['firstname'] + json['lastname'],
        student_grade = json['student_grade'],
        student_roll = json['roll_number'].toString(),
        student_city = json['city'].toString(),
        student_admission_date = json['date'].toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
      margin: EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: $student_name'),
          Text('Roll: $student_roll'),
          Text('Grade: $student_grade'),
        ],
      ),
    );
  }
}
