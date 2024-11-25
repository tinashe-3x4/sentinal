// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CardsTable extends Cards with TableInfo<$CardsTable, Card> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _cardNumberMeta =
      const VerificationMeta('cardNumber');
  @override
  late final GeneratedColumn<String> cardNumber = GeneratedColumn<String>(
      'card_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cardTypeMeta =
      const VerificationMeta('cardType');
  @override
  late final GeneratedColumn<String> cardType = GeneratedColumn<String>(
      'card_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _expirationDateMeta =
      const VerificationMeta('expirationDate');
  @override
  late final GeneratedColumn<String> expirationDate = GeneratedColumn<String>(
      'expiration_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cardHolderNameMeta =
      const VerificationMeta('cardHolderName');
  @override
  late final GeneratedColumn<String> cardHolderName = GeneratedColumn<String>(
      'card_holder_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cvvMeta = const VerificationMeta('cvv');
  @override
  late final GeneratedColumn<String> cvv = GeneratedColumn<String>(
      'cvv', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _issuedCountryMeta =
      const VerificationMeta('issuedCountry');
  @override
  late final GeneratedColumn<String> issuedCountry = GeneratedColumn<String>(
      'issued_country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        cardNumber,
        cardType,
        expirationDate,
        cardHolderName,
        cvv,
        issuedCountry
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cards';
  @override
  VerificationContext validateIntegrity(Insertable<Card> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('card_number')) {
      context.handle(
          _cardNumberMeta,
          cardNumber.isAcceptableOrUnknown(
              data['card_number']!, _cardNumberMeta));
    } else if (isInserting) {
      context.missing(_cardNumberMeta);
    }
    if (data.containsKey('card_type')) {
      context.handle(_cardTypeMeta,
          cardType.isAcceptableOrUnknown(data['card_type']!, _cardTypeMeta));
    } else if (isInserting) {
      context.missing(_cardTypeMeta);
    }
    if (data.containsKey('expiration_date')) {
      context.handle(
          _expirationDateMeta,
          expirationDate.isAcceptableOrUnknown(
              data['expiration_date']!, _expirationDateMeta));
    } else if (isInserting) {
      context.missing(_expirationDateMeta);
    }
    if (data.containsKey('card_holder_name')) {
      context.handle(
          _cardHolderNameMeta,
          cardHolderName.isAcceptableOrUnknown(
              data['card_holder_name']!, _cardHolderNameMeta));
    } else if (isInserting) {
      context.missing(_cardHolderNameMeta);
    }
    if (data.containsKey('cvv')) {
      context.handle(
          _cvvMeta, cvv.isAcceptableOrUnknown(data['cvv']!, _cvvMeta));
    } else if (isInserting) {
      context.missing(_cvvMeta);
    }
    if (data.containsKey('issued_country')) {
      context.handle(
          _issuedCountryMeta,
          issuedCountry.isAcceptableOrUnknown(
              data['issued_country']!, _issuedCountryMeta));
    } else if (isInserting) {
      context.missing(_issuedCountryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Card map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Card(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      cardNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card_number'])!,
      cardType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card_type'])!,
      expirationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}expiration_date'])!,
      cardHolderName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}card_holder_name'])!,
      cvv: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cvv'])!,
      issuedCountry: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}issued_country'])!,
    );
  }

  @override
  $CardsTable createAlias(String alias) {
    return $CardsTable(attachedDatabase, alias);
  }
}

class Card extends DataClass implements Insertable<Card> {
  final int id;
  final String cardNumber;
  final String cardType;
  final String expirationDate;
  final String cardHolderName;
  final String cvv;
  final String issuedCountry;
  const Card(
      {required this.id,
      required this.cardNumber,
      required this.cardType,
      required this.expirationDate,
      required this.cardHolderName,
      required this.cvv,
      required this.issuedCountry});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['card_number'] = Variable<String>(cardNumber);
    map['card_type'] = Variable<String>(cardType);
    map['expiration_date'] = Variable<String>(expirationDate);
    map['card_holder_name'] = Variable<String>(cardHolderName);
    map['cvv'] = Variable<String>(cvv);
    map['issued_country'] = Variable<String>(issuedCountry);
    return map;
  }

  CardsCompanion toCompanion(bool nullToAbsent) {
    return CardsCompanion(
      id: Value(id),
      cardNumber: Value(cardNumber),
      cardType: Value(cardType),
      expirationDate: Value(expirationDate),
      cardHolderName: Value(cardHolderName),
      cvv: Value(cvv),
      issuedCountry: Value(issuedCountry),
    );
  }

  factory Card.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Card(
      id: serializer.fromJson<int>(json['id']),
      cardNumber: serializer.fromJson<String>(json['cardNumber']),
      cardType: serializer.fromJson<String>(json['cardType']),
      expirationDate: serializer.fromJson<String>(json['expirationDate']),
      cardHolderName: serializer.fromJson<String>(json['cardHolderName']),
      cvv: serializer.fromJson<String>(json['cvv']),
      issuedCountry: serializer.fromJson<String>(json['issuedCountry']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cardNumber': serializer.toJson<String>(cardNumber),
      'cardType': serializer.toJson<String>(cardType),
      'expirationDate': serializer.toJson<String>(expirationDate),
      'cardHolderName': serializer.toJson<String>(cardHolderName),
      'cvv': serializer.toJson<String>(cvv),
      'issuedCountry': serializer.toJson<String>(issuedCountry),
    };
  }

  Card copyWith(
          {int? id,
          String? cardNumber,
          String? cardType,
          String? expirationDate,
          String? cardHolderName,
          String? cvv,
          String? issuedCountry}) =>
      Card(
        id: id ?? this.id,
        cardNumber: cardNumber ?? this.cardNumber,
        cardType: cardType ?? this.cardType,
        expirationDate: expirationDate ?? this.expirationDate,
        cardHolderName: cardHolderName ?? this.cardHolderName,
        cvv: cvv ?? this.cvv,
        issuedCountry: issuedCountry ?? this.issuedCountry,
      );
  Card copyWithCompanion(CardsCompanion data) {
    return Card(
      id: data.id.present ? data.id.value : this.id,
      cardNumber:
          data.cardNumber.present ? data.cardNumber.value : this.cardNumber,
      cardType: data.cardType.present ? data.cardType.value : this.cardType,
      expirationDate: data.expirationDate.present
          ? data.expirationDate.value
          : this.expirationDate,
      cardHolderName: data.cardHolderName.present
          ? data.cardHolderName.value
          : this.cardHolderName,
      cvv: data.cvv.present ? data.cvv.value : this.cvv,
      issuedCountry: data.issuedCountry.present
          ? data.issuedCountry.value
          : this.issuedCountry,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Card(')
          ..write('id: $id, ')
          ..write('cardNumber: $cardNumber, ')
          ..write('cardType: $cardType, ')
          ..write('expirationDate: $expirationDate, ')
          ..write('cardHolderName: $cardHolderName, ')
          ..write('cvv: $cvv, ')
          ..write('issuedCountry: $issuedCountry')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, cardNumber, cardType, expirationDate,
      cardHolderName, cvv, issuedCountry);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Card &&
          other.id == this.id &&
          other.cardNumber == this.cardNumber &&
          other.cardType == this.cardType &&
          other.expirationDate == this.expirationDate &&
          other.cardHolderName == this.cardHolderName &&
          other.cvv == this.cvv &&
          other.issuedCountry == this.issuedCountry);
}

class CardsCompanion extends UpdateCompanion<Card> {
  final Value<int> id;
  final Value<String> cardNumber;
  final Value<String> cardType;
  final Value<String> expirationDate;
  final Value<String> cardHolderName;
  final Value<String> cvv;
  final Value<String> issuedCountry;
  const CardsCompanion({
    this.id = const Value.absent(),
    this.cardNumber = const Value.absent(),
    this.cardType = const Value.absent(),
    this.expirationDate = const Value.absent(),
    this.cardHolderName = const Value.absent(),
    this.cvv = const Value.absent(),
    this.issuedCountry = const Value.absent(),
  });
  CardsCompanion.insert({
    this.id = const Value.absent(),
    required String cardNumber,
    required String cardType,
    required String expirationDate,
    required String cardHolderName,
    required String cvv,
    required String issuedCountry,
  })  : cardNumber = Value(cardNumber),
        cardType = Value(cardType),
        expirationDate = Value(expirationDate),
        cardHolderName = Value(cardHolderName),
        cvv = Value(cvv),
        issuedCountry = Value(issuedCountry);
  static Insertable<Card> custom({
    Expression<int>? id,
    Expression<String>? cardNumber,
    Expression<String>? cardType,
    Expression<String>? expirationDate,
    Expression<String>? cardHolderName,
    Expression<String>? cvv,
    Expression<String>? issuedCountry,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cardNumber != null) 'card_number': cardNumber,
      if (cardType != null) 'card_type': cardType,
      if (expirationDate != null) 'expiration_date': expirationDate,
      if (cardHolderName != null) 'card_holder_name': cardHolderName,
      if (cvv != null) 'cvv': cvv,
      if (issuedCountry != null) 'issued_country': issuedCountry,
    });
  }

  CardsCompanion copyWith(
      {Value<int>? id,
      Value<String>? cardNumber,
      Value<String>? cardType,
      Value<String>? expirationDate,
      Value<String>? cardHolderName,
      Value<String>? cvv,
      Value<String>? issuedCountry}) {
    return CardsCompanion(
      id: id ?? this.id,
      cardNumber: cardNumber ?? this.cardNumber,
      cardType: cardType ?? this.cardType,
      expirationDate: expirationDate ?? this.expirationDate,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cvv: cvv ?? this.cvv,
      issuedCountry: issuedCountry ?? this.issuedCountry,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cardNumber.present) {
      map['card_number'] = Variable<String>(cardNumber.value);
    }
    if (cardType.present) {
      map['card_type'] = Variable<String>(cardType.value);
    }
    if (expirationDate.present) {
      map['expiration_date'] = Variable<String>(expirationDate.value);
    }
    if (cardHolderName.present) {
      map['card_holder_name'] = Variable<String>(cardHolderName.value);
    }
    if (cvv.present) {
      map['cvv'] = Variable<String>(cvv.value);
    }
    if (issuedCountry.present) {
      map['issued_country'] = Variable<String>(issuedCountry.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardsCompanion(')
          ..write('id: $id, ')
          ..write('cardNumber: $cardNumber, ')
          ..write('cardType: $cardType, ')
          ..write('expirationDate: $expirationDate, ')
          ..write('cardHolderName: $cardHolderName, ')
          ..write('cvv: $cvv, ')
          ..write('issuedCountry: $issuedCountry')
          ..write(')'))
        .toString();
  }
}

class $BannedCountriesTable extends BannedCountries
    with TableInfo<$BannedCountriesTable, BannedCountry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BannedCountriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, country];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'banned_countries';
  @override
  VerificationContext validateIntegrity(Insertable<BannedCountry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BannedCountry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BannedCountry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country'])!,
    );
  }

  @override
  $BannedCountriesTable createAlias(String alias) {
    return $BannedCountriesTable(attachedDatabase, alias);
  }
}

