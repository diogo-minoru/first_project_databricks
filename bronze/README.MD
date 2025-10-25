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

### Detalhes das tabelas
#### Customers
Tabela dimensão com cadastro de todos os clientes.
| Coluna           | Descrição                                       |
|------------------|-------------------------------------------------|
| customerkey      | Chave primária da tabela                        |
| gender           | Sexo do cliente Male/Female                     |
| givenname        | Primeiro nome do cliente                        |
| middleinitial    | Inicial do segundo nome do cliente              |
| surname          | Sobrenome do cliente                            |
| geoareakey       | Código da região do cliente                     |
| continent        | Nome do continente onde reside                  |
| countryfull      | Nome do país onde reside                        |
| statefull        | Nome do estado onde reside                      |
| city             | Nome do país onde reside                        |
| birthday         | Data de nascimento                              | 
| age              | Idade                                           |
| occupation       | Ocupação                                        |
| latitude         | Latitide da localização                         |

#### Orders
Tabela fato com registro dos detalhes de cada pedido.
| Coluna           | Descrição                                       |
|------------------|-------------------------------------------------|
| orderkey         | Chave primária da tabela                        |
| customerkey      | Chave extrangeira para a tabela customers       |
| storekey         | Chave extrangeira para a tabela de store        |
| orderdate        | Data do pedido                                  |
| deliverydate     | Data de entrega                                 |
| currencycode     | Moeda utilizada na negociação                   |

#### Orderrows
Tabela fato com registro dos detalhes dos itens que compõem cada pedido.
| Coluna           | Descrição                                       |
|------------------|-------------------------------------------------|
| OrderKey         | Chave extrageira para a tabela orders           |
| LineNumber       | Linha do pedido                                 |
| ProductKey       | Chave extrangeira para a tabela de product      |
| Quantity         | Quantidade do produto no pedido                 |
| UnitPrice        | Valor total                                     |
| NetPrice         | Valor líquido                                   |
| UnitCost         | Custo unitário                                  |

#### Product
Tabela dimensão com cadastro de todos os produtos.
| Coluna           | Descrição                                       |
|------------------|-------------------------------------------------|
| productkey       | Chave primária da tabela                        |
| productcode      | Código do produto                               |
| productname      | Nome do produto                                 |
| manufacturer     | Fabricante do procuto                           |
| brand            | Marca do produto                                |
| color            | Cor do produto                                  |
| weightunit       | Unidade de medida do peso                       |
| weight           | Peso do produto                                 |
| cost             | Custo unitário                                  |
| price            | Preço unitário                                  |
| categorykey      | Código da categoria do produto                  |
| categoryname     | Nome da categoria do produto                    |
| subcategorykey   | Código da subcategoria do produto               | 
| subcategoryname  | Nome da subcategoria do produto                 |

#### Store
Tabela dimensão com registro de cada loja.
| Coluna           | Descrição                                       |
|------------------|-------------------------------------------------|
| storekey         | Chave primária da tabela                        |
| storecode        | Código da loja                                  |
| geoareakey       | Código da região da loja                        |
| countrycode      | Código do país                                  |
| state            | Estado da loja                                  |
| opendate         | Data de abertura da loja                        |
| closedate        | Data do encerramento da loja                    |
| squaremeters     | Área total da loja                              |
| status           | Status da loja                                  |

#### Currency Exchange
Tabela de conversão das moedas em relação ao dólar, dia a dia.
| Coluna           | Descrição                                       |
|------------------|-------------------------------------------------|
| date             | Data da cotação                                 |
| fromcurrency     | Moeda original                                  |
| tocurrency       | Moeda convertida                                |
| exchange         | Proporção da conversão                          |

