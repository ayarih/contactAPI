/// Modèle de données pour un Contact
class Contact {
  final int? id;
  final String name;
  final String email;
  final String phone;
  final String? company;

  Contact({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.company,
  });

  /// Créer un Contact depuis un JSON
  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      company: json['company']?['name'],
    );
  }

  /// Convertir le Contact en JSON
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'company': {'name': company ?? ''},
    };
  }

  /// Créer une copie du Contact avec des modifications
  Contact copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? company,
  }) {
    return Contact(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      company: company ?? this.company,
    );
  }
}
