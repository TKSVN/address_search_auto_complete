import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'address_search_auto_complete_platform_interface.dart';

/// An implementation of [AddressSearchAutoCompletePlatform] that uses method channels.
class MethodChannelAddressSearchAutoComplete extends AddressSearchAutoCompletePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('address_search_auto_complete');

  @override
  Future<List<String>> searchAddress(String query) async {
    final List<dynamic>? results = await methodChannel.invokeMethod<List<dynamic>>(
      'searchAddress',
      {'query': query},
    );
    return results?.cast<String>() ?? [];
  }

  @override
  Future<List<Map<String, dynamic>>> addressToLatLng(String address) async {
    final List<dynamic>? results = await methodChannel.invokeMethod<List<dynamic>>(
      'addressToLatLng',
      {'address': address},
    );
    return results?.cast<Map<String, dynamic>>() ?? [];
  }
}
