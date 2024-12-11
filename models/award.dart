import 'dart:convert';

class Award {
	int? id;
	final String award_uuid;
	final String leaderboard_uuid;
	final String account_uuid;
	final int award_points;
	final String award_created_at;

	Award({
		this.id,
		required this.award_uuid,
		required this.leaderboard_uuid,
		required this.account_uuid,
		required this.award_points,
		required this.award_created_at,
	});

	Map<String, dynamic> toMap() {
		return {
			'id': id,
			'award_uuid': award_uuid,
			'leaderboard_uuid': leaderboard_uuid,
			'account_uuid': account_uuid,
			'award_points': award_points,
			'award_created_at': award_created_at,
		};
	}

	factory Award.fromMap(Map<String, dynamic> map) {
		return Award(
			id: map['id']?.toInt() ?? 0,
			award_uuid: map['award_uuid'] ?? '',
			leaderboard_uuid: map['leaderboard_uuid'] ?? '',
			account_uuid: map['account_uuid'] ?? '',
			award_points: map['award_points']?.toInt() ?? 0,
			award_created_at: map['award_created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Award.fromJson(String source) => Award.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"id": $id, "award_uuid": "$award_uuid", "leaderboard_uuid": "$leaderboard_uuid", "account_uuid": "$account_uuid", "award_points": $award_points, "award_created_at": "$award_created_at"}';
	}
}