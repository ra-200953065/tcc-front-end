enum EnumHttpStatusCode {
  start,
  success,
  message,
  gotoLogin,
  gotoResetPassword,
  timeout,
}

/**
 * 200 Ok               Continuar
 * 201 Created          Continuar
 * 401 Unauthenticated  Ir para login
 * 403 Unauthorized     Mensagem
 * 404 Not found        Mensagem
 * 408 Timeout          Mostrar Tela de Tentar Novamente
 * 423 Locked           Ir para Reinicializar Senha
 * 500 Internal error   Mensagem
 */