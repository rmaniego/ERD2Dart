import 'dart:convert';

class Bin {
	final String uuid;
	final String latitude;
	final String longitude;
	final String geoHash;
	String? colorCode;
	String? composition;
	String approvalStatus;
	int isSynchronized;
	final String createdAt;

	Bin({
		required this.uuid,
		required this.latitude,
		required this.longitude,
		required this.geoHash,
		this.colorCode,
		this.composition,
		required this.approvalStatus,
		required this.isSynchronized,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'latitude': latitude,
			'longitude': longitude,
			'geo_hash': geoHash,
			'color_code': colorCode,
			'composition': composition,
			'approval_status': approvalStatus,
			'is_synchronized': isSynchronized,
			'created_at': createdAt,
		};
	}

	factory Bin.fromMap(Map<String, dynamic> map) {
		return Bin(
			uuid: map['uuid'] ?? '',
			latitude: map['latitude'] ?? '',
			longitude: map['longitude'] ?? '',
			geoHash: map['geo_hash'] ?? '',
			colorCode: map['color_code'] ?? 'Blue',
			composition: map['composition'] ?? 'Non-biodegradable',
			approvalStatus: map['approval_status'] ?? 'pending',
			isSynchronized: map['is_synchronized']?.toInt() ?? 0,
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Bin.fromJson(String source) => Bin.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "latitude": "$latitude", "longitude": "$longitude", "geo_hash": "$geoHash", "color_code": "$colorCode", "composition": "$composition", "approval_status": "$approvalStatus", "is_synchronized": $isSynchronized, "created_at": "$createdAt"}';
	}
}