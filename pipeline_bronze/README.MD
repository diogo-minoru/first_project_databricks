# Ingestão Camada Bronze
Esta pipeline tem como objetivo realizar a ingestão e padronização dos dados da camada Raw para a camada Bronze dentro da arquitetura Medalhão.

A camada Bronze armazena os dados em formato estruturado, mantendo sua integridade original, mas com ajustes mínimos para garantir consistência de tipos e formatos.

As seguintes tabelas são carregadas pela pipeline:

| Tabela           | Descrição                                       |
|------------------|-------------------------------------------------|
| customer         | Dados cadastrais de clientes                    |
| orders           | Informações sobre os pedidos realizados         |
| orderrows        | Detalhamento de itens de cada pedido            |
| sales            | Registros consolidados de vendas                |
| currencyexchange | Taxas de câmbio utilizadas nas transações       |
| products         | Catálogo de produtos disponíveis                |
| store            | Dados de lojas e pontos de venda                |
