import 'dart:convert';

class Account {
	final String uuid;
	String? apiId;
	String? apiName;
	String? apiEmail;
	String? apiPhotoUrl;
	int isSynchronized;
	final String createdAt;

	Account({
		required this.uuid,
		this.apiId,
		this.apiName,
		this.apiEmail,
		this.apiPhotoUrl,
		required this.isSynchronized,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'api_id': apiId,
			'api_name': apiName,
			'api_email': apiEmail,
			'api_photo_url': apiPhotoUrl,
			'is_synchronized': isSynchronized,
			'created_at': createdAt,
		};
	}

	factory Account.fromMap(Map<String, dynamic> map) {
		return Account(
			uuid: map['uuid'] ?? '',
			apiId: map['api_id'] ?? '',
			apiName: map['api_name'] ?? '',
			apiEmail: map['api_email'] ?? '',
			apiPhotoUrl: map['api_photo_url'] ?? '',
			isSynchronized: map['is_synchronized']?.toInt() ?? 0,
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Account.fromJson(String source) => Account.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "api_id": "$apiId", "api_name": "$apiName", "api_email": "$apiEmail", "api_photo_url": "$apiPhotoUrl", "is_synchronized": $isSynchronized, "created_at": "$createdAt"}';
	}
}