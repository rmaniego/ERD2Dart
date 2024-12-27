import 'dart:convert';

class AccountBin {
	string uuid;
	final String accountUuid;
	final String binId;
	String? status;
	final String createdAt;

	AccountBin({
		this.uuid,
		required this.accountUuid,
		required this.binId,
		this.status,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'account_uuid': accountUuid,
			'bin_id': binId,
			'status': status,
			'created_at': createdAt,
		};
	}

	factory AccountBin.fromMap(Map<String, dynamic> map) {
		return AccountBin(
			uuid: map['uuid'] ?? '',
			accountUuid: map['account_uuid'] ?? '',
			binId: map['bin_id'] ?? '',
			status: map['status'] ?? 'functional',
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory AccountBin.fromJson(String source) => AccountBin.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "account_uuid": "$accountUuid", "bin_id": "$binId", "status": "$status", "created_at": "$createdAt"}';
	}
}