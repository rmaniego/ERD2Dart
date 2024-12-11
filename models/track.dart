import 'dart:convert';

class Track {
	int? id;
	final String track_uuid;
	final String activity_uuid;
	final String track_start_timestamp;
	final String track_end_timestamp;
	final double track_origin_latitude;
	final double track_origin_longitude;
	final double track_target_latitude;
	final double track_target_longitude;
	final double track_distance_meters;
	final double track_speed_meters_per_second;
	final double track_elevation_meters;
	final String track_created_at;

	Track({
		this.id,
		required this.track_uuid,
		required this.activity_uuid,
		required this.track_start_timestamp,
		required this.track_end_timestamp,
		required this.track_origin_latitude,
		required this.track_origin_longitude,
		required this.track_target_latitude,
		required this.track_target_longitude,
		required this.track_distance_meters,
		required this.track_speed_meters_per_second,
		required this.track_elevation_meters,
		required this.track_created_at,
	});

	Map<String, dynamic> toMap() {
		return {
			'id': id,
			'track_uuid': track_uuid,
			'activity_uuid': activity_uuid,
			'track_start_timestamp': track_start_timestamp,
			'track_end_timestamp': track_end_timestamp,
			'track_origin_latitude': track_origin_latitude,
			'track_origin_longitude': track_origin_longitude,
			'track_target_latitude': track_target_latitude,
			'track_target_longitude': track_target_longitude,
			'track_distance_meters': track_distance_meters,
			'track_speed_meters_per_second': track_speed_meters_per_second,
			'track_elevation_meters': track_elevation_meters,
			'track_created_at': track_created_at,
		};
	}

	factory Track.fromMap(Map<String, dynamic> map) {
		return Track(
			id: map['id']?.toInt() ?? 0,
			track_uuid: map['track_uuid'] ?? '',
			activity_uuid: map['activity_uuid'] ?? '',
			track_start_timestamp: map['track_start_timestamp'] ?? '',
			track_end_timestamp: map['track_end_timestamp'] ?? '',
			track_origin_latitude: map['track_origin_latitude'] ?? 0.0,
			track_origin_longitude: map['track_origin_longitude'] ?? 0.0,
			track_target_latitude: map['track_target_latitude'] ?? 0.0,
			track_target_longitude: map['track_target_longitude'] ?? 0.0,
			track_distance_meters: map['track_distance_meters'] ?? 0.0,
			track_speed_meters_per_second: map['track_speed_meters_per_second'] ?? 0.0,
			track_elevation_meters: map['track_elevation_meters'] ?? 0.0,
			track_created_at: map['track_created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Track.fromJson(String source) => Track.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"id": $id, "track_uuid": "$track_uuid", "activity_uuid": "$activity_uuid", "track_start_timestamp": "$track_start_timestamp", "track_end_timestamp": "$track_end_timestamp", "track_origin_latitude": $track_origin_latitude, "track_origin_longitude": $track_origin_longitude, "track_target_latitude": $track_target_latitude, "track_target_longitude": $track_target_longitude, "track_distance_meters": $track_distance_meters, "track_speed_meters_per_second": $track_speed_meters_per_second, "track_elevation_meters": $track_elevation_meters, "track_created_at": "$track_created_at"}';
	}
}