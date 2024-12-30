import 'dart:convert';

class Node {
	final String uuid;
	final String streetMapUuid;
	final double originLatitude;
	final double originLongitude;
	final String originGeoHash;
	final double targetLatitude;
	final double targetLongitude;
	final String targetGeoHash;
	final double distanceInMeters;
	int isSynchronized;
	final String createdAt;

	Node({
		required this.uuid,
		required this.streetMapUuid,
		required this.originLatitude,
		required this.originLongitude,
		required this.originGeoHash,
		required this.targetLatitude,
		required this.targetLongitude,
		required this.targetGeoHash,
		required this.distanceInMeters,
		required this.isSynchronized,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'street_map_uuid': streetMapUuid,
			'origin_latitude': originLatitude,
			'origin_longitude': originLongitude,
			'origin_geo_hash': originGeoHash,
			'target_latitude': targetLatitude,
			'target_longitude': targetLongitude,
			'target_geo_hash': targetGeoHash,
			'distance_in_meters': distanceInMeters,
			'is_synchronized': isSynchronized,
			'created_at': createdAt,
		};
	}

	factory Node.fromMap(Map<String, dynamic> map) {
		return Node(
			uuid: map['uuid'] ?? '',
			streetMapUuid: map['street_map_uuid'] ?? '',
			originLatitude: map['origin_latitude'] ?? 0.0,
			originLongitude: map['origin_longitude'] ?? 0.0,
			originGeoHash: map['origin_geo_hash'] ?? '',
			targetLatitude: map['target_latitude'] ?? 0.0,
			targetLongitude: map['target_longitude'] ?? 0.0,
			targetGeoHash: map['target_geo_hash'] ?? '',
			distanceInMeters: map['distance_in_meters'] ?? 0.0,
			isSynchronized: map['is_synchronized']?.toInt() ?? 0,
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Node.fromJson(String source) => Node.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "street_map_uuid": "$streetMapUuid", "origin_latitude": $originLatitude, "origin_longitude": $originLongitude, "origin_geo_hash": "$originGeoHash", "target_latitude": $targetLatitude, "target_longitude": $targetLongitude, "target_geo_hash": "$targetGeoHash", "distance_in_meters": $distanceInMeters, "is_synchronized": $isSynchronized, "created_at": "$createdAt"}';
	}
}