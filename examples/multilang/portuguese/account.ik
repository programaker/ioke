use("portuguese")

Conta = Origem imite faça(
    transfira = método(valor, de: eu, para:,
        de saldo -= valor
        para saldo += valor
    )

    imprima = método(
        "<Conta nome: #{nome} saldo: #{saldo}>" imprimaLinha
    )
)

João = Conta com(nome: "João", saldo: 142.0)
José = Conta com(nome: "José", saldo: 45.7)

Conta transfira(23.0, de: João, para: José)
Conta transfira(10.0, para: João, de: José)

José transfira(57.4, para: João)

João imprima
José imprima
