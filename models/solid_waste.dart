import 'dart:convert';

class SolidWaste {
	int? solid_waste_id;
	final String account_id;
	final String solid_waste_origin;
	final String solid_waste_composition;
	final String solid_waste_material;
	String? solid_waste_is_soft_deleted;
	final String solid_waste_created_at;
	String? solid_waste_modified_at;

	SolidWaste({
		this.solid_waste_id,
		required this.account_id,
		required this.solid_waste_origin,
		required this.solid_waste_composition,
		required this.solid_waste_material,
		this.solid_waste_is_soft_deleted,
		required this.solid_waste_created_at,
		this.solid_waste_modified_at,
	});

	Map<String, dynamic> toMap() {
		return {
			'solid_waste_id': solid_waste_id,
			'account_id': account_id,
			'solid_waste_origin': solid_waste_origin,
			'solid_waste_composition': solid_waste_composition,
			'solid_waste_material': solid_waste_material,
			'solid_waste_is_soft_deleted': solid_waste_is_soft_deleted,
			'solid_waste_created_at': solid_waste_created_at,
			'solid_waste_modified_at': solid_waste_modified_at,
		};
	}

	factory SolidWaste.fromMap(Map<String, dynamic> map) {
		return SolidWaste(
			solid_waste_id: map['solid_waste_id']?.toInt() ?? 0,
			account_id: map['account_id'] ?? '',
			solid_waste_origin: map['solid_waste_origin'] ?? 'residential',
			solid_waste_composition: map['solid_waste_composition'] ?? 'non-biodegradable',
			solid_waste_material: map['solid_waste_material'] ?? 'plastic',
			solid_waste_is_soft_deleted: map['solid_waste_is_soft_deleted'] ?? '',
			solid_waste_created_at: map['solid_waste_created_at'] ?? '',
			solid_waste_modified_at: map['solid_waste_modified_at'] ?? '',
		);
	}

	String toJson() => json.encode(toMap());

	factory SolidWaste.fromJson(String source) => SolidWaste.fromMap(json.decode(source));
	
	@override
	String toString() {
		return '{"solid_waste_id": $solid_waste_id, "account_id": "$account_id", "solid_waste_origin": "$solid_waste_origin", "solid_waste_composition": "$solid_waste_composition", "solid_waste_material": "$solid_waste_material", "solid_waste_is_soft_deleted": "$solid_waste_is_soft_deleted", "solid_waste_created_at": "$solid_waste_created_at", "solid_waste_modified_at": "$solid_waste_modified_at"}';
	}
}