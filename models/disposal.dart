import 'dart:convert';

class Disposal {
	int? id;
	final String disposal_uuid;
	final String solid_waste_uuid;
	final String bin_uuid_of_target;
	final String track_uuid_at_origin;
	final String track_uuid_at_target;
	final String disposal_status;
	int? disposal_waste_is_soft_deleted;
	final String disposal_created_at;
	String? disposal_modified_at;

	Disposal({
		this.id,
		required this.disposal_uuid,
		required this.solid_waste_uuid,
		required this.bin_uuid_of_target,
		required this.track_uuid_at_origin,
		required this.track_uuid_at_target,
		required this.disposal_status,
		this.disposal_waste_is_soft_deleted,
		required this.disposal_created_at,
		this.disposal_modified_at,
	});

	Map<String, dynamic> toMap() {
		return {
			'id': id,
			'disposal_uuid': disposal_uuid,
			'solid_waste_uuid': solid_waste_uuid,
			'bin_uuid_of_target': bin_uuid_of_target,
			'track_uuid_at_origin': track_uuid_at_origin,
			'track_uuid_at_target': track_uuid_at_target,
			'disposal_status': disposal_status,
			'disposal_waste_is_soft_deleted': disposal_waste_is_soft_deleted,
			'disposal_created_at': disposal_created_at,
			'disposal_modified_at': disposal_modified_at,
		};
	}

	factory Disposal.fromMap(Map<String, dynamic> map) {
		return Disposal(
			id: map['id']?.toInt() ?? 0,
			disposal_uuid: map['disposal_uuid'] ?? '',
			solid_waste_uuid: map['solid_waste_uuid'] ?? '',
			bin_uuid_of_target: map['bin_uuid_of_target'] ?? '',
			track_uuid_at_origin: map['track_uuid_at_origin'] ?? '',
			track_uuid_at_target: map['track_uuid_at_target'] ?? '',
			disposal_status: map['disposal_status'] ?? 'started',
			disposal_waste_is_soft_deleted: map['disposal_waste_is_soft_deleted']?.toInt() ?? 0,
			disposal_created_at: map['disposal_created_at'] ?? '',
			disposal_modified_at: map['disposal_modified_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Disposal.fromJson(String source) => Disposal.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"id": $id, "disposal_uuid": "$disposal_uuid", "solid_waste_uuid": "$solid_waste_uuid", "bin_uuid_of_target": "$bin_uuid_of_target", "track_uuid_at_origin": "$track_uuid_at_origin", "track_uuid_at_target": "$track_uuid_at_target", "disposal_status": "$disposal_status", "disposal_waste_is_soft_deleted": $disposal_waste_is_soft_deleted, "disposal_created_at": "$disposal_created_at", "disposal_modified_at": "$disposal_modified_at"}';
	}
}