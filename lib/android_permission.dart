import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AndroidPermission extends GetxController {

  Future<void> requestAllPermissions() async {
    // List of permissions to request
    final permissions = [
      Permission.location, // ACCESS_FINE_LOCATION & ACCESS_COARSE_LOCATION
      Permission.storage, // READ_EXTERNAL_STORAGE & WRITE_EXTERNAL_STORAGE
      Permission.camera, // CAMERA
      Permission.microphone, // RECORD_AUDIO
      Permission.phone, // READ_PHONE_STATE, CALL_PHONE
      Permission.sms, // SEND_SMS, RECEIVE_SMS, READ_SMS
      Permission.contacts, // READ_CONTACTS, WRITE_CONTACTS, GET_ACCOUNTS
    ];

    // Request each permission
    for (Permission permission in permissions) {
      if (await permission.isDenied) {
        await permission.request();
      }
    }
  }

  Future<void> checkPermissionsImage() async {
    if (await Permission.storage.isDenied) {
      await Permission.storage.request();
    }
  }

  Future<void> checkPermissionsContacts() async {
    if (await Permission.contacts.isDenied) {
      await Permission.contacts.request();
    }
  }

  Future<void> checkPermissionsMicrophone() async {
    if (await Permission.microphone.isDenied) {
      await Permission.microphone.request();
    }
  }

}
