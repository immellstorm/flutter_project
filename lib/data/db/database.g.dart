// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MovieTableData extends DataClass implements Insertable<MovieTableData> {
  final int id;
  final String title;
  final String? picture;
  final double? voteAverage;
  final String? releaseDate;
  final String? description;
  final String? originLanguage;
  final String? officialSite;
  final String? ended;
  MovieTableData(
      {required this.id,
      required this.title,
      this.picture,
      this.voteAverage,
      this.releaseDate,
      this.description,
      this.originLanguage,
      this.officialSite,
      this.ended});
  factory MovieTableData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MovieTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      picture: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}picture']),
      voteAverage: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_average']),
      releaseDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      originLanguage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}origin_language']),
      officialSite: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}official_site']),
      ended: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ended']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || picture != null) {
      map['picture'] = Variable<String?>(picture);
    }
    if (!nullToAbsent || voteAverage != null) {
      map['vote_average'] = Variable<double?>(voteAverage);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<String?>(releaseDate);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || originLanguage != null) {
      map['origin_language'] = Variable<String?>(originLanguage);
    }
    if (!nullToAbsent || officialSite != null) {
      map['official_site'] = Variable<String?>(officialSite);
    }
    if (!nullToAbsent || ended != null) {
      map['ended'] = Variable<String?>(ended);
    }
    return map;
  }

  MovieTableCompanion toCompanion(bool nullToAbsent) {
    return MovieTableCompanion(
      id: Value(id),
      title: Value(title),
      picture: picture == null && nullToAbsent
          ? const Value.absent()
          : Value(picture),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      originLanguage: originLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(originLanguage),
      officialSite: officialSite == null && nullToAbsent
          ? const Value.absent()
          : Value(officialSite),
      ended:
          ended == null && nullToAbsent ? const Value.absent() : Value(ended),
    );
  }

  factory MovieTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovieTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      picture: serializer.fromJson<String?>(json['picture']),
      voteAverage: serializer.fromJson<double?>(json['voteAverage']),
      releaseDate: serializer.fromJson<String?>(json['releaseDate']),
      description: serializer.fromJson<String?>(json['description']),
      originLanguage: serializer.fromJson<String?>(json['originLanguage']),
      officialSite: serializer.fromJson<String?>(json['officialSite']),
      ended: serializer.fromJson<String?>(json['ended']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'picture': serializer.toJson<String?>(picture),
      'voteAverage': serializer.toJson<double?>(voteAverage),
      'releaseDate': serializer.toJson<String?>(releaseDate),
      'description': serializer.toJson<String?>(description),
      'originLanguage': serializer.toJson<String?>(originLanguage),
      'officialSite': serializer.toJson<String?>(officialSite),
      'ended': serializer.toJson<String?>(ended),
    };
  }

  MovieTableData copyWith(
          {int? id,
          String? title,
          String? picture,
          double? voteAverage,
          String? releaseDate,
          String? description,
          String? originLanguage,
          String? officialSite,
          String? ended}) =>
      MovieTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        picture: picture ?? this.picture,
        voteAverage: voteAverage ?? this.voteAverage,
        releaseDate: releaseDate ?? this.releaseDate,
        description: description ?? this.description,
        originLanguage: originLanguage ?? this.originLanguage,
        officialSite: officialSite ?? this.officialSite,
        ended: ended ?? this.ended,
      );
  @override
  String toString() {
    return (StringBuffer('MovieTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('picture: $picture, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('description: $description, ')
          ..write('originLanguage: $originLanguage, ')
          ..write('officialSite: $officialSite, ')
          ..write('ended: $ended')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, picture, voteAverage, releaseDate,
      description, originLanguage, officialSite, ended);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.picture == this.picture &&
          other.voteAverage == this.voteAverage &&
          other.releaseDate == this.releaseDate &&
          other.description == this.description &&
          other.originLanguage == this.originLanguage &&
          other.officialSite == this.officialSite &&
          other.ended == this.ended);
}

