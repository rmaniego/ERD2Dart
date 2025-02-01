import 'dart:convert';

class Setting {
	final String uuid;
	final String deviceUuid;
	int? keepScreenOn;
	int? useLargeTexts;
	String? deviceCutoff;
	String? binCutoff;
	String? deviceBinCutoff;
	String? streetMapCutoff;
	String? edgeCutoff;
	String? disposalCutoff;
	String? landmarkCutoff;
	String? settingCutoff;
	final String createdAt;

	Setting({
		required this.uuid,
		required this.deviceUuid,
		this.keepScreenOn,
		this.useLargeTexts,
		this.deviceCutoff,
		this.binCutoff,
		this.deviceBinCutoff,
		this.streetMapCutoff,
		this.edgeCutoff,
		this.disposalCutoff,
		this.landmarkCutoff,
		this.settingCutoff,
		required this.createdAt,
	});

	Map<String, dynamic> toMap() {
		return {
			'uuid': uuid,
			'device_uuid': deviceUuid,
			'keep_screen_on': keepScreenOn,
			'use_large_texts': useLargeTexts,
			'device_cutoff': deviceCutoff,
			'bin_cutoff': binCutoff,
			'device_bin_cutoff': deviceBinCutoff,
			'street_map_cutoff': streetMapCutoff,
			'edge_cutoff': edgeCutoff,
			'disposal_cutoff': disposalCutoff,
			'landmark_cutoff': landmarkCutoff,
			'setting_cutoff': settingCutoff,
			'created_at': createdAt,
		};
	}

	factory Setting.fromMap(Map<String, dynamic> map) {
		return Setting(
			uuid: map['uuid'] ?? '',
			deviceUuid: map['device_uuid'] ?? '',
			keepScreenOn: map['keep_screen_on']?.toInt() ?? 0,
			useLargeTexts: map['use_large_texts']?.toInt() ?? 0,
			deviceCutoff: map['device_cutoff'] ?? '',
			binCutoff: map['bin_cutoff'] ?? '',
			deviceBinCutoff: map['device_bin_cutoff'] ?? '',
			streetMapCutoff: map['street_map_cutoff'] ?? '',
			edgeCutoff: map['edge_cutoff'] ?? '',
			disposalCutoff: map['disposal_cutoff'] ?? '',
			landmarkCutoff: map['landmark_cutoff'] ?? '',
			settingCutoff: map['setting_cutoff'] ?? '',
			createdAt: map['created_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory Setting.fromJson(String source) => Setting.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"uuid": "$uuid", "device_uuid": "$deviceUuid", "keep_screen_on": $keepScreenOn, "use_large_texts": $useLargeTexts, "device_cutoff": "$deviceCutoff", "bin_cutoff": "$binCutoff", "device_bin_cutoff": "$deviceBinCutoff", "street_map_cutoff": "$streetMapCutoff", "edge_cutoff": "$edgeCutoff", "disposal_cutoff": "$disposalCutoff", "landmark_cutoff": "$landmarkCutoff", "setting_cutoff": "$settingCutoff", "created_at": "$createdAt"}';
	}
}