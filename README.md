# Guia de Estudos: MySQL e Análise de Dados

Um guia de estudos interativo e de página única sobre MySQL para Análise de Dados, criado como projeto para o curso de **Banco de Dados para Data Science** do Senai.

---

## 📜 Sobre o Projeto

Este projeto é uma página web estática criada para servir como um repositório de conhecimento e um guia prático sobre MySQL. A ideia foi centralizar os principais comandos e conceitos aprendidos durante o curso, criando um material de fácil acesso para consultas futuras, tanto para mim quanto para a comunidade.

O site foi construído do zero utilizando **HTML, CSS (com framework Tailwind CSS) e JavaScript puro**. O desenvolvimento contou com o auxílio de **IA generativa gratuita** como uma ferramenta de produtividade para gerar estruturas de código, otimizar estilos e criar scripts, demonstrando uma abordagem moderna e ágil para o desenvolvimento front-end.

---

## ✨ Funcionalidades do Site

* **Página Única e Responsiva:** Design limpo e acessível em qualquer dispositivo.
* **Tema Claro e Escuro:** Botão para alternar o tema visual da página, com persistência da escolha no navegador.
* **Blocos de Código Interativos:** Todos os exemplos de SQL possuem um botão "Copiar" para facilitar o uso.
* **Glossário Modal:** Termos técnicos de SQL podem ser clicados para exibir uma janela pop-up com a definição.
* **Navegação Suave:** Links no menu que rolam suavemente para a seção correspondente.
* **Animações Dinâmicas:** Elementos que surgem suavemente na tela conforme o usuário rola a página.

---

## 🚀 Tecnologias Utilizadas

* **Front-End:**
    * `HTML5`: Estrutura e semântica do conteúdo.
    * `CSS3 / Tailwind CSS`: Estilização e design responsivo.
    * `JavaScript`: Interatividade, manipulação do DOM e funcionalidades dinâmicas.
* **Conceitos de Banco de Dados:**
    * `MySQL`: Todos os exemplos de código e conceitos são voltados para este SGBD.
* **Ferramentas de Desenvolvimento:**
    * **IA Generativa:** Utilizada como assistente de programação para acelerar o desenvolvimento.

---

## 🧠 Conceitos de SQL Abordados no Guia

O guia está estruturado para cobrir desde os fundamentos até a análise de dados prática.

### 1. **Setup do Ambiente**
* Instruções para baixar e instalar o **MySQL Server** e o **MySQL Workbench**.

### 2. **Comandos Essenciais (DDL e DQL)**
* `CREATE DATABASE`: Para criar um novo banco de dados.
* `CREATE TABLE`: Para definir a estrutura de uma tabela, com tipos de dados (`INT`, `VARCHAR`, `DATE`) e constraints (`PRIMARY KEY`, `NOT NULL`).
* `ALTER TABLE`: Para adicionar chaves estrangeiras (`FOREIGN KEY`) e criar relacionamentos.
* `SELECT`: Para realizar consultas, com cláusulas como `WHERE` para filtrar dados.

### 3. **Guia Prático: Banco de Dados `sn_bank`**
Um passo a passo completo que simula um cenário real, incluindo:
* Criação de 9 tabelas (`tabelaclientes`, `tabelaconta`, `tabelacolaboradores`, etc.).
* `LOAD DATA INFILE`: Comando para popular as tabelas massivamente a partir de arquivos `.csv`.
* Criação de todas as chaves estrangeiras para garantir a integridade relacional dos dados.

### 4. **Análise de Dados com SQL**
Exemplos práticos de como extrair informações valiosas dos dados:
* **Inspeção:** Uso de `DESCRIBE` para ver a estrutura da tabela e `LIMIT` para visualizar amostras de dados.
* **Funções de Agregação:** `COUNT()`, `AVG()`, `MAX()` para resumir informações.
* **Agrupamento:** `GROUP BY` para agrupar dados por categorias (ex: clientes por estado) e `ORDER BY` para ordenar os resultados.
* **Manipulação de Dados (DML):** `INSERT INTO`, `UPDATE` e `DELETE` para gerenciar os registros nas tabelas.

---

## ⚙️ Como Utilizar

1.  Clone ou baixe este repositório.
2.  Abra o arquivo `mysql.html` em qualquer navegador de internet moderno (Chrome, Firefox, Edge, etc.).
3.  Pronto! Toda a aplicação roda diretamente no navegador, sem necessidade de um servidor.

---

## 👨‍💻 Sobre Mim

Meu nome é **Leandro Andrade**, tenho 28 anos e estou em transição de carreira para a área de Inteligência Artificial e Dados. Sou formado como Analista de Dados pelo SENAI e tenho conhecimentos em Python, MySQL e Power BI. Este projeto reflete minha dedicação e paixão por aprender e construir soluções práticas com dados.

[LinkedIn](https://www.linkedin.com/in/leanttro/) | [GitHub](https://github.com/leanttro) | [Portfólio](https://leanttro.github.io/portfolio/)

---

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.
