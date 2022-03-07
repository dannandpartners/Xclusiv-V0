import 'package:cloud_firestore/cloud_firestore.dart';

class UserSettings {
  final bool allowInviteNotification;
  final bool allowPostNotification;
  final bool allowShopNotification;

  const UserSettings({
    this.allowInviteNotification = true,
    this.allowPostNotification = true,
    this.allowShopNotification = true,
  });

  factory UserSettings.fromDocument(DocumentSnapshot doc) {
    return UserSettings(
      allowInviteNotification: doc['allowInviteNotification'],
      allowPostNotification: doc['allowPostNotification'],
      allowShopNotification: doc['allowShopNotification'],
    );
  }
}
