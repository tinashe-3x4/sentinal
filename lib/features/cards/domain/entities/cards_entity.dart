import 'package:freezed_annotation/freezed_annotation.dart';

part 'cards_entity.freezed.dart';
part 'cards_entity.g.dart';

@freezed
class CardEntity with _$Card {
  const factory CardEntity({
    required String id,
    required String cardNumber,
    required String cardType,
    required String expirationDate,
    required String assetPath,
  }) = _Card;

  factory CardEntity.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}
