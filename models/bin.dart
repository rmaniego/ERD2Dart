import 'dart:convert';

class Bin {
	final String uuid;
	final String latitude;
	final String longitude;
	String? colorCode;
	String? composition;
	final String createdAt;

	Bin({
		required this.uuid,
		required this.latitude,
		required this.longitude,
		this.colorCode,
		this.composition,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'latitude': latitude,
			'longitude': longitude,
			'color_code': colorCode,
			'composition': composition,
			'created_at': createdAt,
		};
	}

	factory Bin.fromMap(Map<String, dynamic> map) {
		return Bin(
			uuid: map['uuid'] ?? '',
			latitude: map['latitude'] ?? '',
			longitude: map['longitude'] ?? '',
			colorCode: map['color_code'] ?? 'blue',
			composition: map['composition'] ?? 'non-biodegradable',
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Bin.fromJson(String source) => Bin.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "latitude": "$latitude", "longitude": "$longitude", "color_code": "$colorCode", "composition": "$composition", "created_at": "$createdAt"}';
	}
}