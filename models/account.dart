import 'dart:convert';

class Account {
	int? id;
	final String account_uuid;
	final String account_api;
	final String account_api_uuid;
	String account_api_name;
	String account_api_email;
	String? account_api_photo_url;
	String? account_is_soft_deleted;
	final String account_created_at;
	String? account_modified_at;

	Account({
		this.id,
		required this.account_uuid,
		required this.account_api,
		required this.account_api_uuid,
		required this.account_api_name,
		required this.account_api_email,
		this.account_api_photo_url,
		this.account_is_soft_deleted,
		required this.account_created_at,
		this.account_modified_at,
	});

	Map<String, dynamic> toMap() {
		return {
			'id': id,
			'account_uuid': account_uuid,
			'account_api': account_api,
			'account_api_uuid': account_api_uuid,
			'account_api_name': account_api_name,
			'account_api_email': account_api_email,
			'account_api_photo_url': account_api_photo_url,
			'account_is_soft_deleted': account_is_soft_deleted,
			'account_created_at': account_created_at,
			'account_modified_at': account_modified_at,
		};
	}

	factory Account.fromMap(Map<String, dynamic> map) {
		return Account(
			id: map['id']?.toInt() ?? 0,
			account_uuid: map['account_uuid'] ?? '',
			account_api: map['account_api'] ?? '',
			account_api_uuid: map['account_api_uuid'] ?? '',
			account_api_name: map['account_api_name'] ?? '',
			account_api_email: map['account_api_email'] ?? '',
			account_api_photo_url: map['account_api_photo_url'] ?? '',
			account_is_soft_deleted: map['account_is_soft_deleted'] ?? 0,
			account_created_at: map['account_created_at'] ?? '',
			account_modified_at: map['account_modified_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Account.fromJson(String source) => Account.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"id": $id, "account_uuid": "$account_uuid", "account_api": "$account_api", "account_api_uuid": "$account_api_uuid", "account_api_name": "$account_api_name", "account_api_email": "$account_api_email", "account_api_photo_url": "$account_api_photo_url", "account_is_soft_deleted": "$account_is_soft_deleted", "account_created_at": "$account_created_at", "account_modified_at": "$account_modified_at"}';
	}
}