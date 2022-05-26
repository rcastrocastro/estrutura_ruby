#language: pt

Funcionalidade: Post Criar customer

Cenário: Create new Customer
  Quando realizar o request post customer
  Entao a API deverá retornar o cadastro do novo customer com a reposta 200
