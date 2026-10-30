import 'package:flutter/material.dart';

import '../components/modulo_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Panel de Control'), elevation: 0),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hola, Bienvenido!!!',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '¿Qué deseas gestionar hoy?',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1,
                children: [
                  ModuloCard(
                    titulo: 'Pedidos',
                    icono: Icons.shopping_bag_outlined,
                    color: Colors.orange,
                    onTap: () => Navigator.pushNamed(context, '/pedidos'),
                  ),
                  ModuloCard(
                    titulo: 'Productos',
                    icono: Icons.inventory_2_outlined,
                    color: Colors.blue,
                    onTap: () => Navigator.pushNamed(context, '/productos'),
                  ),
                  ModuloCard(
                    titulo: 'Clientes',
                    icono: Icons.people_alt_outlined,
                    color: Colors.green,
                    onTap: () => Navigator.pushNamed(context, '/clientes'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
