# Camada Silver - Transformação e Padronização de Dados
A camada Silver é responsável por tratar, limpar e integrar os dados vindos da camada Bronze, aplicando regras de negócio e garantindo qualidade e consistência.
Nesta etapa, os dados deixam de estar apenas padronizados e passam a estar confiáveis e prontos para análises intermediárias ou para alimentar a camada Gold.

### Transformações nas tabelas
#### Customers
Tabela dimensão com cadastro de todos os clientes.
| Coluna           | Transformação realizada                         |
|------------------|-------------------------------------------------|
| gender           | Deixando a primeira letra maiúscula             |
| name             | Criando nome apenas com as iniciais             |
| age_range        | Criado faixa de idades de 5 anos                |

#### Orderrows
Tabela fato com registro dos detalhes dos itens que compõem cada pedido.
| Coluna           | Descrição                                       |
|------------------|-------------------------------------------------|
| total_price      | Multiplicação da quantidade e do valor líquido  |


