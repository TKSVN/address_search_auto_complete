
import 'address_search_auto_complete_platform_interface.dart';

class AddressSearchAutoComplete {
  Future<String?> getPlatformVersion() {
    return AddressSearchAutoCompletePlatform.instance.getPlatformVersion();
  }
}
