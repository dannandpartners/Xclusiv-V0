import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:xclusiv/data/xclusiv_data.dart';
import 'package:xclusiv/pages/create_event.dart';
import 'package:xclusiv/widgets/background_widget.dart';
import 'package:xclusiv/widgets/Reminder_button_widget.dart';
import 'package:xclusiv/widgets/event_card_widget.dart';
import 'package:xclusiv/models/user.dart';
import 'package:xclusiv/pages/event_page.dart';

User currentUser;

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  final controller = PageController();
  final String currentUserId = currentUser?.id;

  createEvent() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CreateEvent(currentUser: currentUser)));
  }

  eventPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EventPage(currentUser: currentUser)));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          //leading: Icon(Icons.close),
          actions: [
            IconButton(
              icon: Icon(
                Icons.post_add_sharp,
                size: 30,
                color: Colors.white,
              ),
              onPressed: createEvent,
            ),
            SizedBox(width: 15)
          ],
        ),
        body: Stack(
          children: [
            BackgroundWidget(controller: controller),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: eventPage,
                    child: CarouselSlider(
                      items:
                          events.map((e) => EventCardWidget(event: e)).toList(),
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        viewportFraction: 0.75,
                        height: MediaQuery.of(context).size.height * 0.7,
                        enlargeCenterPage: true,
                        onPageChanged: (index, _) => controller.animateToPage(
                          index,
                          duration: Duration(seconds: 1),
                          curve: Curves.ease,
                        ),
                      ),
                    ),
                  ),
                  BuyButtonWidget(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      );
}
