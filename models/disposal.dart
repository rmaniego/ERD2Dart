import 'dart:convert';

class Disposal {
	final String uuid;
	final String accountUuid;
	final String binUuid;
	String? status;
	int? isDeleted;
	int isSynchronized;
	final String createdAt;

	Disposal({
		required this.uuid,
		required this.accountUuid,
		required this.binUuid,
		this.status,
		this.isDeleted,
		required this.isSynchronized,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'account_uuid': accountUuid,
			'bin_uuid': binUuid,
			'status': status,
			'is_deleted': isDeleted,
			'is_synchronized': isSynchronized,
			'created_at': createdAt,
		};
	}

	factory Disposal.fromMap(Map<String, dynamic> map) {
		return Disposal(
			uuid: map['uuid'] ?? '',
			accountUuid: map['account_uuid'] ?? '',
			binUuid: map['bin_uuid'] ?? '',
			status: map['status'] ?? 'started',
			isDeleted: map['is_deleted']?.toInt() ?? 0,
			isSynchronized: map['is_synchronized']?.toInt() ?? 0,
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Disposal.fromJson(String source) => Disposal.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "account_uuid": "$accountUuid", "bin_uuid": "$binUuid", "status": "$status", "is_deleted": $isDeleted, "is_synchronized": $isSynchronized, "created_at": "$createdAt"}';
	}
}