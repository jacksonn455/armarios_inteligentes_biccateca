import 'package:cloud_firestore/cloud_firestore.dart';

class PreferenceData {
  String category;
  String title;
  String description;

  PreferenceData.fromDocument(DocumentSnapshot snapshot){

    title = snapshot.data["title"];
    description = snapshot.data["description"];

  }

  Map<String, dynamic> toResumedMap(){
    return {
      "title": title,
      "description": description,
    };
  }
}