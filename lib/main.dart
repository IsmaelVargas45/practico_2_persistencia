import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/services/database_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Carga el .env e inicializa la conexión con Supabase
  await DatabaseService.init();

  runApp(DimeelprecioApp());
}
