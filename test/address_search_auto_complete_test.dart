import 'package:flutter_test/flutter_test.dart';
import 'package:address_search_auto_complete/address_search_auto_complete.dart';
import 'package:address_search_auto_complete/address_search_auto_complete_platform_interface.dart';
import 'package:address_search_auto_complete/address_search_auto_complete_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAddressSearchAutoCompletePlatform
    with MockPlatformInterfaceMixin
    implements AddressSearchAutoCompletePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AddressSearchAutoCompletePlatform initialPlatform = AddressSearchAutoCompletePlatform.instance;

  test('$MethodChannelAddressSearchAutoComplete is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAddressSearchAutoComplete>());
  });

  test('getPlatformVersion', () async {
    AddressSearchAutoComplete addressSearchAutoCompletePlugin = AddressSearchAutoComplete();
    MockAddressSearchAutoCompletePlatform fakePlatform = MockAddressSearchAutoCompletePlatform();
    AddressSearchAutoCompletePlatform.instance = fakePlatform;

    expect(await addressSearchAutoCompletePlugin.getPlatformVersion(), '42');
  });
}
