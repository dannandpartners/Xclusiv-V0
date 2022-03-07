import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String eventId;
  final String eventName;
  final String eventTag;
  final String eventType;
  final String eventPhotoUrl;
  final String eventDate;
  final String eventTime;
  final String eventLocation;
  final String ownerId;
  final String username;
  final String userProfileImg;
  final Timestamp timestamp;
  final bool payment;
  final List<Person> invited;
  final List<Person> following;

  Event({
    this.eventId,
    this.eventName,
    this.eventTag,
    this.eventType,
    this.eventPhotoUrl,
    this.eventDate,
    this.eventTime,
    this.eventLocation,
    this.ownerId,
    this.username,
    this.userProfileImg,
    this.timestamp,
    this.payment,
    this.invited,
    this.following,
  });

  factory Event.fromDocument(DocumentSnapshot doc) {
    return Event(
      eventId: doc['eventId'],
      eventName: doc['eventName'],
      eventTag: doc['eventTag'],
      eventType: doc['eventType'],
      eventPhotoUrl: doc['photoUrl'],
      eventDate: doc['eventDate'],
      eventTime: doc['eventTime'],
      eventLocation: doc['eventLocation'],
      ownerId: doc['ownerId'],
      username: doc['username'],
      userProfileImg: doc['userProfileImg'],
      timestamp: doc['timestamp'],
      payment: doc['payment'],
    );
  }
}

class Person {
  final String name;
  final String imageUrl;

  Person({this.name, this.imageUrl});
}
