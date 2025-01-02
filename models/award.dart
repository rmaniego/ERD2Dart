import 'dart:convert';

class Award {
	final String uuid;
	final String leaderboardUuid;
	final String deviceUuid;
	final int points;
	final String createdAt;

	Award({
		required this.uuid,
		required this.leaderboardUuid,
		required this.deviceUuid,
		required this.points,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'leaderboard_uuid': leaderboardUuid,
			'device_uuid': deviceUuid,
			'points': points,
			'created_at': createdAt,
		};
	}

	factory Award.fromMap(Map<String, dynamic> map) {
		return Award(
			uuid: map['uuid'] ?? '',
			leaderboardUuid: map['leaderboard_uuid'] ?? '',
			deviceUuid: map['device_uuid'] ?? '',
			points: map['points']?.toInt() ?? 0,
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Award.fromJson(String source) => Award.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "leaderboard_uuid": "$leaderboardUuid", "device_uuid": "$deviceUuid", "points": $points, "created_at": "$createdAt"}';
	}
}