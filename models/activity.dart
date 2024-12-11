import 'dart:convert';

class Activity {
	int? id;
	final String activity_uuid;
	final String account_uuid;
	final String activity_created_at;
	String? activity_modified_at;

	Activity({
		this.id,
		required this.activity_uuid,
		required this.account_uuid,
		required this.activity_created_at,
		this.activity_modified_at,
	});

	Map<String, dynamic> toMap() {
		return {
			'id': id,
			'activity_uuid': activity_uuid,
			'account_uuid': account_uuid,
			'activity_created_at': activity_created_at,
			'activity_modified_at': activity_modified_at,
		};
	}

	factory Activity.fromMap(Map<String, dynamic> map) {
		return Activity(
			id: map['id']?.toInt() ?? 0,
			activity_uuid: map['activity_uuid'] ?? '',
			account_uuid: map['account_uuid'] ?? '',
			activity_created_at: map['activity_created_at'] ?? '',
			activity_modified_at: map['activity_modified_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Activity.fromJson(String source) => Activity.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"id": $id, "activity_uuid": "$activity_uuid", "account_uuid": "$account_uuid", "activity_created_at": "$activity_created_at", "activity_modified_at": "$activity_modified_at"}';
	}
}