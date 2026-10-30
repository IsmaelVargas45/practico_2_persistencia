import 'itemproducto.dart';

class Pedido {
  String? id;
  String idCliente;

  String nombreCliente;
  List<ItemProducto> items;
  String imagen;

  double get total => items.fold(0, (sum, item) => sum + item.subtotal);

  double sena;

  DateTime fechaEntrega;

  DateTime fechaEncargo;

  bool pagoRealizado;

  Pedido({
    this.id,
    required this.idCliente,
    required this.nombreCliente,
    required this.items,
    required this.imagen,
    required this.sena,
    required this.fechaEntrega,
    required this.fechaEncargo,
    required this.pagoRealizado,
  });

  double get diferencia => total - sena;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idCliente': idCliente,
      'nombreCliente': nombreCliente,
      'items': items.map((i) => i.toMap()).toList(),
      'imagen': imagen,
      'sena': sena,
      // Guardamos las fechas como String universal
      'fechaEntrega': fechaEntrega.toIso8601String(),
      'fechaEncargo': fechaEncargo.toIso8601String(),
      'pagoRealizado': pagoRealizado,
    };
  }

  factory Pedido.fromMap(Map<String, dynamic> map, {String? documentId}) {
    return Pedido(
      id: documentId ?? map['id'],
      idCliente: map['idCliente'] ?? '',
      nombreCliente: map['nombreCliente'] ?? '',
      items:
          (map['items'] as List?)
              ?.map((i) => ItemProducto.fromMap(Map<String, dynamic>.from(i)))
              .toList() ??
          [],
      imagen: map['imagen'] ?? '',
      sena: (map['sena'] ?? 0.0).toDouble(),
      fechaEntrega: map['fechaEntrega'] != null
          ? DateTime.parse(map['fechaEntrega'])
          : DateTime.now(),
      fechaEncargo: map['fechaEncargo'] != null
          ? DateTime.parse(map['fechaEncargo'])
          : DateTime.now(),
      pagoRealizado: map['pagoRealizado'] ?? false,
    );
  }
}
