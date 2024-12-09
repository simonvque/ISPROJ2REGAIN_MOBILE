import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:regain_mobile/model/commissions_model.dart';

part 'commissions_total.freezed.dart';
part 'commissions_total.g.dart';

@unfreezed
class CommissionsTotal with _$CommissionsTotal {
  factory CommissionsTotal(
      {required String totalBal,
      List<CommissionsModel>? commsList}) = _CommissionsTotal;
  factory CommissionsTotal.fromJson(Map<String, dynamic> json) =>
      _$CommissionsTotalFromJson(json);
}
