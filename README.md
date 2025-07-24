# 🐱 Catbreeds App

Una aplicación móvil desarrollada en **Flutter** que permite explorar y conocer diferentes razas de gatos utilizando **The Cat API**. La app presenta información detallada sobre cada raza, incluyendo características, temperamento, origen y más.

## 📱 Características

- ✅ **Splash Screen** con animación de carga
- ✅ **Lista de razas** con imágenes y información básica
- ✅ **Búsqueda en tiempo real** por nombre de raza (en inglés)
- ✅ **Pantalla de detalle** con información completa
- ✅ **Imágenes optimizadas** con caché automático
- ✅ **Manejo de errores** y estados de carga
- ✅ **Pull-to-refresh** para actualizar datos
- ✅ **Interfaz responsive** y moderna

## 🏗️ Arquitectura del Proyecto

```
lib/
├── models/              # Modelos de datos
│   ├── cat_breed.dart   # Modelo principal de raza
│   ├── cat_image.dart   # Modelo de imagen
│   └── weight.dart      # Modelo de peso
├── screens/             # Pantallas de la aplicación
│   ├── splash_screen.dart    # Pantalla inicial
│   ├── landing_screen.dart   # Lista de razas
│   └── detail_screen.dart    # Detalle de raza
├── services/            # Servicios de API
│   └── cat_api_service.dart  # Cliente de The Cat API
├── widgets/             # Componentes reutilizables
│   └── breed_card.dart       # Tarjeta de raza
└── main.dart           # Punto de entrada
```

## 🛠️ Tecnologías Utilizadas

- **Flutter** 3.8+ (Framework principal)
- **Dart** (Lenguaje de programación)
- **HTTP** (Llamadas a la API)
- **Cached Network Image** (Optimización de imágenes)
- **The Cat API** (Fuente de datos)

## 🔗 API Utilizada

**The Cat API**: `https://api.thecatapi.com/v1/breeds`

### Endpoints:
- `GET /breeds?limit=20&page=0` - Lista de razas
- `GET /breeds/search?q={query}` - Búsqueda de razas

## 📱 Pantallas

### 1. Splash Screen
- Logo de la aplicación
- Indicador de carga
- Navegación automática después de 3 segundos

### 2. Landing Screen  
- **Header**: Título "Catbreeds"
- **Buscador**: Campo de búsqueda en tiempo real
- **Lista**: Cards con información de cada raza
  - Imagen del gato
  - Nombre de la raza
  - País de origen
  - Nivel de inteligencia
  - Botón "More..."

### 3. Detail Screen
- **Imagen grande**: Mitad superior de la pantalla (fija)
- **Contenido scrolleable**: Mitad inferior con:
  - **Description**: Descripción completa de la raza
  - **General Information**: Origen, esperanza de vida, peso, temperamento
  - **Characteristics**: Ratings de 1-5 estrellas para:
    - Intelligence, Adaptability, Affection Level
    - Child Friendly, Dog Friendly, Energy Level
    - Grooming, Health Issues, Social Needs
    - Stranger Friendly, Vocalization
  - **Special Characteristics**: Chips coloridos para características especiales

## 🚀 Instalación y Ejecución

### Prerrequisitos
- Flutter SDK 3.8+
- Dart SDK 3.0+
- Android Studio / VS Code
- Dispositivo Android/iOS o emulador

### Pasos:

1. **Clonar el repositorio**
```bash
git clone <repository-url>
cd catbreeds
```

2. **Instalar dependencias**
```bash
flutter pub get
```

3. **Ejecutar la aplicación**
```bash
flutter run
```

## 📦 Dependencias

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0                    # HTTP requests
  cached_network_image: ^3.3.0   # Image caching

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
```

## 🎨 Patrón de Diseño

### **Separación de Responsabilidades**
- **Models**: Estructuras de datos y serialización JSON
- **Services**: Lógica de negocio y llamadas API  
- **Screens**: Interfaces de usuario y navegación
- **Widgets**: Componentes reutilizables

### **Gestión de Estado**
- **StatefulWidget** para componentes dinámicos (búsqueda, listas)
- **StatelessWidget** para componentes estáticos (cards, detalles)

## 🔄 Flujo de Datos

```
API → CatApiService → Models → Screens → Widgets
```

1. **CatApiService** realiza peticiones HTTP
2. **Models** deserializan respuestas JSON
3. **Screens** manejan estado y navegación
4. **Widgets** renderizan la interfaz

## 🌟 Características Técnicas

### **Optimizaciones**
- Imágenes con caché automático
- Lazy loading en listas
- Manejo eficiente de memoria
- Estados de carga y error

### **UX/UI**
- Diseño Material Design 3
- Animaciones suaves
- Feedback visual inmediato
- Interfaz intuitiva y moderna

### **Robustez**
- Manejo de errores de red
- Validación de datos
- Estados de loading
- Fallbacks para imágenes

## 📝 Notas de Desarrollo

- **Idioma**: Interfaz completamente en inglés para consistencia
- **Responsive**: Adaptable a diferentes tamaños de pantalla
- **Performance**: Optimizado para dispositivos móviles
- **Maintainability**: Código limpio y bien estructurado

## 🤝 Contribución

Este proyecto fue desarrollado como una demostración de habilidades en Flutter y manejo de APIs REST. La estructura permite fácil extensión y mantenimiento.

---

**Desarrollado con ❤️ usando Flutter**
