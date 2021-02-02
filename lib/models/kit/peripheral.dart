import 'package:json_annotation/json_annotation.dart';
part 'peripheral.g.dart';

@JsonSerializable()
class Peripheral {
  int id;
  int kitId;
  int configurationId;
  int peripheralDefinitionId;
  String name;

  Peripheral(
    this.id,
    this.kitId,
    this.configurationId,
    this.peripheralDefinitionId,
    this.name,
  );

  factory Peripheral.fromJson(Map<String, dynamic> json) => _$PeripheralFromJson(json);
  Map<String, dynamic> toJson() => _$PeripheralToJson(this);

  @override
  String toString() {
    return 'Peripheral{id: $id, kitId: $kitId, configurationId: $configurationId, peripheralDefinitionId: $peripheralDefinitionId, name: $name}';
  }
}