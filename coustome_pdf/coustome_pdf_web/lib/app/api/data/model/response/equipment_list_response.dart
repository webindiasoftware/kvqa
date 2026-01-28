/// value : [{"equipment_id":528,"equipment_name":"Air Compressor - Engine Driven 175L"},{"equipment_id":531,"equipment_name":"Bolero Camper"},{"equipment_id":524,"equipment_name":"DG SET 180KVA -NO-1"},{"equipment_id":525,"equipment_name":"DG SET 180KVA -NO-2"},{"equipment_id":526,"equipment_name":"DG SET 82.5KVA -NO-3"},{"equipment_id":529,"equipment_name":"Fire Pump - KOEL 69HP-2300"},{"equipment_id":532,"equipment_name":"Office Bolero"},{"equipment_id":530,"equipment_name":"Shift Vehicle "},{"equipment_id":533,"equipment_name":"Water Tanker"},{"equipment_id":527,"equipment_name":"XCMG CRANE 70T"}]

class EquipmentListResponse {
  EquipmentListResponse({List<EquipmentListValue>? value}) {
    _value = value;
  }

  EquipmentListResponse.fromJson(dynamic json) {
    if (json['value'] != null) {
      _value = [];
      json['value'].forEach((v) {
        _value?.add(EquipmentListValue.fromJson(v));
      });
    }
  }

  List<EquipmentListValue>? _value;

  List<EquipmentListValue>? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_value != null) {
      map['value'] = _value?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// equipment_id : 528
/// equipment_name : "Air Compressor - Engine Driven 175L"

class EquipmentListValue {
  EquipmentListValue({String? equipmentId, String? equipmentName}) {
    _equipmentId = equipmentId;
    _equipmentName = equipmentName;
  }

  EquipmentListValue.fromJson(dynamic json) {
    _equipmentId = json['equipment_id'].toString();
    _equipmentName = json['equipment_name'];
  }

  String? _equipmentId;
  String? _equipmentName;

  String? get equipmentId => _equipmentId;

  String? get equipmentName => _equipmentName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['equipment_id'] = _equipmentId;
    map['equipment_name'] = _equipmentName;
    return map;
  }
}
