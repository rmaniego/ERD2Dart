import 'dart:convert';

class Leaderboard {
	int? uuid;
	String? category;
	final int year;
	final int week;
	final String createdAt;

	Leaderboard({
		this.uuid,
		this.category,
		required this.year,
		required this.week,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'category': category,
			'year': year,
			'week': week,
			'created_at': createdAt,
		};
	}

	factory Leaderboard.fromMap(Map<String, dynamic> map) {
		return Leaderboard(
			uuid: map['uuid'] ?? '',
			category: map['category'] ?? 'navigators',
			year: map['year']?.toInt() ?? 0,
			week: map['week']?.toInt() ?? 0,
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Leaderboard.fromJson(String source) => Leaderboard.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "category": "$category", "year": $year, "week": $week, "created_at": "$createdAt"}';
	}
}