import 'package:freezed_annotation/freezed_annotation.dart';

part 'CounterDetails.g.dart';

@JsonSerializable(explicitToJson: true)
class CounterDetails{
  int? pageNumber;
  int? counterValue;


  CounterDetails({this.pageNumber, this.counterValue});

  factory CounterDetails.fromJson(Map<String, dynamic> json) => _$CounterDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CounterDetailsToJson(this);
}

