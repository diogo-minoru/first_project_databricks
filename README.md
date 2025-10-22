# Projeto Databricks

Este projeto foi criado como um primeiro exercício de uso do Databricks, com o objetivo de explorar os principais recursos da plataforma — incluindo criação de schemas, execução de queries SQL, notebooks e gestão de dados em Lakehouse.

O foco é compreender a estrutura básica de um projeto Databricks e preparar o ambiente para futuros desenvolvimentos de engenharia de dados e análise exploratória.

Os dados de exemplo foram extraídos de um arquivo `.csv` de uma empresa fictícia chamada [Contoso](https://learn.microsoft.com/pt-br/microsoft-365/enterprise/contoso-overview?view=o365-worldwide), através da [Base de Dados](https://github.com/sql-bi/Contoso-Data-Generator-V2-Data/releases/tag/ready-to-use-data) que consiste em uma empresa multinacional com sede em Paris. A empresa é uma organização de manufatura, vendas e suporte com mais de 100.000 produtos.

# 1 - Configuração do ambiente
Primeiro foi necessário criar os esquemas onde as tabelas serão organizadas. Para isso, foi adicionado uma pasta com um notebook para criar os esquemas `raw, bronze, silver e gold` dentro do catálogo `first_project`

```sql
%sql
USE CATALOG first_project;
CREATE SCHEMA IF NOT EXISTS raw;

CREATE SCHEMA IF NOT EXISTS bronze;

CREATE SCHEMA IF NOT EXISTS silver;

CREATE SCHEMA IF NOT EXISTS gold;
```

# 2 - Ingestão de dados
Para simular um ambiente de produção, os dados estão armazenados em um banco de dados PostgreSQL através do [Supabase](https://supabase.com/).

Para realizar a ingestão dos dados do PostgreSQL para o Databricks, será utilizado o Fivetran, utilizando seus conectores.

![Fivetran](./fivetran.png)

A ingestão será realizada na camada raw, como apresentado no esquema abaixo:

![Fivetran](./medallion.png)