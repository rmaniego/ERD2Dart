import 'dart:convert';

class Setting {
	final String uuid;
	final String deviceUuid;
	int? keepScreenOn;
	String? deviceCutoffMillis;
	String? binCutoffMillis;
	String? deviceBinCutoffMillis;
	String? streetMapCutoffMillis;
	String? edgeCutoffMillis;
	String? disposalCutoffMillis;
	String? landmarkCutoffMillis;
	String? settingCutoffMillis;
	final String createdAt;

	Setting({
		required this.uuid,
		required this.deviceUuid,
		this.keepScreenOn,
		this.deviceCutoffMillis,
		this.binCutoffMillis,
		this.deviceBinCutoffMillis,
		this.streetMapCutoffMillis,
		this.edgeCutoffMillis,
		this.disposalCutoffMillis,
		this.landmarkCutoffMillis,
		this.settingCutoffMillis,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'device_uuid': deviceUuid,
			'keep_screen_on': keepScreenOn,
			'device_cutoff_millis': deviceCutoffMillis,
			'bin_cutoff_millis': binCutoffMillis,
			'device_bin_cutoff_millis': deviceBinCutoffMillis,
			'street_map_cutoff_millis': streetMapCutoffMillis,
			'edge_cutoff_millis': edgeCutoffMillis,
			'disposal_cutoff_millis': disposalCutoffMillis,
			'landmark_cutoff_millis': landmarkCutoffMillis,
			'setting_cutoff_millis': settingCutoffMillis,
			'created_at': createdAt,
		};
	}

	factory Setting.fromMap(Map<String, dynamic> map) {
		return Setting(
			uuid: map['uuid'] ?? '',
			deviceUuid: map['device_uuid'] ?? '',
			keepScreenOn: map['keep_screen_on']?.toInt() ?? 0,
			deviceCutoffMillis: map['device_cutoff_millis'] ?? '',
			binCutoffMillis: map['bin_cutoff_millis'] ?? '',
			deviceBinCutoffMillis: map['device_bin_cutoff_millis'] ?? '',
			streetMapCutoffMillis: map['street_map_cutoff_millis'] ?? '',
			edgeCutoffMillis: map['edge_cutoff_millis'] ?? '',
			disposalCutoffMillis: map['disposal_cutoff_millis'] ?? '',
			landmarkCutoffMillis: map['landmark_cutoff_millis'] ?? '',
			settingCutoffMillis: map['setting_cutoff_millis'] ?? '',
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Setting.fromJson(String source) => Setting.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "device_uuid": "$deviceUuid", "keep_screen_on": $keepScreenOn, "device_cutoff_millis": "$deviceCutoffMillis", "bin_cutoff_millis": "$binCutoffMillis", "device_bin_cutoff_millis": "$deviceBinCutoffMillis", "street_map_cutoff_millis": "$streetMapCutoffMillis", "edge_cutoff_millis": "$edgeCutoffMillis", "disposal_cutoff_millis": "$disposalCutoffMillis", "landmark_cutoff_millis": "$landmarkCutoffMillis", "setting_cutoff_millis": "$settingCutoffMillis", "created_at": "$createdAt"}';
	}
}