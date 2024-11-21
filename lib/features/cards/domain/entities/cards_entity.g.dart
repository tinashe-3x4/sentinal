// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardImpl _$$CardImplFromJson(Map<String, dynamic> json) => _$CardImpl(
      id: json['id'] as String,
      cardNumber: json['cardNumber'] as String,
      cardType: json['cardType'] as String,
      expirationDate: json['expirationDate'] as String,
      assetPath: json['assetPath'] as String,
    );

Map<String, dynamic> _$$CardImplToJson(_$CardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardNumber': instance.cardNumber,
      'cardType': instance.cardType,
      'expirationDate': instance.expirationDate,
      'assetPath': instance.assetPath,
    };
