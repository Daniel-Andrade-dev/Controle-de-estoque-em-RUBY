# 📦 Controle de Estoque — Ruby

Sistema simples de controle de estoque em linha de comando, desenvolvido em Ruby puro, sem dependências externas. Permite cadastrar, consultar, atualizar e remover produtos, além de calcular o faturamento total do estoque.

---

## 🎯 Objetivo

Resolver o problema de gerenciamento básico de inventário de forma interativa via terminal, oferecendo operações CRUD completas sobre produtos e funcionalidades de análise financeira do estoque.

---

## ✨ Funcionalidades

- **Cadastrar produto** — Registra um novo produto com nome, preço, quantidade e status ativo/inativo
- **Mostrar estoque** — Exibe todos os produtos atualmente cadastrados com seus detalhes completos
- **Buscar produto** — Localiza um produto pelo nome e exibe suas informações
- **Atualizar produto** — Edita os dados de um produto existente (nome, preço, quantidade e status)
- **Deletar produto** — Remove permanentemente um produto do estoque pelo nome
- **Produto mais barato** — Retorna o produto com o menor preço cadastrado
- **Produto mais caro** — Retorna o produto com o maior preço cadastrado
- **Faturamento total** — Calcula o valor total do estoque multiplicando preço × quantidade de cada produto

---


## ▶️ Como Usar

**1. Clone ou baixe o arquivo:**

```bash
git clone <url-do-repositorio>
# ou simplesmente faça download do arquivo estoque.rb
```

**2. Execute no terminal:**

```bash
ruby estoque.rb
```

**3. Navegue pelo menu interativo:**

```
==== CONTROLE DE ESTOQUE ====
1 - Cadastrar produto
2 - Mostrar estoque
3 - Buscar produto
4 - Atualizar produto
5 - Deletar produto
6 - Ver produto mais baratos
7 - Ver produtos mais caros
8 - Ver faturamento total do estoque
0 - Sair
```

**Exemplo de cadastro:**

```
Informe a opção que deseja: 1
Digite o nome do produto: Arroz 5kg
Digite o preço do produto: 25.90
Digite a quantidade que deseja cadastrar: 50
Produto ativo = 1 inativo = 0: 1
Produto cadastrado
```

---

## ⚠️ Validações Implementadas

| Regra                                         | Comportamento            |
|-----------------------------------------------|--------------------------|
| Nome vazio                                    | Rejeita o cadastro       |
| Preço ou quantidade `<= 0`                    | Rejeita o cadastro       |
| Campo `ativo` com valor diferente de `0` ou `1` | Rejeita o cadastro     |
| Produto inexistente na busca/deleção/atualização | Exibe mensagem de erro |

---

## 🔍 Observações Técnicas

- O estoque é mantido **em memória** (array Ruby) — os dados são perdidos ao encerrar o programa. Para persistência, seria necessário integrar leitura/escrita em arquivo (CSV, JSON) ou banco de dados.
- A busca por produto é **case-sensitive**: `"Arroz"` e `"arroz"` são tratados como produtos diferentes.
---

## 👤 Autor

Desenvolvido como projeto de estudo para prática de lógica de programação em Ruby.