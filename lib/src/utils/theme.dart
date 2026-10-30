import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryColor = Color(0xFF539091);

  static const double _globalRadius = 12.0;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      // Generación automática de la paleta de colores
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        primary: _primaryColor, // Forzamos tu color exacto como primario
        brightness: Brightness.light,
      ),

      // 1. Estilo global del AppBar (Barra superior)
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white, // Color del texto y flechas de retroceso
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
        ),
      ),

      // 2. Estilo global de las Tarjetas (ideal para la lista de Pedidos y Productos)
      cardTheme: CardThemeData(
        elevation: 2,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_globalRadius),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),

      // 3. Estilo global de los Campos de Texto (Inputs)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        // Borde por defecto
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_globalRadius),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        // Borde cuando el campo está habilitado pero no seleccionado
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_globalRadius),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        // Borde cuando el usuario está escribiendo
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_globalRadius),
          borderSide: const BorderSide(color: _primaryColor, width: 2),
        ),
        // Borde para errores (validaciones)
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_globalRadius),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),

      // 4. Estilo global de los Botones Principales (ElevatedButton)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_globalRadius),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),

      // 5. Estilo de los Botones Secundarios (OutlinedButton)
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_globalRadius),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      // 6. Estilo global de los Modales (BottomSheet de Agregar Productos)
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          // Radio doble en la parte superior para que se note que es un modal deslizable
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(_globalRadius * 2),
          ),
        ),
      ),

      // 7. Estilo global de los Snackbars (Errores y Éxitos)
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior
            .floating, // Hace que floten separándose del borde inferior
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_globalRadius),
        ),
      ),
    );
  }
}
