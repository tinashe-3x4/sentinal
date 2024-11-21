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
  static const VerificationMeta _assetPathMeta =
      const VerificationMeta('assetPath');
  @override
  late final GeneratedColumn<String> assetPath = GeneratedColumn<String>(
      'asset_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, cardNumber, cardType, expirationDate, assetPath];
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
    if (data.containsKey('asset_path')) {
      context.handle(_assetPathMeta,
          assetPath.isAcceptableOrUnknown(data['asset_path']!, _assetPathMeta));
    } else if (isInserting) {
      context.missing(_assetPathMeta);
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
      assetPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}asset_path'])!,
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
  final String assetPath;
  const Card(
      {required this.id,
      required this.cardNumber,
      required this.cardType,
      required this.expirationDate,
      required this.assetPath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['card_number'] = Variable<String>(cardNumber);
    map['card_type'] = Variable<String>(cardType);
    map['expiration_date'] = Variable<String>(expirationDate);
    map['asset_path'] = Variable<String>(assetPath);
    return map;
  }

  CardsCompanion toCompanion(bool nullToAbsent) {
    return CardsCompanion(
      id: Value(id),
      cardNumber: Value(cardNumber),
      cardType: Value(cardType),
      expirationDate: Value(expirationDate),
      assetPath: Value(assetPath),
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
      assetPath: serializer.fromJson<String>(json['assetPath']),
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
      'assetPath': serializer.toJson<String>(assetPath),
    };
  }

  Card copyWith(
          {int? id,
          String? cardNumber,
          String? cardType,
          String? expirationDate,
          String? assetPath}) =>
      Card(
        id: id ?? this.id,
        cardNumber: cardNumber ?? this.cardNumber,
        cardType: cardType ?? this.cardType,
        expirationDate: expirationDate ?? this.expirationDate,
        assetPath: assetPath ?? this.assetPath,
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
      assetPath: data.assetPath.present ? data.assetPath.value : this.assetPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Card(')
          ..write('id: $id, ')
          ..write('cardNumber: $cardNumber, ')
          ..write('cardType: $cardType, ')
          ..write('expirationDate: $expirationDate, ')
          ..write('assetPath: $assetPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, cardNumber, cardType, expirationDate, assetPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Card &&
          other.id == this.id &&
          other.cardNumber == this.cardNumber &&
          other.cardType == this.cardType &&
          other.expirationDate == this.expirationDate &&
          other.assetPath == this.assetPath);
}

class CardsCompanion extends UpdateCompanion<Card> {
  final Value<int> id;
  final Value<String> cardNumber;
  final Value<String> cardType;
  final Value<String> expirationDate;
  final Value<String> assetPath;
  const CardsCompanion({
    this.id = const Value.absent(),
    this.cardNumber = const Value.absent(),
    this.cardType = const Value.absent(),
    this.expirationDate = const Value.absent(),
    this.assetPath = const Value.absent(),
  });
  CardsCompanion.insert({
    this.id = const Value.absent(),
    required String cardNumber,
    required String cardType,
    required String expirationDate,
    required String assetPath,
  })  : cardNumber = Value(cardNumber),
        cardType = Value(cardType),
        expirationDate = Value(expirationDate),
        assetPath = Value(assetPath);
  static Insertable<Card> custom({
    Expression<int>? id,
    Expression<String>? cardNumber,
    Expression<String>? cardType,
    Expression<String>? expirationDate,
    Expression<String>? assetPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cardNumber != null) 'card_number': cardNumber,
      if (cardType != null) 'card_type': cardType,
      if (expirationDate != null) 'expiration_date': expirationDate,
      if (assetPath != null) 'asset_path': assetPath,
    });
  }

  CardsCompanion copyWith(
      {Value<int>? id,
      Value<String>? cardNumber,
      Value<String>? cardType,
      Value<String>? expirationDate,
      Value<String>? assetPath}) {
    return CardsCompanion(
      id: id ?? this.id,
      cardNumber: cardNumber ?? this.cardNumber,
      cardType: cardType ?? this.cardType,
      expirationDate: expirationDate ?? this.expirationDate,
      assetPath: assetPath ?? this.assetPath,
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
    if (assetPath.present) {
      map['asset_path'] = Variable<String>(assetPath.value);
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
          ..write('assetPath: $assetPath')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CardsTable cards = $CardsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cards];
}

typedef $$CardsTableCreateCompanionBuilder = CardsCompanion Function({
  Value<int> id,
  required String cardNumber,
  required String cardType,
  required String expirationDate,
  required String assetPath,
});
typedef $$CardsTableUpdateCompanionBuilder = CardsCompanion Function({
  Value<int> id,
  Value<String> cardNumber,
  Value<String> cardType,
  Value<String> expirationDate,
  Value<String> assetPath,
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

  ColumnFilters<String> get assetPath => $composableBuilder(
      column: $table.assetPath, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<String> get assetPath => $composableBuilder(
      column: $table.assetPath, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<String> get assetPath =>
      $composableBuilder(column: $table.assetPath, builder: (column) => column);
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
            Value<String> assetPath = const Value.absent(),
          }) =>
              CardsCompanion(
            id: id,
            cardNumber: cardNumber,
            cardType: cardType,
            expirationDate: expirationDate,
            assetPath: assetPath,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String cardNumber,
            required String cardType,
            required String expirationDate,
            required String assetPath,
          }) =>
              CardsCompanion.insert(
            id: id,
            cardNumber: cardNumber,
            cardType: cardType,
            expirationDate: expirationDate,
            assetPath: assetPath,
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CardsTableTableManager get cards =>
      $$CardsTableTableManager(_db, _db.cards);
}
