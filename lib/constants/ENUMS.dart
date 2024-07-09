import 'package:freezed_annotation/freezed_annotation.dart';

enum TextSizes { small, medium, large }

// Constants of HTTP Requests
enum ResponseStatus { SAVED, FAILED, UNAUTHORIZED, AUTHORIZED, EXPIRED, NONE }

enum Categories { Metal, Paper, Plastic, Glass, Electronics }

// extension GetIndex on Categories {
//   int? getIndex(Categories value) {
//     switch (value) {
//       case Categories.Metal:
//         return 0;
//       default:
//         null;
//     }
//   }
// }

// extension ParseToString on Categories {
//   String toShortString() {
//     return toShortString().split('.').last;
//   }
// }
