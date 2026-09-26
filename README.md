# 🚗 Projeto de Banco de Dados: Locadora de Carros — FAETERJ

Este repositório contém o projeto prático avaliativo (Etapa 1) desenvolvido durante a disciplina de **Gestão de Projetos de Banco de Dados** da **FAETERJ**.

O objetivo deste projeto é realizar o ciclo completo de modelagem e implementação de um banco de dados relacional para o cenário de uma **Locadora de Carros**, abrangendo desde o levantamento de requisitos, Diagrama Entidade-Relacionamento (DER), normalização e dicionário de dados até a implementação física em SQL.

---

## 🛠️ Tecnologias e Ferramentas

* **Linguagem:** SQL (DDL, DML e DQL)
* **SGBD:** MySQL / MariaDB
* **Ambiente de Desenvolvimento:** VS Code (SQLTools) / MySQL Workbench
* **Modelagem:** Modelo Entidade-Relacionamento (MER / DER)

---

## 📋 Cenário e Regras de Negócio

O sistema modela a operação de aluguel de veículos em diferentes agências, respeitando as seguintes regras de negócio:

* Clientes alugam carros em agências.
* **Cardinalidade Cliente x Carro (`N:N`):** 1 cliente pode alugar 1 ou mais carros, e 1 carro pode ser alugado por 1 ou mais pessoas (em datas determinadas).
* **Cardinalidade Agência x Carro (`1:N`):** 1 carro pertence a apenas 1 agência, e 1 agência pode possuir 1 ou mais carros.
* **Restrição de Integridade:** Não são permitidos dados nulos (`NOT NULL`) no banco de dados; todas as informações devem ser obrigatoriamente preenchidas.

---

## 📐 Modelagem Conceitual, Lógica e Normalização

### 1. Entidades e Atributos Iniciais
* **Cliente:** CNH, Nome, Cartão, Telefone
* **Carro:** Placa, Modelo, Ano, Número da Agência (`NumAg`)
* **Agência:** Número da Agência (`NumAg`), Endereço, Contato

### 2. Resolução de Relacionamentos e Normalização
* **Tabela Associativa (`Aluguel`):** Devido à relação `N:N` entre `Cliente` e `Carro`, foi criada a tabela adicional **`Aluguel`** contendo a data da locação (`Data`) e uma Chave Primária Composta formada por `CNH` e `Placa`.
* **Normalização de Endereço (1ª Forma Normal):** Como o atributo `Endereço` da entidade `Agência` armazena múltiplas informações, ele foi decomposto em três colunas atômicas: **`Rua`**, **`Cidade`** e **`Estado`**.

---

## 📖 Dicionário de Dados

Descrição estrutural das tabelas que compõem o modelo físico e suas respectivas relações:

| Tabela | Relacionamento | Nome do Relacionamento | Descrição |
| :--- | :--- | :--- | :--- |
| **Cliente** | Carro (via Aluguel) | Aluga | Tabela para cadastro dos clientes da locadora |
| **Agencia** | Carro | Possui / Pertence | Tabela para cadastro das agências (endereço normalizado em Rua, Cidade e Estado) |
| **Carro** | Cliente / Agência | Aluga / Pertence | Tabela para cadastro dos carros disponíveis para aluguel |
| **Aluguel** | Cliente / Carro | Registra Aluguel | Tabela associativa (`N:N`) que relaciona cada cliente ao respectivo carro alugado e à data |

---

## 📂 Estrutura de Conteúdos

Os scripts SQL foram modularizados por categoria (DDL, DML e DQL) para organizar a ordem de execução:

```text
faeterj-gpbd-locadora-carros/
├── sql/                                      # Scripts SQL modularizados por responsabilidade
│   ├── 01_schema_ddl.sql                     # Criação do banco e das tabelas (CREATE DATABASE / TABLE)
│   ├── 02_seed_dml.sql                       # Inserção dos registros iniciais (INSERT INTO)
│   └── 03_queries_dql.sql                    # Consultas de validação das tabelas (SELECT)
└── README.md                                 # Documentação do projeto, modelagem e dicionário de dados
```

---

## 🚀 Como Executar o Projeto

Para testar o banco de dados localmente, siga o **Passo 1** para ligar o servidor e, em seguida, escolha **apenas uma** das alternativas no **Passo 2** (**Opção A**, **Opção B** ou **Opção C**).

### Passo 1: Iniciar o Servidor Local (Pré-requisito Obrigatório)

1. Abra o **XAMPP Control Panel** (ou o gerenciador de serviços do **MySQL Server**).
2. Localize o módulo **MySQL** e clique no botão **Start**.
3. Aguarde até que o serviço fique ativo (verde) na porta padrão **`3306`** (`Host: 127.0.0.1` | `User: root`).

---

### Passo 2: Executar os Scripts SQL (Escolha a Opção A, B ou C)

#### Opção A — Pela Extensão do VS Code

1. No VS Code, instale a extensão **MySQL (Database Client)**.
2. Clique no ícone de Banco de Dados na barra lateral esquerda e clique em **`+` (Create Connection)**.
3. Preencha os dados da conexão local e clique em **`+ Connect`**:
   * **Host:** `127.0.0.1`
   * **Port:** `3306`
   * **Username:** `root`
   * **Password:** *(deixe em branco no XAMPP padrão)*
4. Volte ao **Explorador de Arquivos** do VS Code (`Ctrl + Shift + E`), abra os arquivos da pasta `sql/` na ordem numérica, selecione todo o conteúdo do arquivo com **`Ctrl + A`** e clique no botão **Run SQL (`▷`)** no canto superior direito do editor:
   * 1º: `sql/01_schema_ddl.sql` *(cria o banco `locadora_carros` e as 4 tabelas)*
   * 2º: `sql/02_seed_dml.sql` *(insere os clientes, agências, carros e aluguéis)*
   * 3º: `sql/03_queries_dql.sql` *(exibe as tabelas preenchidas na tela)*

#### Opção B — Pelo MySQL Workbench

1. Abra o **MySQL Workbench** e conecte-se à sua instância local (`Root Localhost` — `127.0.0.1:3306`).
2. No menu superior, vá em **`File > Open SQL Script...`** e abra os três arquivos da pasta `sql/` (eles serão abertos em 3 abas separadas).
3. Execute cada aba na ordem numérica clicando no ícone do **Raio (`⚡`)** na barra de ferramentas superior:
   * 1ª Aba: `01_schema_ddl.sql`
   * 2ª Aba: `02_seed_dml.sql`
   * 3ª Aba: `03_queries_dql.sql`

#### Opção C — Via Terminal (Linha de Comando)

Caso prefira executar os arquivos diretamente pelo terminal:

```bash
# 1. Criar a estrutura do banco de dados e tabelas (DDL)
mysql -u root -p < sql/01_schema_ddl.sql

# 2. Popular as tabelas com os dados de teste (DML)
mysql -u root -p < sql/02_seed_dml.sql

# 3. Executar as consultas de verificação (DQL)
mysql -u root -p < sql/03_queries_dql.sql
```

---

## 📝 Sobre a Disciplina

* **Instituição:** FAETERJ (Faculdade de Educação Tecnológica do Estado do Rio de Janeiro)
* **Disciplina:** Gestão de Projetos de Banco de Dados
* **Foco:** Modelagem de Dados (Conceitual, Lógica e Física), Normalização e Implementação em SQL
