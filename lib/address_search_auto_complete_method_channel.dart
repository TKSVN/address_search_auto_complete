import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'address_search_auto_complete_platform_interface.dart';

/// An implementation of [AddressSearchAutoCompletePlatform] that uses method channels.
class MethodChannelAddressSearchAutoComplete extends AddressSearchAutoCompletePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('address_search_auto_complete');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
