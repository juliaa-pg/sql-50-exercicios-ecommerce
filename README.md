# 🗃️ SQL - 50 Exercícios do Básico ao Avançado

**Um projeto prático de SQL utilizando PostgreSQL, com exercícios voltados à consulta, manipulação e análise de dados.**

---

## 📖 Sobre

Este repositório reúne 50 exercícios de SQL organizados em quatro níveis de dificuldade, desde os comandos básicos até consultas avançadas.

Os exercícios utilizam como referência um cenário fictício de e-commerce, permitindo trabalhar com dados de clientes, produtos, pedidos, itens de pedidos e entregas.

## 📚 Conteúdo

| Nível | Exercícios | Principais conceitos |
|---|---|---|
| 🟢 Básico | 01–15 | SELECT, WHERE, ORDER BY, LIMIT e filtros |
| 🟡 Intermediário | 16–30 | GROUP BY, funções de agregação e HAVING |
| 🟠 Avançado | 31–45 | JOINs e relacionamentos entre tabelas |
| 🔴 Desafio Mestre | 46–50 | Subqueries e funções de janela |

## 🛒 Estrutura do banco de dados

O cenário de e-commerce é composto por cinco tabelas:

| Tabela | Descrição |
|---|---|
| `clientes` | Dados cadastrais dos clientes |
| `produtos` | Informações dos produtos disponíveis |
| `pedidos` | Registro dos pedidos realizados |
| `itens_pedido` | Produtos e quantidades associados a cada pedido |
| `entregas` | Dados relacionados ao envio dos pedidos |

## 📂 Organização dos arquivos

```text
sql-50-exercicios-ecommerce/
│
├── database/
│   ├── 01_create_tables.sql
│   └── 02_insert_sample_data.sql
│
├── exercicios/
│   ├── nivel-1-basico/
│   ├── nivel-2-intermediario/
│   ├── nivel-3-avancado/
│   └── nivel-4-desafio-mestre/
│
├── docs/
└── README.md
```

- **database:** criação das tabelas e inserção dos dados utilizados nos exercícios.
- **exercicios:** consultas SQL separadas por nível de dificuldade.
- **docs:** documentação complementar do projeto.

## ⚙️ Tecnologias

<p>
  <a href="https://www.postgresql.org/">
    <img src="https://skillicons.dev/icons?i=postgres" height="45" alt="PostgreSQL"/>
  </a>
  <a href="https://www.dbeaver.io/">
    <img src="https://cdn.simpleicons.org/dbeaver/382923" height="45" alt="DBeaver"/>
  </a>
  <a href="https://git-scm.com/">
    <img src="https://skillicons.dev/icons?i=git" height="45" alt="Git"/>
  </a>
  <a href="https://github.com/">
    <img src="https://skillicons.dev/icons?i=github" height="45" alt="GitHub"/>
  </a>
</p>

---

*Projeto desenvolvido para fins de aprendizado e demonstração prática de conhecimentos em SQL e análise de dados.*
