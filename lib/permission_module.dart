library permission_module;

import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionModule {
  requestMultiplePermissions(List<Permission> permissionsList) async {
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses =
    await permissionsList.request();

    if (statuses[Permission.location]!.isDenied) {
      print("Location permission is denied.");
    }

    if (statuses[Permission.camera]!.isDenied) {
      print("Camera permission is denied.");
    }

    if (statuses[Permission.storage]!.isDenied) {
      print("Storage permission is denied.");
    }
  }

  Future<bool> requestSinglePermission(Permission permission) async {
    PermissionStatus result = PermissionStatus.denied;
    // In Android we need to request the storage permission,
    // while in iOS is the photos permission
    // if (Platform.isAndroid) {
    result = await permission.request();
    // }
    // else {
    //   result = await Permission.location.request();
    // }

    if (result.isGranted) {
      return true;
    } else if (Platform.isIOS || result.isPermanentlyDenied) {
      return false;
    } else {
      return false;
    }
  }
}
