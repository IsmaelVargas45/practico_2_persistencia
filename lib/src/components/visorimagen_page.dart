import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

class VisorImagen extends StatelessWidget {
  final String imagen;

  const VisorImagen({super.key, required this.imagen});

  @override
  Widget build(BuildContext context) {
    if (imagen.isEmpty) {
      return const Icon(
        Icons.image_not_supported,
        size: 50,
        color: Colors.grey,
      );
    }

    // 1. Ruta local
    if (imagen.startsWith('/') && imagen.length < 500) {
      final archivo = File(imagen);
      if (archivo.existsSync()) {
        return Image.file(archivo, fit: BoxFit.cover, width: double.infinity);
      } else {
        return const Icon(Icons.broken_image, size: 50, color: Colors.grey);
      }
    }

    // 2. URL
    if (imagen.startsWith('http')) {
      return Image.network(imagen, fit: BoxFit.cover, width: double.infinity);
    }

    // 3.Emoji de prueba
    if (imagen.length <= 10) {
      return Center(child: Text(imagen, style: const TextStyle(fontSize: 60)));
    }

    // 4. Cadena Base64
    try {
      final bytesDecodificados = base64Decode(imagen);
      return Image.memory(
        bytesDecodificados,
        fit: BoxFit.cover,
        width: double.infinity,
      );
    } catch (e) {
      // Si el Base64 está corrupto
      return const Icon(Icons.error_outline, size: 50, color: Colors.red);
    }
  }
}
