import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Carga las credenciales desde el archivo .env
  await dotenv.load(fileName: '.env');

  // Inicializa la conexión con Supabase
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(DimeelprecioApp());
}

// Acceso global al cliente de Supabase: supabase.from('clientes').select()
final supabase = Supabase.instance.client;
