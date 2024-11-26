import 'dart:convert';

class Disposal {
	int? disposal_id;
	final String solid_waste_id;
	final String bin_id_of_target;
	final String track_id_at_origin;
	final String track_id_at_target;
	final String disposal_status;
	int? disposal_waste_is_soft_deleted;
	final String disposal_created_at;
	String? disposal_modified_at;

	Disposal({
		this.disposal_id,
		required this.solid_waste_id,
		required this.bin_id_of_target,
		required this.track_id_at_origin,
		required this.track_id_at_target,
		required this.disposal_status,
		this.disposal_waste_is_soft_deleted,
		required this.disposal_created_at,
		this.disposal_modified_at,
	});

	Map<String, dynamic> toMap() {
		return {
			'disposal_id': disposal_id,
			'solid_waste_id': solid_waste_id,
			'bin_id_of_target': bin_id_of_target,
			'track_id_at_origin': track_id_at_origin,
			'track_id_at_target': track_id_at_target,
			'disposal_status': disposal_status,
			'disposal_waste_is_soft_deleted': disposal_waste_is_soft_deleted,
			'disposal_created_at': disposal_created_at,
			'disposal_modified_at': disposal_modified_at,
		};
	}

	factory Disposal.fromMap(Map<String, dynamic> map) {
		return Disposal(
			disposal_id: map['disposal_id']?.toInt() ?? 0,
			solid_waste_id: map['solid_waste_id'] ?? '',
			bin_id_of_target: map['bin_id_of_target'] ?? '',
			track_id_at_origin: map['track_id_at_origin'] ?? '',
			track_id_at_target: map['track_id_at_target'] ?? '',
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
		return '{"disposal_id": $disposal_id, "solid_waste_id": "$solid_waste_id", "bin_id_of_target": "$bin_id_of_target", "track_id_at_origin": "$track_id_at_origin", "track_id_at_target": "$track_id_at_target", "disposal_status": "$disposal_status", "disposal_waste_is_soft_deleted": $disposal_waste_is_soft_deleted, "disposal_created_at": "$disposal_created_at", "disposal_modified_at": "$disposal_modified_at"}';
	}
}