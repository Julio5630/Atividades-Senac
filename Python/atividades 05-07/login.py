usuario_correto = "admin"
senha_correta = "12345"

usuario_digitado = input("Digite o usuário: ")
senha_digitada = input("Digite a senha: ")

if usuario_digitado == usuario_correto and senha_digitada == senha_correta:
    print("Login bem-sucedido!")
else:
    print("Usuário ou senha incorretos.")