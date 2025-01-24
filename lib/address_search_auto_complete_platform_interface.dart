import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'address_search_auto_complete_method_channel.dart';

abstract class AddressSearchAutoCompletePlatform extends PlatformInterface {
  /// Constructs a AddressSearchAutoCompletePlatform.
  AddressSearchAutoCompletePlatform() : super(token: _token);

  static final Object _token = Object();

  static AddressSearchAutoCompletePlatform _instance = MethodChannelAddressSearchAutoComplete();

  /// The default instance of [AddressSearchAutoCompletePlatform] to use.
  ///
  /// Defaults to [MethodChannelAddressSearchAutoComplete].
  static AddressSearchAutoCompletePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AddressSearchAutoCompletePlatform] when
  /// they register themselves.
  static set instance(AddressSearchAutoCompletePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
