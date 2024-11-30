import 'dart:convert';

class Bin {
	int? bin_id;
	final String account_id;
	final double bin_latitude;
	final double bin_longitude;
	final String bin_color_code;
	final String solid_waste_composition;
	int? bin_is_soft_deleted;
	final String bin_created_at;
	String? bin_modified_at;

	Bin({
		this.bin_id,
		required this.account_id,
		required this.bin_latitude,
		required this.bin_longitude,
		required this.bin_color_code,
		required this.solid_waste_composition,
		this.bin_is_soft_deleted,
		required this.bin_created_at,
		this.bin_modified_at,
	});

	Map<String, dynamic> toMap() {
		return {
			'bin_id': bin_id,
			'account_id': account_id,
			'bin_latitude': bin_latitude,
			'bin_longitude': bin_longitude,
			'bin_color_code': bin_color_code,
			'solid_waste_composition': solid_waste_composition,
			'bin_is_soft_deleted': bin_is_soft_deleted,
			'bin_created_at': bin_created_at,
			'bin_modified_at': bin_modified_at,
		};
	}

	factory Bin.fromMap(Map<String, dynamic> map) {
		return Bin(
			bin_id: map['bin_id']?.toInt() ?? 0,
			account_id: map['account_id'] ?? '',
			bin_latitude: map['bin_latitude'] ?? 0.0,
			bin_longitude: map['bin_longitude'] ?? 0.0,
			bin_color_code: map['bin_color_code'] ?? 'Blue',
			solid_waste_composition: map['solid_waste_composition'] ?? 'Bio-degradable',
			bin_is_soft_deleted: map['bin_is_soft_deleted']?.toInt() ?? 0,
			bin_created_at: map['bin_created_at'] ?? '',
			bin_modified_at: map['bin_modified_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Bin.fromJson(String source) => Bin.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"bin_id": $bin_id, "account_id": "$account_id", "bin_latitude": $bin_latitude, "bin_longitude": $bin_longitude, "bin_color_code": "$bin_color_code", "solid_waste_composition": "$solid_waste_composition", "bin_is_soft_deleted": $bin_is_soft_deleted, "bin_created_at": "$bin_created_at", "bin_modified_at": "$bin_modified_at"}';
	}
}