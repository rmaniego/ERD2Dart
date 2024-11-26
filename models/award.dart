import 'dart:convert';

class Award {
	int? award_id;
	final String leaderboard_id;
	final String account_id;
	final int award_points;
	final String award_created_at;

	Award({
		this.award_id,
		required this.leaderboard_id,
		required this.account_id,
		required this.award_points,
		required this.award_created_at,
	});

	Map<String, dynamic> toMap() {
		return {
			'award_id': award_id,
			'leaderboard_id': leaderboard_id,
			'account_id': account_id,
			'award_points': award_points,
			'award_created_at': award_created_at,
		};
	}

	factory Award.fromMap(Map<String, dynamic> map) {
		return Award(
			award_id: map['award_id']?.toInt() ?? 0,
			leaderboard_id: map['leaderboard_id'] ?? '',
			account_id: map['account_id'] ?? '',
			award_points: map['award_points']?.toInt() ?? 0,
			award_created_at: map['award_created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Award.fromJson(String source) => Award.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"award_id": $award_id, "leaderboard_id": "$leaderboard_id", "account_id": "$account_id", "award_points": $award_points, "award_created_at": "$award_created_at"}';
	}
}