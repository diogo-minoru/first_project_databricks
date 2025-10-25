# Camada Silver - Transformação e Padronização de Dados
A camada Silver é responsável por tratar, limpar e integrar os dados vindos da camada Bronze, aplicando regras de negócio e garantindo qualidade e consistência.
Nesta etapa, os dados deixam de estar apenas padronizados e passam a estar confiáveis e prontos para análises intermediárias ou para alimentar a camada Gold.

### Transformações nas tabelas
#### Orders
Tabela fato com registros de cada pedido.

```sql
select a.orderkey,
       a.customerkey,
       a.storekey,
       cast(a.orderdate as date) as orderdate,
       cast(a.deliverydate as date) as deliverydate,
       a.currencycode
from stream first_project.bronze.orders a
```

| Coluna           | Transformação realizada                         |
|------------------|-------------------------------------------------|
| orderdate        | Formatado para data                             |
| deliverydate     | Formatado para data                             |

#### Customers
Tabela dimensão com cadastro de todos os clientes.

```sql
select a.customerkey,
       initcap(a.gender) as gender,
       left(a.givenname, 1) || '.' || a.middleinitial || '.' || left(a.surname, 1) as name,
       a.geoareakey,
       a.continent,
       a.countryfull,
       a.statefull,
       a.city,
       a.birthday,
       a.age,
       (floor((a.age / 5)) * 5) || ' to ' || (floor((a.age / 5)) * 5 + 4) as age_range,
       a.occupation,
       a.latitude,
       a.longitude
from  stream first_project.bronze.customer a
```

| Coluna           | Transformação realizada                         |
|------------------|-------------------------------------------------|
| gender           | Deixando a primeira letra maiúscula             |
| name             | Criando nome apenas com as iniciais             |
| age_range        | Criado faixa de idades de 5 anos                |

#### Orderrows
Tabela fato com registro dos detalhes dos itens que compõem cada pedido.

```sql
select a.OrderKey,
       a.LineNumber,
       a.ProductKey,
       a.Quantity,
       b.currencycode, 
       round((a.Quantity * a.NetPrice) * c.exchange, 2) as total_price_usd
from stream first_project.bronze.orderrows a
join stream first_project.bronze.orders b on a.OrderKey = b.orderkey
join stream first_project.bronze.currencyexchange c on b.orderdate = c.date and b.currencycode = c.fromcurrency
where c.tocurrency = 'USD'
```

| Coluna           | Descrição                                       |
|------------------|-------------------------------------------------|
| total_price      | Multiplicação da quantidade e do valor líquido considerando a conversão do valor do dólar em relação à moeda utilizada na transação  |


