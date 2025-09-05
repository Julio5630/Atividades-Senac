nota_a1 = float(input("Digite a primeira nota: "))
nota_a2 = float(input("Digite a segunda nota: "))
nota_a3 = float(input("Digite a terceira nota: "))

media_aluno = (nota_a1 + nota_a2 + nota_a3) / 3

if media_aluno >= 7:
    print("Aprovado!")
elif 5 <= media_aluno < 7: 
    print("Recuperação.")
else:
    print("Reprovado.")