class MovieTableCompanion extends UpdateCompanion<MovieTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> picture;
  final Value<double?> voteAverage;
  final Value<String?> releaseDate;
  final Value<String?> description;
  final Value<String?> originLanguage;
  final Value<String?> officialSite;
  final Value<String?> ended;
  const MovieTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.picture = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.description = const Value.absent(),
    this.originLanguage = const Value.absent(),
    this.officialSite = const Value.absent(),
    this.ended = const Value.absent(),
  });
  MovieTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.picture = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.description = const Value.absent(),
    this.originLanguage = const Value.absent(),
    this.officialSite = const Value.absent(),
    this.ended = const Value.absent(),
  }) : title = Value(title);
  static Insertable<MovieTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String?>? picture,
    Expression<double?>? voteAverage,
    Expression<String?>? releaseDate,
    Expression<String?>? description,
    Expression<String?>? originLanguage,
    Expression<String?>? officialSite,
    Expression<String?>? ended,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (picture != null) 'picture': picture,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (releaseDate != null) 'release_date': releaseDate,
      if (description != null) 'description': description,
      if (originLanguage != null) 'origin_language': originLanguage,
      if (officialSite != null) 'official_site': officialSite,
      if (ended != null) 'ended': ended,
    });
  }

  MovieTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? picture,
      Value<double?>? voteAverage,
      Value<String?>? releaseDate,
      Value<String?>? description,
      Value<String?>? originLanguage,
      Value<String?>? officialSite,
      Value<String?>? ended}) {
    return MovieTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      picture: picture ?? this.picture,
      voteAverage: voteAverage ?? this.voteAverage,
      releaseDate: releaseDate ?? this.releaseDate,
      description: description ?? this.description,
      originLanguage: originLanguage ?? this.originLanguage,
      officialSite: officialSite ?? this.officialSite,
      ended: ended ?? this.ended,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (picture.present) {
      map['picture'] = Variable<String?>(picture.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double?>(voteAverage.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String?>(releaseDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (originLanguage.present) {
      map['origin_language'] = Variable<String?>(originLanguage.value);
    }
    if (officialSite.present) {
      map['official_site'] = Variable<String?>(officialSite.value);
    }
    if (ended.present) {
      map['ended'] = Variable<String?>(ended.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('picture: $picture, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('description: $description, ')
          ..write('originLanguage: $originLanguage, ')
          ..write('officialSite: $officialSite, ')
          ..write('ended: $ended')
          ..write(')'))
        .toString();
  }
}

class $MovieTableTable extends MovieTable
    with TableInfo<$MovieTableTable, MovieTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovieTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _pictureMeta = const VerificationMeta('picture');
  @override
  late final GeneratedColumn<String?> picture = GeneratedColumn<String?>(
      'picture', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<double?> voteAverage = GeneratedColumn<double?>(
      'vote_average', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String?> releaseDate = GeneratedColumn<String?>(
      'release_date', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _originLanguageMeta =
      const VerificationMeta('originLanguage');
  @override
  late final GeneratedColumn<String?> originLanguage = GeneratedColumn<String?>(
      'origin_language', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _officialSiteMeta =
      const VerificationMeta('officialSite');
  @override
  late final GeneratedColumn<String?> officialSite = GeneratedColumn<String?>(
      'official_site', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _endedMeta = const VerificationMeta('ended');
  @override
  late final GeneratedColumn<String?> ended = GeneratedColumn<String?>(
      'ended', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        picture,
        voteAverage,
        releaseDate,
        description,
        originLanguage,
        officialSite,
        ended
      ];
  @override
  String get aliasedName => _alias ?? 'movie_table';
  @override
  String get actualTableName => 'movie_table';
  @override
  VerificationContext validateIntegrity(Insertable<MovieTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('picture')) {
      context.handle(_pictureMeta,
          picture.isAcceptableOrUnknown(data['picture']!, _pictureMeta));
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('origin_language')) {
      context.handle(
          _originLanguageMeta,
          originLanguage.isAcceptableOrUnknown(
              data['origin_language']!, _originLanguageMeta));
    }
    if (data.containsKey('official_site')) {
      context.handle(
          _officialSiteMeta,
          officialSite.isAcceptableOrUnknown(
              data['official_site']!, _officialSiteMeta));
    }
    if (data.containsKey('ended')) {
      context.handle(
          _endedMeta, ended.isAcceptableOrUnknown(data['ended']!, _endedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovieTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MovieTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MovieTableTable createAlias(String alias) {
    return $MovieTableTable(attachedDatabase, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MovieTableTable movieTable = $MovieTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movieTable];
}
