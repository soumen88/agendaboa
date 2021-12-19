// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PageDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageDetails _$PageDetailsFromJson(Map<String, dynamic> json) => PageDetails(
      pageKey: json['pageKey'] as String?,
      counterDetails: json['counterDetails'] == null
          ? null
          : CounterDetails.fromJson(
              json['counterDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PageDetailsToJson(PageDetails instance) =>
    <String, dynamic>{
      'pageKey': instance.pageKey,
      'counterDetails': instance.counterDetails?.toJson(),
    };
