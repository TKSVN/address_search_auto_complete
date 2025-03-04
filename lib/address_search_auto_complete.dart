import 'address_search_auto_complete_platform_interface.dart';

class AddressSearchAutoComplete {

  Future<List<String>> searchAddress(String query) {
    return AddressSearchAutoCompletePlatform.instance.searchAddress(query);
  }

  Future<List<Map<String, dynamic>>> addressToLatLng(String address) {
    return AddressSearchAutoCompletePlatform.instance.addressToLatLng(address);
  }
}
