import 'dart:convert';

class Landmark {
	final String uuid;
	String name;
	final String latitude;
	final String longitude;
	final String geoHash;
	int? isDeleted;
	int isSynchronized;
	final String createdAt;

	Landmark({
		required this.uuid,
		required this.name,
		required this.latitude,
		required this.longitude,
		required this.geoHash,
		this.isDeleted,
		required this.isSynchronized,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'name': name,
			'latitude': latitude,
			'longitude': longitude,
			'geo_hash': geoHash,
			'is_deleted': isDeleted,
			'is_synchronized': isSynchronized,
			'created_at': createdAt,
		};
	}

	factory Landmark.fromMap(Map<String, dynamic> map) {
		return Landmark(
			uuid: map['uuid'] ?? '',
			name: map['name'] ?? '',
			latitude: map['latitude'] ?? '',
			longitude: map['longitude'] ?? '',
			geoHash: map['geo_hash'] ?? '',
			isDeleted: map['is_deleted']?.toInt() ?? 0,
			isSynchronized: map['is_synchronized']?.toInt() ?? 0,
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Landmark.fromJson(String source) => Landmark.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "name": "$name", "latitude": "$latitude", "longitude": "$longitude", "geo_hash": "$geoHash", "is_deleted": $isDeleted, "is_synchronized": $isSynchronized, "created_at": "$createdAt"}';
	}
}