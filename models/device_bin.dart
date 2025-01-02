import 'dart:convert';

class DeviceBin {
	final String uuid;
	final String deviceUuid;
	final String binUuid;
	String? condition;
	int isSynchronized;
	final String createdAt;

	DeviceBin({
		required this.uuid,
		required this.deviceUuid,
		required this.binUuid,
		this.condition,
		required this.isSynchronized,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'device_uuid': deviceUuid,
			'bin_uuid': binUuid,
			'condition': condition,
			'is_synchronized': isSynchronized,
			'created_at': createdAt,
		};
	}

	factory DeviceBin.fromMap(Map<String, dynamic> map) {
		return DeviceBin(
			uuid: map['uuid'] ?? '',
			deviceUuid: map['device_uuid'] ?? '',
			binUuid: map['bin_uuid'] ?? '',
			condition: map['condition'] ?? 'Functional',
			isSynchronized: map['is_synchronized']?.toInt() ?? 0,
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory DeviceBin.fromJson(String source) => DeviceBin.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "device_uuid": "$deviceUuid", "bin_uuid": "$binUuid", "condition": "$condition", "is_synchronized": $isSynchronized, "created_at": "$createdAt"}';
	}
}