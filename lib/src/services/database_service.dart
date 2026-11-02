import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class DatabaseService {
  DatabaseService._();

  static final DatabaseService instance = DatabaseService._();

  static bool _initialized = false;

  /// Carga el .env e inicializa Supabase. Llamar una sola vez antes de runApp.
  static Future<void> init() async {
    if (_initialized) return;

    await dotenv.load(fileName: '.env');

    final url = dotenv.env['SUPABASE_URL'];
    final anonKey = dotenv.env['SUPABASE_ANON_KEY'];
    if (url == null || url.isEmpty || anonKey == null || anonKey.isEmpty) {
      throw StateError('Faltan SUPABASE_URL o SUPABASE_ANON_KEY en el archivo .env');
    }

    await Supabase.initialize(url: url, anonKey: anonKey);
    _initialized = true;
  }

  /// Cliente de Supabase ya inicializado.
  SupabaseClient get client {
    if (!_initialized) {
      throw StateError('DatabaseService.init() no fue llamado en main()');
    }
    return Supabase.instance.client;
  }
}
