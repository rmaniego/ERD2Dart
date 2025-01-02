import 'dart:convert';

class Device {
	final String uuid;
	String? apiId;
	String? apiName;
	String? apiEmail;
	String? apiPhotoUrl;
	int? isPublic;
	int? isResticted;
	int isSynchronized;
	final String createdAt;

	Device({
		required this.uuid,
		this.apiId,
		this.apiName,
		this.apiEmail,
		this.apiPhotoUrl,
		this.isPublic,
		this.isResticted,
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
			'is_public': isPublic,
			'is_resticted': isResticted,
			'is_synchronized': isSynchronized,
			'created_at': createdAt,
		};
	}

	factory Device.fromMap(Map<String, dynamic> map) {
		return Device(
			uuid: map['uuid'] ?? '',
			apiId: map['api_id'] ?? '',
			apiName: map['api_name'] ?? '',
			apiEmail: map['api_email'] ?? '',
			apiPhotoUrl: map['api_photo_url'] ?? '',
			isPublic: map['is_public']?.toInt() ?? 0,
			isResticted: map['is_resticted']?.toInt() ?? 0,
			isSynchronized: map['is_synchronized']?.toInt() ?? 0,
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Device.fromJson(String source) => Device.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "api_id": "$apiId", "api_name": "$apiName", "api_email": "$apiEmail", "api_photo_url": "$apiPhotoUrl", "is_public": $isPublic, "is_resticted": $isResticted, "is_synchronized": $isSynchronized, "created_at": "$createdAt"}';
	}
}