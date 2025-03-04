# Address Search Auto Complete

<img src="https://tks.asia/wp-content/uploads/2022/01/logo-1024x337.png" alt="drawing" width="200"/>

---

A Flutter plugin that provides address search auto-completion functionality using native iOS MapKit. This plugin helps developers easily implement address search and geocoding features in their Flutter applications.

## Features

- Address Search Auto-completion
- Geocoding (Convert address to latitude/longitude)
- Native iOS MapKit Integration
- Type-safe API
- Easy to implement

## Getting Started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  address_search_auto_complete: ^0.0.1
```
## Usage
1. Import the package
``` java
import 'package:address_search_auto_complete/address_search_auto_complete.dart';
```
2. Initialize
 ``` java
 final _addressSearchAutoCompletePlugin = AddressSearchAutoComplete();
 ```
 3. Search Address
 ``` java
 final results = await _addressSearchAutoCompletePlugin.searchAddress("1 Infinite Loop");
// Returns a list of matching addresses
```
4. Get Coordinates from Address
``` java
final results = await _addressSearchAutoCompletePlugin.addressToLatLng("1 Infinite Loop");
// Returns a list of location details including coordinates
```
## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   No    | ✅  |  No   | No  |  No   |   No    |

## License
MIT License - see LICENSE file for details