import 'package:flutter_test/flutter_test.dart';
import 'package:address_search_auto_complete/address_search_auto_complete_platform_interface.dart';
import 'package:address_search_auto_complete/address_search_auto_complete_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAddressSearchAutoCompletePlatform
    with MockPlatformInterfaceMixin
    implements AddressSearchAutoCompletePlatform {

  @override
  Future<List<Map<String, dynamic>>> addressToLatLng(String address) {
    // TODO: implement addressToLatLng
    throw UnimplementedError();
  }

  @override
  Future<List<String>> searchAddress(String query) {
    // TODO: implement searchAddress
    throw UnimplementedError();
  }
}

void main() {
  final AddressSearchAutoCompletePlatform initialPlatform = AddressSearchAutoCompletePlatform.instance;

  test('$MethodChannelAddressSearchAutoComplete is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAddressSearchAutoComplete>());
  });
}
