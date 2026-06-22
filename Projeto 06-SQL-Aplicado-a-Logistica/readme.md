# 🚛 Projeto 06 – SQL Aplicado à Logística

## 📌 Sobre o Projeto

Este projeto foi desenvolvido com o objetivo de aplicar conceitos fundamentais de SQL em um cenário logístico, simulando operações de transporte, entregas e análise de custos.

Através da criação de banco de dados, tabelas relacionais e consultas analíticas, foi possível gerar informações relevantes para a tomada de decisão logística.

---

## 🎯 Objetivos

- Criar um banco de dados logístico
- Modelar tabelas relacionadas
- Utilizar comandos SQL para consultas e análises
- Aplicar filtros, agregações e junções (JOIN)
- Gerar indicadores de desempenho logístico

---

## 🛠️ Tecnologias Utilizadas

- MySQL
- DBeaver
- SQL

---

## 🗄️ Estrutura do Banco

### Tabela: Transportadoras

| Campo | Tipo |
|---------|---------|
| id | INT |
| nome | VARCHAR |
| cidade | VARCHAR |

### Tabela: Entregas

| Campo | Tipo |
|---------|---------|
| id | INT |
| transportadora_id | INT |
| destino | VARCHAR |
| distancia_km | INT |
| custo | DECIMAL |
| status | VARCHAR |
| data_saida | DATE |

---

## 📊 Dados Utilizados

### Transportadoras

| ID | Transportadora | Cidade |
|----|----------------|---------|
| 1 | Rápido Express | São Paulo |
| 2 | LogMais | Rio de Janeiro |
| 3 | Carga Brasil | Belo Horizonte |

### Entregas

| ID | Destino | KM | Custo |
|----|----------|----|--------|
| 1 | Campinas | 100 | R$ 250 |
| 2 | Santos | 80 | R$ 200 |
| 3 | Niterói | 50 | R$ 180 |
| 4 | Petrópolis | 120 | R$ 300 |
| 5 | Uberlândia | 500 | R$ 900 |

---

# 🔍 Consultas Desenvolvidas

## 1. Listagem de Entregas

```sql
SELECT * 
FROM entregas;
```

---

## 2. Entregas com Nome da Transportadora (JOIN)

```sql
SELECT
e.id,
t.nome AS Transportadora,
e.destino,
e.distancia_km,
e.custo,
e.status
FROM entregas e
INNER JOIN transportadoras t
ON e.transportadora_id = t.id;
```

---

## 3. Quantidade de Entregas por Transportadora

```sql
SELECT
t.nome,
COUNT(e.id) AS Quantidade_Entregas
FROM entregas e
INNER JOIN transportadoras t
ON e.transportadora_id = t.id
GROUP BY t.nome;
```

---

## 4. Custos por Transportadora

```sql
SELECT
t.nome,
COUNT(e.id) AS Qtd_Entregas,
SUM(e.custo) AS Custo_Total,
AVG(e.custo) AS Media_Por_Entrega
FROM entregas e
INNER JOIN transportadoras t
ON e.transportadora_id = t.id
GROUP BY t.nome;
```

---

## 5. Custo por Quilômetro

```sql
SELECT
e.id,
t.nome AS Transportadora,
e.destino,
e.distancia_km,
e.custo,
ROUND(e.custo/e.distancia_km,2) AS Custo_Por_KM
FROM entregas e
INNER JOIN transportadoras t
ON e.transportadora_id = t.id
ORDER BY Custo_Por_KM DESC;
```

---

## 6. Classificação dos Custos

```sql
SELECT
id,
destino,
custo,
CASE
WHEN custo < 200 THEN 'Custo Baixo (Otimizado)'
WHEN custo BETWEEN 200 AND 500 THEN 'Custo Médio'
ELSE 'Custo Alto (Gargalo)'
END AS Classificacao_Custo
FROM entregas;
```

---

# 📈 Principais Insights

✅ Identificação da transportadora com maior custo operacional.

✅ Comparação do custo médio por entrega.

✅ Análise do custo por quilômetro rodado.

✅ Classificação automática de entregas conforme o custo.

✅ Aplicação prática de JOIN, GROUP BY, ORDER BY, SUM, AVG e CASE.

---

# 💡 Competências Demonstradas

- Modelagem de Banco de Dados
- SQL Básico e Intermediário
- Consultas Analíticas
- Relacionamento entre Tabelas
- Análise de Custos Logísticos
- Business Intelligence
- Tomada de Decisão Baseada em Dados

---

## 📷 Evidências do Projeto

- Criação do banco de dados
- Estruturação das tabelas
- Execução de consultas SQL
- Relatórios analíticos no DBeaver

---

## 👨‍💻 Autor

**Wanderson Oliveira Carneiro**

Profissional de Logística | Controle de Estoque e Inventário | Estudante de Gestão da Tecnologia da Informação

🔗 LinkedIn: www.linkedin.com/in/wanderson-oliveira-logistica

🔗 GitHub: github.com/wandersonai

---

⭐ Projeto desenvolvido para compor meu portfólio de Análise de Dados aplicada à Logística.
