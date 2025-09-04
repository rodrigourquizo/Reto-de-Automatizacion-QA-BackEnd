# Reto de Automatizacion QA BackEnd

📁 Estructura del proyecto
```
Reto-de-Automatizacion-QA-BackEnd/
├── pom.xml
└── src
    └── test
        ├── java
        │   ├── karate-config.js
        │   ├── bdd
        │   │   └── serverest
        │   │       ├── serverest.feature
        │   │       └── helpers
        │   │           └── helper.js
        │   └── requests
        │       └── usertemplate.json
        └── logback-test.xml
```

▶️ Cómo ejecutar

### Listar usuarios (GET /usuarios) → 200
```
mvn test -Dkarate.options="--tags @get_usuarios"
```

### Crear usuario (POST /usuarios) → 201 + intento de duplicado → 400
```
mvn test -Dkarate.options="--tags @post_usuario"
```

### Obtener usuario por ID (GET /usuarios/{_id}) → 200
```
mvn test -Dkarate.options="--tags @get_usuario_por_id"
```

### Actualizar usuario (PUT /usuarios/{_id}) → 200
```
mvn test -Dkarate.options="--tags @put_usuario"
```

### Eliminar usuario (DELETE /usuarios/{_id}) → 200
```
mvn test -Dkarate.options="--tags @delete_usuario"
```

# Estrategia de Automatización y Patrones Utilizados

## 🎯 Estrategia de Automatización

La estrategia se centra en validar el **CRUD de usuarios** de la API [ServeRest](https://serverest.dev/) utilizando **Karate DSL**, con el objetivo de cubrir tanto escenarios **positivos** (happy path) como **negativos** (validación de errores).

- **Cobertura de escenarios:**
  - `GET /usuarios` → listar usuarios.
  - `POST /usuarios` → registrar usuario válido y validar error por duplicado.
  - `GET /usuarios/{id}` → obtener un usuario específico por ID.
  - `PUT /usuarios/{id}` → actualizar información de un usuario existente.
  - `DELETE /usuarios/{id}` → eliminar un usuario del sistema.

- **Casos negativos:**  
  Se implementaron validaciones de error al intentar registrar usuarios con **email duplicado**, obtener usuarios con **ID inexistente** o actualizar con **payload inválido**.

- **Validaciones mínimas:**  
  Se validan principalmente **códigos de estado HTTP** (200/201/400) y mensajes de respuesta clave para mantener la suite simple y enfocada en los criterios de aceptación.

- **Datos dinámicos:**  
  Se generan **emails únicos** por ejecución para evitar errores de duplicidad innecesarios.


## 🧩 Patrones Utilizados

- **Feature Files organizados por recurso (Usuarios):**  
  Un único archivo `serverest.feature` contiene todos los escenarios CRUD, separados por tags (`@get_usuarios`, `@post_usuario`, etc.) para ejecución selectiva.

- **Uso de `Background`:**  
  Configuración común (URL base, header, carga de helper y esquema JSON) definida una sola vez y reutilizada en todos los escenarios.

- **Helpers (utilidades):**  
  Archivo `helper.js` con funciones reutilizables (`usuarioValido`, `email`) 
  Esto evita duplicar lógica de generación de datos de prueba.

- **Validación con esquemas JSON:**  
  Archivo `usertemplate.json` usado para validar respuestas de la API con `match` y expresiones de tipo (`#string`, `#regex`, etc.).



