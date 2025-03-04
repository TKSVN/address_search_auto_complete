import Flutter
import MapKit
import UIKit

public class AddressSearchAutoCompletePlugin: NSObject, FlutterPlugin {
  private let searchCompleter = MKLocalSearchCompleter()
  private var searchAddressResultsHandler: FlutterResult?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "address_search_auto_complete", binaryMessenger: registrar.messenger())
    let instance = AddressSearchAutoCompletePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "searchAddress":
      guard let arguments = call.arguments as? [String: Any],
            let query = arguments["query"] as? String else {
        result(FlutterError(code: "INVALID_ARGUMENTS",
                            message: "Query is required",
                            details: nil))
        return
      }
      searchAddress(query: query, completion: result)
    case "addressToLatLng":
      guard let arguments = call.arguments as? [String: Any],
            let address = arguments["address"] as? String else {
        result(FlutterError(code: "INVALID_ARGUMENTS",
                            message: "Address is required",
                            details: nil))
        return
      }
      addressToLatLng(query: address, completion: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func searchAddress(query: String, completion: @escaping FlutterResult) {
    searchCompleter.delegate = self
    searchCompleter.queryFragment = query
    searchAddressResultsHandler = completion
  }
}

extension AddressSearchAutoCompletePlugin: MKLocalSearchCompleterDelegate {
    public func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        let results = completer.results.map { $0.title + " " + $0.subtitle }
        searchAddressResultsHandler?(results)
        searchAddressResultsHandler = nil
    }

    public func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        searchAddressResultsHandler?(
            FlutterError(
                code: "SEARCH_ADDRESS_ERROR",
                message: error.localizedDescription,
                details: nil))
        searchAddressResultsHandler = nil
    }
}

extension AddressSearchAutoCompletePlugin {
    private func addressToLatLng(query: String, completion: @escaping FlutterResult) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query

        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let error = error {
                completion(
                    FlutterError(
                        code: "SEARCH_ERROR",
                        message: error.localizedDescription,
                        details: nil))
                return
            }

            guard let mapItems = response?.mapItems else {
                completion([])
                return
            }

            let results = mapItems.map { mapItem -> [String: Any] in
                let placemark = mapItem.placemark
                return [
                    "name": mapItem.name ?? "",
                    "latitude": placemark.coordinate.latitude,
                    "longitude": placemark.coordinate.longitude,
                    "address": [
                        "street": placemark.thoroughfare ?? "",
                        "city": placemark.locality ?? "",
                        "state": placemark.administrativeArea ?? "",
                        "postalCode": placemark.postalCode ?? "",
                        "country": placemark.country ?? "",
                    ],
                ]
            }

            completion(results)
        }
    }
}
