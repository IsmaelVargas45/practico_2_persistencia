class Producto {
  String? id;
  String nombre;
  double precio;
  String imagen;

  Producto({
    this.id,
    required this.nombre,
    required this.precio,
    required this.imagen,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'nombre': nombre, 'precio': precio, 'imagen': imagen};
  }

  factory Producto.fromMap(Map<String, dynamic> map, {String? documentId}) {
    return Producto(
      id: documentId ?? map['id'],
      nombre: map['nombre'] ?? '',
      precio: (map['precio'] ?? 0.0).toDouble(),
      imagen: map['imagen'] ?? '',
    );
  }
}
