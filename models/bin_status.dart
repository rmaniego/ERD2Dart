import 'dart:convert';

class BinStatus {
	int? id;
	final String bin_status_uuid;
	final String account_uuid;
	final String bin_uuid;
	final int bin_for_replacement;
	int? bin_status_is_soft_deleted;
	final String bin_status_created_at;
	String? bin_status_modified_at;

	BinStatus({
		this.id,
		required this.bin_status_uuid,
		required this.account_uuid,
		required this.bin_uuid,
		required this.bin_for_replacement,
		this.bin_status_is_soft_deleted,
		required this.bin_status_created_at,
		this.bin_status_modified_at,
	});

	Map<String, dynamic> toMap() {
		return {
			'id': id,
			'bin_status_uuid': bin_status_uuid,
			'account_uuid': account_uuid,
			'bin_uuid': bin_uuid,
			'bin_for_replacement': bin_for_replacement,
			'bin_status_is_soft_deleted': bin_status_is_soft_deleted,
			'bin_status_created_at': bin_status_created_at,
			'bin_status_modified_at': bin_status_modified_at,
		};
	}

	factory BinStatus.fromMap(Map<String, dynamic> map) {
		return BinStatus(
			id: map['id']?.toInt() ?? 0,
			bin_status_uuid: map['bin_status_uuid'] ?? '',
			account_uuid: map['account_uuid'] ?? '',
			bin_uuid: map['bin_uuid'] ?? '',
			bin_for_replacement: map['bin_for_replacement']?.toInt() ?? 1,
			bin_status_is_soft_deleted: map['bin_status_is_soft_deleted']?.toInt() ?? 0,
			bin_status_created_at: map['bin_status_created_at'] ?? '',
			bin_status_modified_at: map['bin_status_modified_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory BinStatus.fromJson(String source) => BinStatus.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"id": $id, "bin_status_uuid": "$bin_status_uuid", "account_uuid": "$account_uuid", "bin_uuid": "$bin_uuid", "bin_for_replacement": $bin_for_replacement, "bin_status_is_soft_deleted": $bin_status_is_soft_deleted, "bin_status_created_at": "$bin_status_created_at", "bin_status_modified_at": "$bin_status_modified_at"}';
	}
}