// Mocks generated by Mockito 5.4.4 from annotations
// in sentinal/test/features/cards/domain/usecase/get_cards_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:fpdart/fpdart.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:sentinal/app/errors/failure.dart' as _i5;
import 'package:sentinal/features/cards/domain/entities/cards_entity.dart'
    as _i6;
import 'package:sentinal/features/cards/domain/repositories/cards_repository.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [CardsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCardsRepository extends _i1.Mock implements _i2.CardsRepository {
  MockCardsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Either<_i5.Failure, List<_i6.CardEntity>>> getCards() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCards,
          [],
        ),
        returnValue:
            _i3.Future<_i4.Either<_i5.Failure, List<_i6.CardEntity>>>.value(
                _i7.dummyValue<_i4.Either<_i5.Failure, List<_i6.CardEntity>>>(
          this,
          Invocation.method(
            #getCards,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, List<_i6.CardEntity>>>);

  @override
  _i3.Future<_i4.Either<_i5.Failure, _i6.CardEntity>> createCard(
          _i6.CardEntity? card) =>
      (super.noSuchMethod(
        Invocation.method(
          #createCard,
          [card],
        ),
        returnValue: _i3.Future<_i4.Either<_i5.Failure, _i6.CardEntity>>.value(
            _i7.dummyValue<_i4.Either<_i5.Failure, _i6.CardEntity>>(
          this,
          Invocation.method(
            #createCard,
            [card],
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, _i6.CardEntity>>);
}