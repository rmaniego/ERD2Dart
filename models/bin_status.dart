import 'dart:convert';

class BinStatus {
	int? bin_status_id;
	final String account_id;
	final String bin_id;
	final String bin_status_level;
	String? bin_status_image_url;
	int? bin_status_is_soft_deleted;
	final String bin_status_created_at;
	String? bin_status_modified_at;

	BinStatus({
		this.bin_status_id,
		required this.account_id,
		required this.bin_id,
		required this.bin_status_level,
		this.bin_status_image_url,
		this.bin_status_is_soft_deleted,
		required this.bin_status_created_at,
		this.bin_status_modified_at,
	});

	Map<String, dynamic> toMap() {
		return {
			'bin_status_id': bin_status_id,
			'account_id': account_id,
			'bin_id': bin_id,
			'bin_status_level': bin_status_level,
			'bin_status_image_url': bin_status_image_url,
			'bin_status_is_soft_deleted': bin_status_is_soft_deleted,
			'bin_status_created_at': bin_status_created_at,
			'bin_status_modified_at': bin_status_modified_at,
		};
	}

	factory BinStatus.fromMap(Map<String, dynamic> map) {
		return BinStatus(
			bin_status_id: map['bin_status_id']?.toInt() ?? 0,
			account_id: map['account_id'] ?? '',
			bin_id: map['bin_id'] ?? '',
			bin_status_level: map['bin_status_level'] ?? 'fully functional',
			bin_status_image_url: map['bin_status_image_url'] ?? '',
			bin_status_is_soft_deleted: map['bin_status_is_soft_deleted']?.toInt() ?? 0,
			bin_status_created_at: map['bin_status_created_at'] ?? '',
			bin_status_modified_at: map['bin_status_modified_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory BinStatus.fromJson(String source) => BinStatus.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"bin_status_id": $bin_status_id, "account_id": "$account_id", "bin_id": "$bin_id", "bin_status_level": "$bin_status_level", "bin_status_image_url": "$bin_status_image_url", "bin_status_is_soft_deleted": $bin_status_is_soft_deleted, "bin_status_created_at": "$bin_status_created_at", "bin_status_modified_at": "$bin_status_modified_at"}';
	}
}