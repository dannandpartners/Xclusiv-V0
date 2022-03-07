import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:xclusiv/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as Im;
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:xclusiv/models/event.dart';
import 'package:xclusiv/pages/home.dart';
import 'package:xclusiv/widgets/progress.dart';

class CreateEvent extends StatefulWidget {
  final User currentUser;

  CreateEvent({this.currentUser});

  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent>
    with AutomaticKeepAliveClientMixin<CreateEvent> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventTagController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();
  TextEditingController eventTimeController = TextEditingController();
  TextEditingController eventLocationController = TextEditingController();

  bool isLoading = false;
  Event event;
  bool _eventNameValid = true;
  bool _eventTagValid = true;
  bool _eventDateValid = true;
  bool _eventTimeValid = true;
  bool _eventLocationValid = true;

  PickedFile pickedFile;
  File file;
  bool isUploading = false;
  String eventId = Uuid().v4();

  // @override
  //void initState() {
  // super.initState();
  //getEvent();
  // }

  getEvent() async {
    setState(() {
      isLoading = true;
    });
    DocumentSnapshot doc = await eventRef.doc(widget.currentUser.id).get();
    event = Event.fromDocument(doc);
    eventNameController.text = event.eventName;
    eventTagController.text = event.eventTag;
    eventDateController.text = event.eventDate;
    eventTimeController.text = event.eventTime;
    eventLocationController.text = event.eventLocation;

    setState(() {
      isLoading = false;
    });
  }

