class ItemProducto {
  String idProducto;
  String nombreProducto;
  double precioUnitario;
  int cantidad;

  ItemProducto({
    required this.idProducto,
    required this.nombreProducto,
    required this.precioUnitario,
    this.cantidad = 1,
  });

  double get subtotal => precioUnitario * cantidad;

  Map<String, dynamic> toMap() => {
    'idProducto': idProducto,
    'nombreProducto': nombreProducto,
    'precioUnitario': precioUnitario,
    'cantidad': cantidad,
  };

  factory ItemProducto.fromMap(Map<String, dynamic> map) => ItemProducto(
    idProducto: map['idProducto'] ?? '',
    nombreProducto: map['nombreProducto'] ?? '',
    precioUnitario: (map['precioUnitario'] ?? 0.0).toDouble(),
    cantidad: map['cantidad']?.toInt() ?? 1,
  );
}
