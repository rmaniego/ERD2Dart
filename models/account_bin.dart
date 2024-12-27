import 'dart:convert';

class AccountBin {
	final String uuid;
	final String accountUuid;
	final String binUuid;
	String? status;
	final String createdAt;

	AccountBin({
		required this.uuid,
		required this.accountUuid,
		required this.binUuid,
		this.status,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'account_uuid': accountUuid,
			'bin_uuid': binUuid,
			'status': status,
			'created_at': createdAt,
		};
	}

	factory AccountBin.fromMap(Map<String, dynamic> map) {
		return AccountBin(
			uuid: map['uuid'] ?? '',
			accountUuid: map['account_uuid'] ?? '',
			binUuid: map['bin_uuid'] ?? '',
			status: map['status'] ?? 'functional',
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory AccountBin.fromJson(String source) => AccountBin.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "account_uuid": "$accountUuid", "bin_uuid": "$binUuid", "status": "$status", "created_at": "$createdAt"}';
	}
}