class BannedCountry extends DataClass implements Insertable<BannedCountry> {
  final int id;
  final String country;
  const BannedCountry({required this.id, required this.country});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['country'] = Variable<String>(country);
    return map;
  }

  BannedCountriesCompanion toCompanion(bool nullToAbsent) {
    return BannedCountriesCompanion(
      id: Value(id),
      country: Value(country),
    );
  }

  factory BannedCountry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BannedCountry(
      id: serializer.fromJson<int>(json['id']),
      country: serializer.fromJson<String>(json['country']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'country': serializer.toJson<String>(country),
    };
  }

  BannedCountry copyWith({int? id, String? country}) => BannedCountry(
        id: id ?? this.id,
        country: country ?? this.country,
      );
  BannedCountry copyWithCompanion(BannedCountriesCompanion data) {
    return BannedCountry(
      id: data.id.present ? data.id.value : this.id,
      country: data.country.present ? data.country.value : this.country,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BannedCountry(')
          ..write('id: $id, ')
          ..write('country: $country')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, country);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BannedCountry &&
          other.id == this.id &&
          other.country == this.country);
}

class BannedCountriesCompanion extends UpdateCompanion<BannedCountry> {
  final Value<int> id;
  final Value<String> country;
  const BannedCountriesCompanion({
    this.id = const Value.absent(),
    this.country = const Value.absent(),
  });
  BannedCountriesCompanion.insert({
    this.id = const Value.absent(),
    required String country,
  }) : country = Value(country);
  static Insertable<BannedCountry> custom({
    Expression<int>? id,
    Expression<String>? country,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (country != null) 'country': country,
    });
  }

  BannedCountriesCompanion copyWith({Value<int>? id, Value<String>? country}) {
    return BannedCountriesCompanion(
      id: id ?? this.id,
      country: country ?? this.country,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BannedCountriesCompanion(')
          ..write('id: $id, ')
          ..write('country: $country')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CardsTable cards = $CardsTable(this);
  late final $BannedCountriesTable bannedCountries =
      $BannedCountriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cards, bannedCountries];
}

typedef $$CardsTableCreateCompanionBuilder = CardsCompanion Function({
  Value<int> id,
  required String cardNumber,
  required String cardType,
  required String expirationDate,
  required String cardHolderName,
  required String cvv,
  required String issuedCountry,
});
typedef $$CardsTableUpdateCompanionBuilder = CardsCompanion Function({
  Value<int> id,
  Value<String> cardNumber,
  Value<String> cardType,
  Value<String> expirationDate,
  Value<String> cardHolderName,
  Value<String> cvv,
  Value<String> issuedCountry,
});

class $$CardsTableFilterComposer extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cardNumber => $composableBuilder(
      column: $table.cardNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cardType => $composableBuilder(
      column: $table.cardType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get expirationDate => $composableBuilder(
      column: $table.expirationDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cardHolderName => $composableBuilder(
      column: $table.cardHolderName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cvv => $composableBuilder(
      column: $table.cvv, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get issuedCountry => $composableBuilder(
      column: $table.issuedCountry, builder: (column) => ColumnFilters(column));
}

class $$CardsTableOrderingComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cardNumber => $composableBuilder(
      column: $table.cardNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cardType => $composableBuilder(
      column: $table.cardType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get expirationDate => $composableBuilder(
      column: $table.expirationDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cardHolderName => $composableBuilder(
      column: $table.cardHolderName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cvv => $composableBuilder(
      column: $table.cvv, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get issuedCountry => $composableBuilder(
      column: $table.issuedCountry,
      builder: (column) => ColumnOrderings(column));
}

class $$CardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cardNumber => $composableBuilder(
      column: $table.cardNumber, builder: (column) => column);

  GeneratedColumn<String> get cardType =>
      $composableBuilder(column: $table.cardType, builder: (column) => column);

  GeneratedColumn<String> get expirationDate => $composableBuilder(
      column: $table.expirationDate, builder: (column) => column);

  GeneratedColumn<String> get cardHolderName => $composableBuilder(
      column: $table.cardHolderName, builder: (column) => column);

  GeneratedColumn<String> get cvv =>
      $composableBuilder(column: $table.cvv, builder: (column) => column);

  GeneratedColumn<String> get issuedCountry => $composableBuilder(
      column: $table.issuedCountry, builder: (column) => column);
}

class $$CardsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CardsTable,
    Card,
    $$CardsTableFilterComposer,
    $$CardsTableOrderingComposer,
    $$CardsTableAnnotationComposer,
    $$CardsTableCreateCompanionBuilder,
    $$CardsTableUpdateCompanionBuilder,
    (Card, BaseReferences<_$AppDatabase, $CardsTable, Card>),
    Card,
    PrefetchHooks Function()> {
  $$CardsTableTableManager(_$AppDatabase db, $CardsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> cardNumber = const Value.absent(),
            Value<String> cardType = const Value.absent(),
            Value<String> expirationDate = const Value.absent(),
            Value<String> cardHolderName = const Value.absent(),
            Value<String> cvv = const Value.absent(),
            Value<String> issuedCountry = const Value.absent(),
          }) =>
              CardsCompanion(
            id: id,
            cardNumber: cardNumber,
            cardType: cardType,
            expirationDate: expirationDate,
            cardHolderName: cardHolderName,
            cvv: cvv,
            issuedCountry: issuedCountry,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String cardNumber,
            required String cardType,
            required String expirationDate,
            required String cardHolderName,
            required String cvv,
            required String issuedCountry,
          }) =>
              CardsCompanion.insert(
            id: id,
            cardNumber: cardNumber,
            cardType: cardType,
            expirationDate: expirationDate,
            cardHolderName: cardHolderName,
            cvv: cvv,
            issuedCountry: issuedCountry,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CardsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CardsTable,
    Card,
    $$CardsTableFilterComposer,
    $$CardsTableOrderingComposer,
    $$CardsTableAnnotationComposer,
    $$CardsTableCreateCompanionBuilder,
    $$CardsTableUpdateCompanionBuilder,
    (Card, BaseReferences<_$AppDatabase, $CardsTable, Card>),
    Card,
    PrefetchHooks Function()>;
typedef $$BannedCountriesTableCreateCompanionBuilder = BannedCountriesCompanion
    Function({
  Value<int> id,
  required String country,
});
typedef $$BannedCountriesTableUpdateCompanionBuilder = BannedCountriesCompanion
    Function({
  Value<int> id,
  Value<String> country,
});

class $$BannedCountriesTableFilterComposer
    extends Composer<_$AppDatabase, $BannedCountriesTable> {
  $$BannedCountriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnFilters(column));
}

class $$BannedCountriesTableOrderingComposer
    extends Composer<_$AppDatabase, $BannedCountriesTable> {
  $$BannedCountriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnOrderings(column));
}

class $$BannedCountriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BannedCountriesTable> {
  $$BannedCountriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);
}

class $$BannedCountriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BannedCountriesTable,
    BannedCountry,
    $$BannedCountriesTableFilterComposer,
    $$BannedCountriesTableOrderingComposer,
    $$BannedCountriesTableAnnotationComposer,
    $$BannedCountriesTableCreateCompanionBuilder,
    $$BannedCountriesTableUpdateCompanionBuilder,
    (
      BannedCountry,
      BaseReferences<_$AppDatabase, $BannedCountriesTable, BannedCountry>
    ),
    BannedCountry,
    PrefetchHooks Function()> {
  $$BannedCountriesTableTableManager(
      _$AppDatabase db, $BannedCountriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BannedCountriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BannedCountriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BannedCountriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> country = const Value.absent(),
          }) =>
              BannedCountriesCompanion(
            id: id,
            country: country,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String country,
          }) =>
              BannedCountriesCompanion.insert(
            id: id,
            country: country,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BannedCountriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BannedCountriesTable,
    BannedCountry,
    $$BannedCountriesTableFilterComposer,
    $$BannedCountriesTableOrderingComposer,
    $$BannedCountriesTableAnnotationComposer,
    $$BannedCountriesTableCreateCompanionBuilder,
    $$BannedCountriesTableUpdateCompanionBuilder,
    (
      BannedCountry,
      BaseReferences<_$AppDatabase, $BannedCountriesTable, BannedCountry>
    ),
    BannedCountry,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CardsTableTableManager get cards =>
      $$CardsTableTableManager(_db, _db.cards);
  $$BannedCountriesTableTableManager get bannedCountries =>
      $$BannedCountriesTableTableManager(_db, _db.bannedCountries);
}
