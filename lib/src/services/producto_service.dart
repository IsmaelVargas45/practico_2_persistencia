import '../models/producto.dart';
import 'database_service.dart';

class ProductoService {
  final _supabase = DatabaseService.instance.client;

  Future<List<Producto>> getProductos() async {
    final filas = await _supabase
        .from('productos')
        .select()
        .order('nombre', ascending: true);
    return filas.map((r) => Producto.fromMap(r)).toList();
  }

  Future<void> addProducto(Producto producto) async {
    final data = producto.toMap()..remove('id');
    await _supabase
        .from('productos')
        .insert(data);
  }

  Future<void> updateProducto(Producto producto) async {
    final data = producto.toMap()..remove('id');
    await _supabase
        .from('productos')
        .update(data)
        .eq('id', producto.id!);
  }

  Future<void> deleteProducto(String id) async {
    await _supabase
        .from('productos')
        .delete()
        .eq('id', id);
  }
}
