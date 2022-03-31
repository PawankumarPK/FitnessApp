import 'package:flutter/material.dart';

class RelatedDoctors {
  const RelatedDoctors(
      {required this.id,
      required this.doctorName,
      required this.contactNo,
        required this.state,
        required this.specialist,
      });

  final int id;
  final String contactNo;
  final String doctorName;
  final String state;
  final String specialist;
}

///-----------------------------  All doctors list  -----------------
const List<RelatedDoctors> doctors = <RelatedDoctors>[
  RelatedDoctors(
    id: 0,
    contactNo: "9999999999",
    doctorName: "Dr. Harsh",
    specialist: "Heart Specialist",
    state: "New Delhi"
  ),
  RelatedDoctors(
    id: 0,
    contactNo: "8888888888",
    doctorName: "Dr. Rohit",
      specialist: "Back Specialist",
      state: "Mumbai"
  ),
  RelatedDoctors(
    id: 0,
    contactNo: "7777777777",
    doctorName:
    "Dr. Ajay",
      specialist: "Pain Specialist",
      state: "Chennai"
  ),
  RelatedDoctors(
    id: 0,
    contactNo: "6666666666",
    doctorName:
    "Dr. Manisha",
      specialist: "Chest Specialist",
      state: "Bangalore"
  ),RelatedDoctors(
    id: 0,
    contactNo: "5555555555",
    doctorName:
    "Dr. Kajal",
      specialist: "Body Specialist",
      state: "Lucknow"
  ),
  RelatedDoctors(
    id: 0,
    contactNo: "4444444444",
    doctorName:
    "Dr. Anjali",
      specialist: "Skin Specialist",
      state: "Maharashtra"
  ),
];
