// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'islemlerModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IslemlerModelAdapter extends TypeAdapter<IslemlerModel> {
  @override
  final int typeId = 0;

  @override
  IslemlerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IslemlerModel(
      baslik: fields[0] as String,
      kategori: fields[1] as String,
      isKazanc: fields[2] as bool,
      tutar: fields[3] as double,
      kartNo: fields[4] as int,
      tarih: fields[6] as DateTime,
    )..hiveIndex = fields[5] as int;
  }

  @override
  void write(BinaryWriter writer, IslemlerModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.baslik)
      ..writeByte(1)
      ..write(obj.kategori)
      ..writeByte(2)
      ..write(obj.isKazanc)
      ..writeByte(3)
      ..write(obj.tutar)
      ..writeByte(4)
      ..write(obj.kartNo)
      ..writeByte(5)
      ..write(obj.hiveIndex)
      ..writeByte(6)
      ..write(obj.tarih);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IslemlerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
