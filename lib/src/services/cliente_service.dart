import '../models/cliente.dart';
import 'database_service.dart';

class ClienteService {
  final _supabase = DatabaseService.instance.client;

  Future<List<Cliente>> getClientes() async {
    final filas = await _supabase
        .from('clientes')
        .select()
        .order('nombre', ascending: true);
    return filas.map((r) => Cliente.fromMap(r)).toList();
  }

  Future<void> addCliente(Cliente cliente) async {
    final data = cliente.toMap()..remove('id');
    await _supabase
        .from('clientes')
        .insert(data);
  }

    Future<void> updateCliente(Cliente cliente) async {
    final data = cliente.toMap()..remove('id');
    await _supabase
        .from('clientes')
        .update(data)
        .eq('id', cliente.id!);
  }

    Future<void> deleteCliente(String id) async {
    await _supabase
        .from('clientes')
        .delete()
        .eq('id', id);
  }

}
