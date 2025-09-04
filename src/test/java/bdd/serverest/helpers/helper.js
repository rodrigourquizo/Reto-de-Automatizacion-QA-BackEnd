function() {
  function uuid8() {
    return java.util.UUID.randomUUID().toString().substring(0, 8);
  }

  function email() {
    return 'QA' + uuid8() + '@java.com';
  }

  function usuarioValido() {
    var email_ = email();
    return { nome: 'QA ' + uuid8(), email: email_, password: 'test123', administrador: 'true' };
  }

  // exporta las funciones
  return { uuid8: uuid8, email: email, usuarioValido: usuarioValido };
}
