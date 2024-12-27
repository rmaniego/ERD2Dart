import 'dart:convert';

class Track {
	int? uuid;
	final String disposalUuid;
	final double setTimestamp;
	final double endTimestamp;
	final double originLatitude;
	final double originLongitude;
	final double targetLatitude;
	final double targetLongitude;
	final double distanceInMeters;
	final double speedMetersPerSecond;
	final String createdAt;

	Track({
		this.uuid,
		required this.disposalUuid,
		required this.setTimestamp,
		required this.endTimestamp,
		required this.originLatitude,
		required this.originLongitude,
		required this.targetLatitude,
		required this.targetLongitude,
		required this.distanceInMeters,
		required this.speedMetersPerSecond,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'disposal_uuid': disposalUuid,
			'set_timestamp': setTimestamp,
			'end_timestamp': endTimestamp,
			'origin_latitude': originLatitude,
			'origin_longitude': originLongitude,
			'target_latitude': targetLatitude,
			'target_longitude': targetLongitude,
			'distance_in_meters': distanceInMeters,
			'speed_meters_per_second': speedMetersPerSecond,
			'created_at': createdAt,
		};
	}

	factory Track.fromMap(Map<String, dynamic> map) {
		return Track(
			uuid: map['uuid'] ?? '',
			disposalUuid: map['disposal_uuid'] ?? '',
			setTimestamp: map['set_timestamp'] ?? 0.0,
			endTimestamp: map['end_timestamp'] ?? 0.0,
			originLatitude: map['origin_latitude'] ?? 0.0,
			originLongitude: map['origin_longitude'] ?? 0.0,
			targetLatitude: map['target_latitude'] ?? 0.0,
			targetLongitude: map['target_longitude'] ?? 0.0,
			distanceInMeters: map['distance_in_meters'] ?? 0.0,
			speedMetersPerSecond: map['speed_meters_per_second'] ?? 0.0,
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Track.fromJson(String source) => Track.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "disposal_uuid": "$disposalUuid", "set_timestamp": $setTimestamp, "end_timestamp": $endTimestamp, "origin_latitude": $originLatitude, "origin_longitude": $originLongitude, "target_latitude": $targetLatitude, "target_longitude": $targetLongitude, "distance_in_meters": $distanceInMeters, "speed_meters_per_second": $speedMetersPerSecond, "created_at": "$createdAt"}';
	}
}