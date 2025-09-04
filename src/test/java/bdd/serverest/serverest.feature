Feature: CRUD API ServeRest
  # API: https://serverest.de

  Background:
    Given url "https://serverest.dev"
    And header Content-Type = "application/json"
    * def usuarioSchema = read('classpath:requests/usertemplate.json')
    * def generador = callonce read('classpath:bdd/serverest/helpers/helper.js')
    * def id = "QgF0NeYwehxC1lKt"

  @get_usuarios
  Scenario: Listar todos los usuarios
    And path "usuarios"
    When method get
    Then status 200
    And match each response.usuarios == usuarioSchema

  @post_usuario
  Scenario: Registrar un nuevo usuario
    #usamos el helper para crear el usuario
    * def user = generador.usuarioValido()
    And path "usuarios"
    And request user
    When method post
    Then status 201
    And match response.message contains 'Cadastro realizado com sucesso'

    # Intento crear de nuevo con un email ya creado (caso negativo)
    And path "usuarios"
    And request {"nome":"QA 123","email":"QA2114d2b7@java.com","password":"test123","administrador":"true"}
    When method post
    Then status 400
    And match response.message contains '"Este email já está sendo usado'

  @get_usuario_por_id
  Scenario: Obtener un usuario por ID

    And path "usuarios", id
    When method get
    Then status 200
    And match response == usuarioSchema

  @put_usuario
  Scenario: Actualizar la informacion de un usuario existente

    And path "usuarios", id
    And request
      """
      {
        "nome": "Rodrigo",
        "email": "QA2114d2b7@java.com",
        "password": "test123",
        "administrador": "false"
      }
      """
    When method put
    Then status 200
    And match response.message contains 'Registro alterado com sucesso'

  @delete_usuario
  Scenario: Eliminar un usuario del sistema

    And path "usuarios", id
    When method delete
    Then status 200
    And match response.message contains 'Registro excluído com sucesso'
