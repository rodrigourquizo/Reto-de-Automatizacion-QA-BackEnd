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
