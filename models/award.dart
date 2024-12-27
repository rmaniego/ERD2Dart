import 'dart:convert';

class Award {
	String uuid;
	String leaderboardUuid;
	String accountUuid;
	final int points;
	final String createdAt;

	Award({
		required this.uuid,
		required this.leaderboardUuid,
		required this.accountUuid,
		required this.points,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'leaderboard_uuid': leaderboardUuid,
			'account_uuid': accountUuid,
			'points': points,
			'created_at': createdAt,
		};
	}

	factory Award.fromMap(Map<String, dynamic> map) {
		return Award(
			uuid: map['uuid'] ?? '',
			leaderboardUuid: map['leaderboard_uuid'] ?? '',
			accountUuid: map['account_uuid'] ?? '',
			points: map['points']?.toInt() ?? 0,
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Award.fromJson(String source) => Award.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "leaderboard_uuid": "$leaderboardUuid", "account_uuid": "$accountUuid", "points": $points, "created_at": "$createdAt"}';
	}
}