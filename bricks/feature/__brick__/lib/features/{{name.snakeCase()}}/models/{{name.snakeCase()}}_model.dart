class {{name.pascalCase()}} {
  {{name.pascalCase()}}(
    {
      required this.id,
      required this.updatedAt,
      required this.createdAt,
    }
  );

  final String id;
  final String updatedAt;
  final String createdAt;

  factory {{name.pascalCase()}}.fromMap(Map<String, dynamic> map) {
    return {{name.pascalCase()}}(
      id: map['id'] as String,
      updatedAt: map['updated_at'] as String,
      createdAt: map['created_at'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'updated_at': updatedAt,
      'created_at': createdAt,
    };
  }
}
