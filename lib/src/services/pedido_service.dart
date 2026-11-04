import '../models/itemproducto.dart';
import '../models/pedido.dart';
import 'database_service.dart';

class PedidoService {
  final _supabase = DatabaseService.instance.client;

  Future<List<Pedido>> getPedidos() async {
    final filas = await _supabase
        .from('pedidos')
        .select('*, pedido_items(*)')
        .order('fechaEntrega', ascending: true);

    return filas.map((r) {
      final map = Map<String, dynamic>.from(r);
      map['items'] = map['pedido_items'] ?? [];
      return Pedido.fromMap(map);
    }).toList();
  }

  Map<String, dynamic> _pedidoData(Pedido p) => {
        'idCliente': p.idCliente,
        'nombreCliente': p.nombreCliente,
        'imagen': p.imagen,
        'sena': p.sena,
        'fechaEntrega': p.fechaEntrega.toUtc().toIso8601String(),
        'fechaEncargo': p.fechaEncargo.toUtc().toIso8601String(),
        'pagoRealizado': p.pagoRealizado,
      };

  List<Map<String, dynamic>> _itemsData(String idPedido, List<ItemProducto> items) =>
      items.map((i) => {...i.toMap(), 'idPedido': idPedido}).toList();

  Future<void> addPedido(Pedido pedido) async {
    final creado = await _supabase
        .from('pedidos')
        .insert(_pedidoData(pedido))
        .select('id')
        .single();

    if (pedido.items.isNotEmpty) {
      await _supabase
          .from('pedido_items')
          .insert(_itemsData(creado['id'], pedido.items));
    }
  }

  Future<void> updatePedido(Pedido pedido) async {
    await _supabase.from('pedidos').update(_pedidoData(pedido)).eq('id', pedido.id!);

    // Se reemplazan los ítems: borrar los viejos e insertar los actuales
    await _supabase.from('pedido_items').delete().eq('idPedido', pedido.id!);
    if (pedido.items.isNotEmpty) {
      await _supabase
          .from('pedido_items')
          .insert(_itemsData(pedido.id!, pedido.items));
    }
  }

  Future<void> deletePedido(String id) async {
    // pedido_items se borra solo (on delete cascade)
    await _supabase.from('pedidos').delete().eq('id', id);
  }
  
  Future<void> updatePago(Pedido pedido) async {
  await _supabase.from('pedidos').update({
    'sena': pedido.sena,
    'pagoRealizado': pedido.pagoRealizado,
  }).eq('id', pedido.id!);
}
}