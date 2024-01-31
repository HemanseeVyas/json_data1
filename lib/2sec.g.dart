// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2sec.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class datas extends _datas with RealmEntity, RealmObjectBase, RealmObject {
  datas(
    String name,
    String contact,
  ) {
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'contact', contact);
  }

  datas._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get contact => RealmObjectBase.get<String>(this, 'contact') as String;
  @override
  set contact(String value) => RealmObjectBase.set(this, 'contact', value);

  @override
  Stream<RealmObjectChanges<datas>> get changes =>
      RealmObjectBase.getChanges<datas>(this);

  @override
  datas freeze() => RealmObjectBase.freezeObject<datas>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(datas._);
    return const SchemaObject(ObjectType.realmObject, datas, 'datas', [
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('contact', RealmPropertyType.string),
    ]);
  }
}
