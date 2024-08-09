// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishlistItemAdapter extends TypeAdapter<WishlistItem> {
  @override
  final int typeId = 0;

  @override
  WishlistItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WishlistItem(
      id: fields[0] as int,
      name: fields[1] as String,
      rent: fields[2] as String,
      bedroom: fields[3] as String,
      img: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WishlistItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.rent)  ..writeByte(3)
      ..write(obj.bedroom);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishlistItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
