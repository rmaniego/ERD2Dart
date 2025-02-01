import 'dart:convert';

class Leaderboard {
	final String uuid;
	String? category;
	final int year;
	final int weekday;
	final String createdAt;

	Leaderboard({
		required this.uuid,
		this.category,
		required this.year,
		required this.weekday,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'category': category,
			'year': year,
			'weekday': weekday,
			'created_at': createdAt,
		};
	}

	factory Leaderboard.fromMap(Map<String, dynamic> map) {
		return Leaderboard(
			uuid: map['uuid'] ?? '',
			category: map['category'] ?? 'navigators',
			year: map['year']?.toInt() ?? 0,
			weekday: map['weekday']?.toInt() ?? 0,
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Leaderboard.fromJson(String source) => Leaderboard.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "category": "$category", "year": $year, "weekday": $weekday, "created_at": "$createdAt"}';
	}
}