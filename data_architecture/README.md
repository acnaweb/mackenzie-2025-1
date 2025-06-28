
# Pipeline de Dados com Arquitetura Medallion

## 📥 Fonte de Dados (MySQL)

**Tabelas transacionais:**

- `pedido (id, id_cliente, data, valor, created_at, updated_at)`  
  Volume: ~15.000 registros/dia

- `cliente (id, nome, sexo, uf, created_at, updated_at)`  
  Volume: ~5.000 registros totais

**Exemplo de logs de transações (DML):**
```sql
INSERT INTO pedido VALUES (...);
UPDATE pedido SET valor = 10 WHERE id = 1;
DELETE FROM pedido WHERE id = 3;
```

---

## ⛓️ Ingestão de Dados (Airflow)

**Frequência e Estratégias:**

| Tabela  | Frequência | Estratégia             |
|---------|------------|------------------------|
| pedido  | 1 hora     | Full + Incremental (updated_at ou CDC) |
| cliente | 3 horas    | Full + Incremental     |

**Query de exemplo para carga incremental:**
```sql
SELECT * FROM pedido WHERE updated_at > '{{ data_interval_start }}';
```

---

## 🪵 Bronze Layer – Raw (BigQuery)

**Objetivo:**  
Armazenar dados brutos com todas as operações DML (insert/update/delete) oriundas do sistema transacional. Serve como base para histórico e auditoria.

**Tabelas:**
- `bronze.pedido_raw`
- `bronze.cliente_raw`

---

## 🔧 Silver Layer – Refined (BigQuery)

**Objetivo:**  
Aplicar transformações, limpeza e padronização dos dados.

**Exemplos de Transformações:**

| Campo | Tratamento             |
|-------|------------------------|
| sexo  | F → Feminino, M → Masculino |
| uf    | SP → São Paulo, RJ → Rio de Janeiro |

**Tabelas:**
- `silver.pedido`
- `silver.cliente`

---

## 📊 Gold Layer – Curated (BigQuery / DW)

**Objetivo:**  
Dados prontos para consumo analítico e visualização em dashboards.

**Exemplo de visão:**
```sql
SELECT
  p.id AS pedido_id,
  c.id AS cliente_id,
  c.nome,
  c.sexo,
  c.uf,
  p.data,
  p.valor
FROM silver.pedido p
JOIN silver.cliente c ON p.id_cliente = c.id;
```

**Técnicas de carga:**

| Tipo de carga  | Técnica               |
|----------------|-----------------------|
| Full           | TRUNCATE + INSERT     |
| Incremental    | INSERT                |
| UPSERT         | MERGE (INSERT + UPDATE) |
| CDC completo   | INSERT + UPDATE + DELETE |

---

## 🔁 Resumo do Pipeline

```
MySQL → Airflow → Bronze (Raw) → Silver (Refined) → Gold (Curated)
```
