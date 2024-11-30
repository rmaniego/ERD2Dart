import 'dart:convert';

class Leaderboard {
	int? leaderboard_id;
	final String leaderboard_type;
	final int leaderboard_year;
	final int leaderboard_week_number;
	final String leaderboard_created_at;

	Leaderboard({
		this.leaderboard_id,
		required this.leaderboard_type,
		required this.leaderboard_year,
		required this.leaderboard_week_number,
		required this.leaderboard_created_at,
	});

	Map<String, dynamic> toMap() {
		return {
			'leaderboard_id': leaderboard_id,
			'leaderboard_type': leaderboard_type,
			'leaderboard_year': leaderboard_year,
			'leaderboard_week_number': leaderboard_week_number,
			'leaderboard_created_at': leaderboard_created_at,
		};
	}

	factory Leaderboard.fromMap(Map<String, dynamic> map) {
		return Leaderboard(
			leaderboard_id: map['leaderboard_id']?.toInt() ?? 0,
			leaderboard_type: map['leaderboard_type'] ?? 'navigators',
			leaderboard_year: map['leaderboard_year']?.toInt() ?? 0,
			leaderboard_week_number: map['leaderboard_week_number']?.toInt() ?? 0,
			leaderboard_created_at: map['leaderboard_created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Leaderboard.fromJson(String source) => Leaderboard.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"leaderboard_id": $leaderboard_id, "leaderboard_type": "$leaderboard_type", "leaderboard_year": $leaderboard_year, "leaderboard_week_number": $leaderboard_week_number, "leaderboard_created_at": "$leaderboard_created_at"}';
	}
}