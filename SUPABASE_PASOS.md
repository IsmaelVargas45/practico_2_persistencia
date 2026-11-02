# Conectar el proyecto a Supabase (paso a paso)

## 1. Crear el proyecto en Supabase
1. Entrá a https://supabase.com/dashboard y hacé **New project**.
2. Poné un nombre (ej. `practico-2`), una contraseña para la base y elegí la región más cercana (São Paulo).
3. Esperá un par de minutos a que termine de crearse.

## 2. Crear las tablas
1. En el menú izquierdo andá a **SQL Editor** → **New query**.
2. Pegá todo el contenido de `supabase/schema.sql` y apretá **Run**.
3. En **Table Editor** tenés que ver `clientes`, `productos` y `pedidos`.

Las columnas tienen los mismos nombres que usan tus modelos (`idCliente`, `fechaEntrega`, etc.), y `items` del pedido se guarda como JSON.

## 3. Copiar las credenciales al .env
1. Andá a **Project Settings** → **API** (o el botón **Connect**).
2. Copiá **Project URL** y la clave **anon public**.
3. Pegalas en el archivo `.env` de la raíz del proyecto:

```
SUPABASE_URL=https://xxxxxxxx.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOi...
```

Nunca uses la `service_role` key en la app.

## 4. Instalar dependencias y probar
```
flutter pub get
flutter run
```
Si la app arranca sin error, la conexión está hecha. En cualquier parte del código podés usar:

```dart
import 'package:practico_2/main.dart';

final data = await supabase.from('clientes').select();
```

## Qué se cambió en el código
- `pubspec.yaml`: se agregaron `supabase_flutter` y `flutter_dotenv`, y `.env` como asset.
- `lib/main.dart`: carga el `.env` e inicializa Supabase antes de `runApp`.
- `.env` (credenciales, no se sube a git) y `.env.example` (plantilla, sí se sube).
- `.gitignore`: se agregó `.env`.
- `android/app/src/main/AndroidManifest.xml`: permiso de `INTERNET` (sin esto la app release en Android no se conecta).
- `supabase/schema.sql`: script de las tablas.
