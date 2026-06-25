
# 📦 Projeto 09 – Performance de Entregas (OTIF)

## 📋 Sobre o Projeto

Este projeto foi desenvolvido com foco na análise de desempenho logístico utilizando indicadores de entregas (OTIF - On Time In Full).

O objetivo é monitorar a eficiência das operações de transporte, identificando entregas realizadas dentro do prazo, atrasos e a performance das transportadoras e cidades atendidas.

A análise foi construída no Google Sheets utilizando tabelas dinâmicas, KPIs e gráficos para transformar dados operacionais em informações estratégicas para tomada de decisão.

---

## 🎯 Objetivos

* Monitorar entregas realizadas no prazo
* Identificar entregas atrasadas
* Calcular o indicador OTIF
* Avaliar desempenho por cidade
* Avaliar desempenho por transportadora
* Acompanhar a evolução dos atrasos

---

## 📊 Indicadores (KPIs)

### Total de Pedidos

Quantidade total de entregas analisadas.

### Entregas no Prazo

Quantidade de entregas realizadas dentro da data prometida.

### Entregas Atrasadas

Quantidade de entregas realizadas após a data prometida.

### OTIF (%)

Percentual de entregas realizadas dentro do prazo.

Fórmula:

```excel
=CONT.SE(H:H;"Sim")/CONT.VALORES(A2:A16)
```

---

## 🛠 Ferramentas Utilizadas

* Google Sheets
* Tabelas Dinâmicas
* Fórmulas Avançadas
* Dashboards
* KPIs Logísticos
* Análise de Dados

---

## 📂 Estrutura da Base de Dados

| Campo          |
| -------------- |
| Pedido         |
| Cidade         |
| Transportadora |
| Data Prometida |
| Data Entrega   |
| Status         |
| Dias de Atraso |
| OTIF           |

---

## 📈 Visualizações Desenvolvidas

### Status das Entregas

Gráfico de pizza demonstrando a proporção entre:

* Entregas no Prazo
* Entregas Atrasadas

### Performance por Cidade

Gráfico de barras apresentando a quantidade de pedidos por cidade.

### Performance por Transportadora

Gráfico de barras demonstrando a quantidade de entregas realizadas por cada transportadora.

### Tendência de Atrasos

Gráfico de linha mostrando a evolução dos atrasos ao longo do período analisado.

---

## 📊 Resultados Obtidos

| Indicador          | Resultado |
| ------------------ | --------- |
| Total de Pedidos   | 15        |
| Entregas no Prazo  | 9         |
| Entregas Atrasadas | 6         |
| OTIF               | 60%       |

---

## 💡 Principais Insights

* 60% das entregas foram realizadas dentro do prazo.
* 40% das entregas apresentaram atraso.
* Algumas cidades concentraram maior volume de pedidos.
* O monitoramento contínuo permite identificar gargalos operacionais.
* O indicador OTIF auxilia na avaliação da eficiência logística.

---

## 📸 Dashboard

Adicionar aqui a imagem do dashboard:


![Dashboard OTIF]()

---

## 🚀 Competências Demonstradas

* Análise de Dados
* Logística
* Business Intelligence
* Indicadores de Performance
* Dashboards Gerenciais
* Excel Avançado
* Google Sheets
* Tomada de Decisão Baseada em Dados

---

## 👨‍💻 Autor

**Wanderson Oliveira Carneiro**

Estudante de Tecnologia da Informação com foco em:

* Análise de Dados
* Business Intelligence
* Logística
* SQL
* Power BI
* Excel

GitHub:
https://github.com/wandersonai

LinkedIn:
https://www.linkedin.com

---

#Portfolio #Logistica #DataAnalytics #BusinessIntelligence #Excel #GoogleSheets #Dashboard #OTIF #SupplyChain #DataDriven
