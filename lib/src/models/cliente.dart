class Cliente {
  String? id;
  String nombre;
  String telefono;

  Cliente({this.id, required this.nombre, required this.telefono});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nombre': nombre, 'telefono': telefono};
  }

  factory Cliente.fromMap(Map<String, dynamic> map, {String? documentId}) {
    return Cliente(
      id: documentId ?? map['id'],
      nombre: map['nombre'] ?? '',
      telefono: map['telefono'] ?? '',
    );
  }
}