  Column buildEventNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Event Name',
            style: TextStyle(color: Colors.white70),
          ),
        ),
        TextField(
          controller: eventNameController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Write Event Name',
            hintStyle: TextStyle(color: Colors.white),
            errorText: _eventNameValid ? null : 'Event Name too Short',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
      ],
    );
  }

  Column buildEventTagField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            '#Tag',
            style: TextStyle(color: Colors.white70),
          ),
        ),
        TextField(
          controller: eventTagController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            hintText: 'Write event #tag',
            errorText: _eventTagValid ? null : '#tag too Long',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
      ],
    );
  }

  Column buildEventDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Event Date',
            style: TextStyle(color: Colors.white70),
          ),
        ),
        TextField(
          controller: eventDateController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            hintText: 'Set event date',
            errorText: _eventDateValid ? null : 'Correct date',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
      ],
    );
  }

  Column buildEventTimeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Event Time',
            style: TextStyle(color: Colors.white70),
          ),
        ),
        TextField(
          controller: eventTimeController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            hintText: 'Set event time',
            errorText: _eventTimeValid ? null : 'Correct event time',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
      ],
    );
  }

  Column buildEventLocationField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Event Location',
            style: TextStyle(color: Colors.white70),
          ),
        ),
        TextField(
          controller: eventLocationController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            hintText: 'Write event address',
            errorText: _eventLocationValid ? null : 'Event address too Long',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
      ],
    );
  }

  updateEventData() {
    setState(() {
      eventNameController.text.trim().length < 5 ||
              eventNameController.text.isEmpty
          ? _eventNameValid = false
          : _eventNameValid = true;

      eventTagController.text.trim().length < 3 ||
              eventTagController.text.trim().length > 5
          ? _eventTagValid = false
          : _eventTagValid = true;

      eventDateController.text.trim().length < 8 ||
              eventDateController.text.isEmpty
          ? _eventNameValid = false
          : _eventNameValid = true;

      eventTimeController.text.trim().length < 7 ||
              eventTimeController.text.isEmpty
          ? _eventTimeValid = false
          : _eventTimeValid = true;

      eventLocationController.text.trim().length > 100 ||
              eventLocationController.text.isEmpty
          ? _eventLocationValid = false
          : _eventLocationValid = true;
    });
    if (_eventNameValid &&
        _eventDateValid &&
        _eventTimeValid &&
        _eventLocationValid) {
      eventRef.doc(widget.currentUser.id).update({
        'eventName': eventNameController.text,
        'eventTag': eventTagController.text,
        'eventDate': eventDateController.text,
        'eventTime': eventTimeController.text,
        'eventLocation': eventLocationController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Profile updated!'),
      ));
    }
  }

  handleChooseFromGallery() async {
    Navigator.pop(context);
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    //final File file = File(pickedFile.path);

    setState(() {
      this.pickedFile = pickedFile;
    });
  }

  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text('Create Post'),
            children: [
              SimpleDialogOption(
                child: Text('Image from Gallery'),
                onPressed: handleChooseFromGallery,
              ),
              SimpleDialogOption(
                child: Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  Container buildSplashScreen() {
    return Container(
      //color: Theme.of(context).accentColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/upload.svg',
            height: 100.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () => selectImage(context),
              child: Text(
                ' Upload Image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  clearImage() {
    setState(() {
      pickedFile = null;
    });
  }

  Future<String> uploadImage(imageFile) async {
    firebase_storage.UploadTask uploadTask =
        storageRef.child('preEvent_$eventId.jpg').putFile(imageFile);
    // StorageTaskSnapshot storageSnap = await uploadTask;
    //await storageSnap.ref.getDownloadURL()
    String downloadURL = await (await uploadTask).ref.getDownloadURL();
    return downloadURL;
  }

  createEventInFirestore(
      {String eventPhotoUrl,
      String eventLocation,
      String eventName,
      String eventTag,
      String eventType,
      String eventDate,
      String eventTime}) {
    eventRef
        .doc(widget.currentUser.id)
        .collection('userEvents')
        .doc(eventId)
        .set({
      'eventId': eventId,
      'eventName': eventName,
      'eventTag': eventTag,
      'eventType': eventType,
      'eventPhotoUrl': eventPhotoUrl,
      'eventDate': eventDate,
      'eventTime': eventTime,
      'eventLocation': eventLocation,
      'ownerId': widget.currentUser.id,
      'username': widget.currentUser.username,
      'userProfileImg': widget.currentUser.photoUrl,
      'timestamp': timestamp,
    });
  }

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    await compressImage();
    String eventPhotoUrl = await uploadImage(file);
    createEventInFirestore(
      eventPhotoUrl: eventPhotoUrl,
      eventLocation: eventLocationController.text,
      eventName: eventNameController.text,
      eventTag: eventTagController.text,
      eventDate: eventDateController.text,
      eventTime: eventTimeController.text,
    );
    eventNameController.clear();
    eventTagController.clear();
    eventDateController.clear();
    eventTimeController.clear();
    eventLocationController.clear();

    setState(() {
      pickedFile = null;
      isUploading = false;
      eventId = Uuid().v4();
    });
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    Im.Image imageFile =
        Im.decodeImage(File(pickedFile.path).readAsBytesSync());
    final compressedImageFile = File('$path/img_$eventId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));

    setState(() {
      file = File(pickedFile.path);
      file = compressedImageFile;
    });
  }

  Scaffold buildEventForm() {
    return Scaffold(
      backgroundColor: Colors.black87,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: clearImage,
        ),
        title: Text(
          'Create Event',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: isUploading ? null : () => handleSubmit(),
            child: Text(
              ' Save',
              style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
              // style: TextButton.styleFrom(primary: Colors.blueAccent,),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          isUploading ? linearProgress() : Text(''),
          Container(
            height: 220.0,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(File(pickedFile.path)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                buildEventNameField(),
                buildEventTagField(),
                buildEventDateField(),
                buildEventTimeField(),
                buildEventLocationField(),
                ElevatedButton.icon(
                  onPressed: getUserLocation,
                  icon: Icon(
                    Icons.my_location,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Use Current Location',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () => print('Invitation Tapped'),
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text(
              'Add Invites',
              style: TextStyle(
                //color: Theme.of(context).primaryColor,
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Divider(),
        ],
      ),
    );
  }

  getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print('Lat: $position');
    Placemark placemark = placemarks[0];
    String completeAddress =
        '${placemark.subThoroughfare} ${placemark.thoroughfare}, ${placemark.subLocality} ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea} ${placemark.postalCode}, ${placemark.country}';
    print(completeAddress);
    String formattedAddress = '${placemark.locality}, ${placemark.country}';
    eventLocationController.text = formattedAddress;
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return pickedFile == null ? buildSplashScreen() : buildEventForm();
  }
}
