import 'dart:convert';

class Setting {
	final String uuid;
	final int deviceUuid;
	int? keepScreenOn;
	String? deviceLastSynchronizedAt;
	String? binLastSynchronizedAt;
	String? deviceBinLastSynchronizedAt;
	String? mapLastSynchronizedAt;
	String? edgeLastSynchronizedAt;
	String? disposalLastSynchronizedAt;
	String? trackLastSynchronizedAt;
	String? settingLastSynchronizedAt;
	final String createdAt;

	Setting({
		required this.uuid,
		required this.deviceUuid,
		this.keepScreenOn,
		this.deviceLastSynchronizedAt,
		this.binLastSynchronizedAt,
		this.deviceBinLastSynchronizedAt,
		this.mapLastSynchronizedAt,
		this.edgeLastSynchronizedAt,
		this.disposalLastSynchronizedAt,
		this.trackLastSynchronizedAt,
		this.settingLastSynchronizedAt,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'device_uuid': deviceUuid,
			'keep_screen_on': keepScreenOn,
			'device_last_synchronized_at': deviceLastSynchronizedAt,
			'bin_last_synchronized_at': binLastSynchronizedAt,
			'device_bin_last_synchronized_at': deviceBinLastSynchronizedAt,
			'map_last_synchronized_at': mapLastSynchronizedAt,
			'edge_last_synchronized_at': edgeLastSynchronizedAt,
			'disposal_last_synchronized_at': disposalLastSynchronizedAt,
			'track_last_synchronized_at': trackLastSynchronizedAt,
			'setting_last_synchronized_at': settingLastSynchronizedAt,
			'created_at': createdAt,
		};
	}

	factory Setting.fromMap(Map<String, dynamic> map) {
		return Setting(
			uuid: map['uuid'] ?? '',
			deviceUuid: map['device_uuid']?.toInt() ?? 0,
			keepScreenOn: map['keep_screen_on']?.toInt() ?? 0,
			deviceLastSynchronizedAt: map['device_last_synchronized_at'] ?? '',
			binLastSynchronizedAt: map['bin_last_synchronized_at'] ?? '',
			deviceBinLastSynchronizedAt: map['device_bin_last_synchronized_at'] ?? '',
			mapLastSynchronizedAt: map['map_last_synchronized_at'] ?? '',
			edgeLastSynchronizedAt: map['edge_last_synchronized_at'] ?? '',
			disposalLastSynchronizedAt: map['disposal_last_synchronized_at'] ?? '',
			trackLastSynchronizedAt: map['track_last_synchronized_at'] ?? '',
			settingLastSynchronizedAt: map['setting_last_synchronized_at'] ?? '',
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Setting.fromJson(String source) => Setting.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "device_uuid": $deviceUuid, "keep_screen_on": $keepScreenOn, "device_last_synchronized_at": "$deviceLastSynchronizedAt", "bin_last_synchronized_at": "$binLastSynchronizedAt", "device_bin_last_synchronized_at": "$deviceBinLastSynchronizedAt", "map_last_synchronized_at": "$mapLastSynchronizedAt", "edge_last_synchronized_at": "$edgeLastSynchronizedAt", "disposal_last_synchronized_at": "$disposalLastSynchronizedAt", "track_last_synchronized_at": "$trackLastSynchronizedAt", "setting_last_synchronized_at": "$settingLastSynchronizedAt", "created_at": "$createdAt"}';
	}
}