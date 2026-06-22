# 📉 Projeto 07 – Dashboard Power BI

## 📌 Sobre o Projeto

Este projeto apresenta a construção de um Dashboard Logístico desenvolvido no Power BI para monitoramento de indicadores operacionais de transporte e distribuição.

O dashboard transforma dados operacionais em informações estratégicas, permitindo acompanhar entregas, atrasos, custos de frete e desempenho das transportadoras.

---

## 🎯 Objetivos

- Monitorar o desempenho logístico.
- Controlar custos de transporte.
- Acompanhar entregas realizadas e atrasadas.
- Avaliar a performance das transportadoras.
- Apoiar a tomada de decisão através de indicadores.

---

## 🛠 Ferramentas Utilizadas

- Power BI Desktop
- Power Query
- DAX
- Excel
- Modelagem de Dados

---

## 📊 KPIs Desenvolvidos

| Indicador | Valor |
|------------|--------|
| Total Entregues | 9 |
| Total Atrasadas | 7 |
| Custo Total | R$ 10.974 |
| Frete Médio | R$ 365,80 |

---

## 📈 Visualizações do Dashboard

### 🚚 Status das Entregas
Gráfico de Pizza apresentando:

- Entregue
- Atrasada
- Cancelado
- Em Trânsito

### 🚛 Custo por Transportadora
Comparação dos custos totais entre transportadoras.

### 🏙 Pedidos por Cidade
Análise da quantidade de pedidos por cidade.

### 📅 Evolução das Entregas
Acompanhamento temporal dos pedidos realizados.

### 🎛 Segmentadores
Filtros interativos para:

- Cidade
- Transportadora
- Status

---

## 🔄 Etapas do Projeto

### 1️⃣ Tratamento dos Dados

Realizado no Power Query:

- Correção de tipos de dados
- Limpeza de registros
- Padronização de colunas

### 2️⃣ Modelagem de Dados

Criação de medidas DAX:

```DAX
Total Pedidos =
COUNT('Dados Log'[Pedido])

Total Entregues =
CALCULATE(
    COUNT('Dados Log'[Pedido]),
    'Dados Log'[Status] = "Entregue"
)

Total Atrasadas =
CALCULATE(
    COUNT('Dados Log'[Pedido]),
    'Dados Log'[Status] = "Atrasada"
)

Custo Total =
SUM('Dados Log'[Valor_Frete])

Frete Médio =
AVERAGE('Dados Log'[Valor_Frete])
```

### 3️⃣ Desenvolvimento do Dashboard

- Cards de KPI
- Gráficos Interativos
- Segmentação de Dados
- Layout Executivo

---

## 📸 Dashboard Final

Adicione a imagem do dashboard na pasta **Imagens** e utilize:

```markdown
![Dashboard Logístico Power BI](Imagens/dashboard-powerbi.png)
```

---

## 💡 Competências Demonstradas

- Business Intelligence
- Power BI
- Power Query
- DAX
- ETL
- Visualização de Dados
- Storytelling com Dados
- Indicadores Logísticos

---

## 🚀 Resultados

O dashboard permite monitorar rapidamente os principais indicadores logísticos, identificar gargalos operacionais e apoiar decisões estratégicas através de análises visuais e interativas.

---

## 👨‍💻 Autor

**Wanderson Oliveira Carneiro**

Estudante de Tecnologia da Informação e Analista de Dados em formação.

### Tecnologias e Áreas de Interesse

- Logística
- Excel
- SQL
- Power BI
- Business Intelligence
- Análise de Dados

### Contato

🔗 LinkedIn:  
https://www.linkedin.com/in/wanderson-oliveira-ti

🔗 GitHub:  
https://github.com/wandersonai
