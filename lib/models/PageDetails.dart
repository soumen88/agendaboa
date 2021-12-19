import 'package:agendaboa/models/CounterDetails.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'PageDetails.g.dart';

@JsonSerializable(explicitToJson: true)
class PageDetails{
  String? pageKey;
  CounterDetails? counterDetails;


  PageDetails({this.pageKey, this.counterDetails});

  factory PageDetails.fromJson(Map<String, dynamic> json) => _$PageDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PageDetailsToJson(this);
}

