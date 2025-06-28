{{ config(materialized='table') }}

select c.id as cliente_id,
       c.nome as cliente_nome,
       c.uf,
       c.tipo_cliente,
       c.limite_credito,
       c.data_cadastro,
        uf.nome as unidade_federacao
from {{ ref('raw_clientes') }} c join {{ ref('unidades_federacao') }} uf
on c.uf = uf.sigla
