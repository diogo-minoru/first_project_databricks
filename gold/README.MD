# Ingestão Camada Gold
A camada Gold é o nível mais alto da arquitetura Medallion e tem como principal objetivo fornecer dados prontos para análise, dashboards e indicadores de negócio.
Nesta etapa, os dados são derivados da camada Silver, passando por cálculos, agregações e modelagem analítica (como modelo estrela).

As seguintes tabelas são carregadas pela pipeline:

| Tabela           | Descrição                                       |
|------------------|-------------------------------------------------|
| dim_customer     | Dados cadastrais de clientes                    |
| dim_product      | Catálogo de produtos disponíveis                |
| dim_store        | Dados de lojas e pontos de venda                |
| fact_orderrows   | Detalhamento de itens de cada pedido            |
| total_orders_by_date       | Cálculo de kpi por dia                |

### Detalhes das tabelas
#### Tabela Fact Orderrows
Tabela fato com detalhe dos pedidos a nível de itens.

```sql
select a.orderkey,
       a.quantity,
       a.total_price_usd,
       a.productkey,
       b.customerkey,
       b.storekey,
       b.orderdate,
       b.deliverydate,
       extract(day from b.deliverydate - b.orderdate) as delivery_days
from stream first_project.silver.orderrows a
join stream first_project.silver.orders b on a.orderkey = b.orderkey
```

| Coluna           | Descrição                                       |
|------------------|-------------------------------------------------|
| orderkey         | Chave primária da tabela                        |
| quantity         | Sexo do cliente Male/Female                     |
| total_price_usd  | Primeiro nome do cliente                        |
| productkey       | Inicial do segundo nome do cliente              |
| customerkey      | Sobrenome do cliente                            |
| storekey         | Código da região do cliente                     |
| orderdate        | Nome do continente onde reside                  |
| deliverydate     | Nome do país onde reside                        |
| delivery_days    | Nome do estado onde reside                      |

#### Tabela Total Orders by Date
Tabela com cálculo de kpi a nível de dia.

```sql
select a.orderdate,
      count(*) as total_order_by_date,
      count(distinct a.customerkey) as total_distinct_customer_by_date,
      count(distinct b.ProductKey) as total_distinct_product_by_date,
      count(c.customerkey) as total_new_customers_by_date,
      round(sum(b.total_price_usd), 2) as total_revenue_usd_by_date,
      sum(b.quantity) as total_quantity_by_date
from first_project.silver.orders a
join first_project.silver.orderrows b on a.orderkey = b.OrderKey
left join (
    select a.customerkey,
          min(orderdate) as first_buy_date
    from first_project.silver.orders a
    group by a.customerkey
  ) c on a.customerkey = c.customerkey and a.orderdate = c.first_buy_date
group by a.orderdate
```

| Coluna           | Descrição                                       |
|------------------|-------------------------------------------------|
| orderdate         | Agregação a nível de data do pedido|
| total_order_by_date      | Total de pedidos no dia|
| total_distinct_customer_by_date         | Total de clientes distintos com pedido no dia|
| total_distinct_product_by_date        | Total de produtos distintos vendidos no dia|
| total_new_customers_by_date     | Total de clientes que realizaram a primeira compra|
| total_revenue_usd_by_date     | Valor total do pedido, considerando a conversão para o dólar |
| total_quantity_by_date | Quantidade de itens vendidos no dia |