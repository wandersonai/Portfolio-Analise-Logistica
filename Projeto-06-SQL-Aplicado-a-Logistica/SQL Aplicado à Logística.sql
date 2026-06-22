USE logistica_db;

-- Limpa os dados antigos para não duplicar se rodar de novo
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE entregas;
TRUNCATE TABLE transportadoras;
SET FOREIGN_KEY_CHECKS = 1;

-- Inserir os dados limpos (3 transportadoras)
INSERT INTO transportadoras (id, nome, cidade) VALUES
(1, 'Rápido Express', 'São Paulo'),
(2, 'LogMais', 'Rio de Janeiro'),
(3, 'Carga Brasil', 'Belo Horizonte');

-- Inserir os dados limpos (5 entregas originais)
INSERT INTO entregas (transportadora_id, destino, distancia_km, custo, status, data_saida) VALUES
(1, 'Campinas', 100, 250.00, 'Entregue', '2024-06-01'),
(1, 'Santos', 80, 200.00, 'Em trânsito', '2024-06-02'),
(2, 'Niterói', 50, 180.00, 'Entregue', '2024-06-03'),
(2, 'Petrópolis', 120, 300.00, 'Entregue', '2024-06-04'),
(3, 'Uberlândia', 500, 900.00, 'Em trânsito', '2024-06-05');



-- Query 1: Juntar as tabelas e ver o relatório completo
SELECT 
    e.id AS Cod_Entrega,
    t.nome AS Transportadora,
    e.destino AS Destino,
    e.distancia_km AS KM,
    e.custo AS Custo_Frete,
    e.status AS Status_Entrega
FROM entregas e
JOIN transportadoras t ON e.transportadora_id = t.id;



-- Query 2: Total gasto e média de custo por transportadora
SELECT 
    t.nome AS Transportadora,
    COUNT(e.id) AS Qtd_Entregas,
    SUM(e.custo) AS Custo_Total,
    ROUND(AVG(e.custo), 2) AS Media_Por_Entrega
FROM entregas e
JOIN transportadoras t ON e.transportadora_id = t.id
GROUP BY t.nome;



-- Query 3: Ranking de entregas mais distantes (Logística pura)
SELECT * FROM entregas 
ORDER BY distancia_km DESC;



-- 1. Métrica de Custo por KM por entrega
SELECT 
    e.id AS Cod_Entrega,
    t.nome AS Transportadora,
    e.destino AS Destino,
    e.distancia_km AS KM,
    e.custo AS Custo_Total,
    ROUND(e.custo / e.distancia_km, 2) AS Custo_Por_KM
FROM entregas e
JOIN transportadoras t ON e.transportadora_id = t.id
ORDER BY Custo_Por_KM DESC;



-- 2. Classificação de frete usando CASE WHEN (Inteligência de Negócio)
SELECT 
    id AS Cod_Entrega,
    destino AS Destino,
    custo AS Custo_Frete,
    CASE 
        WHEN custo >= 500.00 THEN 'Custo Alto (Gargalo)'
        WHEN custo BETWEEN 200.00 AND 499.99 THEN 'Custo Médio'
        ELSE 'Custo Baixo (Otimizado)'
    END AS Classificacao_Custo
FROM entregas;