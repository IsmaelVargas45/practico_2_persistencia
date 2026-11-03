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
}