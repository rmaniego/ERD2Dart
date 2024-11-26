import 'dart:convert';

class Activity {
	int? activity_id;
	final String account_id;
	int? activity_is_soft_deleted;
	final String activity_created_at;
	String? activity_modified_at;

	Activity({
		this.activity_id,
		required this.account_id,
		this.activity_is_soft_deleted,
		required this.activity_created_at,
		this.activity_modified_at,
	});

	Map<String, dynamic> toMap() {
		return {
			'activity_id': activity_id,
			'account_id': account_id,
			'activity_is_soft_deleted': activity_is_soft_deleted,
			'activity_created_at': activity_created_at,
			'activity_modified_at': activity_modified_at,
		};
	}

	factory Activity.fromMap(Map<String, dynamic> map) {
		return Activity(
			activity_id: map['activity_id']?.toInt() ?? 0,
			account_id: map['account_id'] ?? '',
			activity_is_soft_deleted: map['activity_is_soft_deleted']?.toInt() ?? 0,
			activity_created_at: map['activity_created_at'] ?? '',
			activity_modified_at: map['activity_modified_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Activity.fromJson(String source) => Activity.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"activity_id": $activity_id, "account_id": "$account_id", "activity_is_soft_deleted": $activity_is_soft_deleted, "activity_created_at": "$activity_created_at", "activity_modified_at": "$activity_modified_at"}';
	}
}