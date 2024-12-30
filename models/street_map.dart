import 'dart:convert';

class StreetMap {
	final String uuid;
	final String version;
	int isCurrent;
	int isSynchronized;
	final String createdAt;

	StreetMap({
		required this.uuid,
		required this.version,
		required this.isCurrent,
		required this.isSynchronized,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'version': version,
			'is_current': isCurrent,
			'is_synchronized': isSynchronized,
			'created_at': createdAt,
		};
	}

	factory StreetMap.fromMap(Map<String, dynamic> map) {
		return StreetMap(
			uuid: map['uuid'] ?? '',
			version: map['version'] ?? '',
			isCurrent: map['is_current']?.toInt() ?? 0,
			isSynchronized: map['is_synchronized']?.toInt() ?? 0,
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory StreetMap.fromJson(String source) => StreetMap.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "version": "$version", "is_current": $isCurrent, "is_synchronized": $isSynchronized, "created_at": "$createdAt"}';
	}
}