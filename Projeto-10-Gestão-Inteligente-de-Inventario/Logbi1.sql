-- ESTRUTURA (Criação do Banco e Tabelas)
DROP DATABASE IF EXISTS logbi;
CREATE DATABASE logbi;
USE logbi;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL
);

CREATE TABLE fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_fornecedor VARCHAR(100) NOT NULL,
    cidade VARCHAR(100),
    estado CHAR(2)
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    id_categoria INT,
    id_fornecedor INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

CREATE TABLE estoque (
    id_produto INT PRIMARY KEY,
    quantidade_atual INT NOT NULL DEFAULT 0,
    ponto_critico INT NOT NULL DEFAULT 10,
    localizacao_corredor VARCHAR(50),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) ON DELETE CASCADE
);

CREATE TABLE movimentacoes (
    id_movimentacao INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    tipo_movimentacao ENUM('ENTRADA', 'SAÍDA') NOT NULL,
    quantidade INT NOT NULL,
    data_movimentacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);



-- CARGA DE DADOS (Populando o Banco)

-- 1. Categorias
INSERT INTO categorias (nome_categoria) VALUES 
('Alimentos Perecíveis'), ('Alimentos Não Perecíveis'), ('Bebidas Analcoólicas'), 
('Bebidas Alcoólicas'), ('Higiene Pessoal'), ('Limpeza Doméstica'), 
('Bazar e Utilidades'), ('Hortifrúti (Fresco)'), ('Laticínios e Frios'), ('Eletroportáteis');

-- 2. Fornecedores
INSERT INTO fornecedores (nome_fornecedor, cidade, estado) VALUES 
('Ambev S.A.', 'São Paulo', 'SP'), ('Nestlé Brasil Ltda', 'Ribeirão Preto', 'SP'), 
('M. Dias Branco S.A.', 'Eusébio', 'CE'), ('Unilever Brasil', 'Anchieta', 'ES'), 
('Procter & Gamble (P&G)', 'Manaus', 'AM'), ('BRF S.A. (Sadia/Perdigão)', 'Chapecó', 'SC'), 
('JBS S.A. (Friboi)', 'Campo Grande', 'MS'), ('Coca-Cola FEMSA', 'Belo Horizonte', 'MG'), 
('Laticínios Belo Vale', 'Governador Valadares', 'MG'), ('Mondelēz International', 'Curitiba', 'PR'), 
('Monde Vita Alimentos', 'Goiânia', 'GO'), ('Distribuidora Nordeste', 'Recife', 'PE'), 
('Comercial Logística MA', 'Imperatriz', 'MA'), ('Hortifrúti Vale do Rio', 'Juazeiro', 'BA'), 
('Limpeza Total Indústria', 'Duque de Caxias', 'RJ'), ('Bazar Conexão S.A.', 'Guarulhos', 'SP'), 
('Eletro Alfa Indústria', 'Joinville', 'SC'), ('Frios e Cia Distribuição', 'Belém', 'PA'), 
('Polpa Norte Frutas', 'Capanema', 'PR'), ('Serra Geral Bebidas', 'Caxias do Sul', 'RS');

-- 3. Produtos (100 itens)
INSERT INTO produtos (nome_produto, id_categoria, id_fornecedor, preco_unitario) VALUES 
('Arroz Integral Prato Fino 1kg', 1, 3, 7.50), ('Feijão Carioca Camil 1kg', 1, 3, 8.90),
('Macarrão Espaguete Adria 500g', 1, 3, 4.20), ('Óleo de Soja Liza 900ml', 1, 11, 6.80),
('Açúcar Refinado Caravelas 1kg', 1, 11, 4.50), ('Sal Refinado Cisne 1kg', 1, 11, 2.90),
('Café Torrado Solúvel Nestlé 200g', 1, 2, 14.50), ('Leite Condensado Moça 395g', 1, 2, 6.20),
('Creme de Leite Nestlé 200g', 1, 2, 3.80), ('Chocolate em Pó Solúvel 400g', 1, 2, 12.90),
('Biscoito Recheado Oreo 90g', 2, 10, 3.50), ('Biscoito Club Social Original 144g', 2, 10, 5.20),
('Caixa de Bombom Lacta Grandes Sucessos', 2, 10, 11.90), ('Barra de Chocolate Milka Ao Leite 100g', 2, 10, 9.90),
('Maionese Hellmanns Suprema 500g', 2, 4, 8.50), ('Catchup Hellmanns Tradicional 400g', 2, 4, 7.20),
('Molho de Tomate Pomarola 340g', 2, 12, 3.40), ('Sardinha em Óleo Coqueiro 125g', 2, 12, 4.90),
('Atum Ralado em Óleo Coqueiro 170g', 2, 12, 7.80), ('Farinha de Trigo Dona Benta 1kg', 2, 3, 5.50),
('Coca-Cola Original 2L', 3, 8, 8.99), ('Coca-Cola Sem Açúcar 2L', 3, 8, 8.99),
('Refrigerante Guaraná Antarctica 2L', 3, 1, 7.49), ('Refrigerante Fanta Laranja 2L', 3, 8, 7.99),
('Refrigerante Sprite Lima-Limão 2L', 3, 8, 7.99), ('Água Mineral Sem Gás Crystal 500ml', 3, 8, 2.00),
('Água Mineral Com Gás Crystal 500ml', 3, 8, 2.50), ('Suco de Laranja Integral Prats 900ml', 3, 12, 11.90),
('Suco de Uva Integral Aurora 1.5L', 3, 20, 16.50), ('Néctar de Frutas Del Valle Uva 1L', 3, 8, 6.50),
('Cerveja Skol Latão 473ml', 4, 1, 3.89), ('Cerveja Brahma Duplo Malte Latão 473ml', 4, 1, 4.49),
('Cerveja Heineken Long Neck 330ml', 4, 12, 6.20), ('Cerveja Budweiser Lata 350ml', 4, 1, 3.75),
('Cerveja Stella Artois Long Neck 330ml', 4, 1, 5.99), ('Vinho Tinto Suave Quinta do Morgado 750ml', 4, 20, 14.90),
('Vinho Tinto Seco Reservado Concha y Toro', 4, 12, 34.90), ('Vodka Smirnoff No. 21 998ml', 4, 12, 39.90),
('Whisky Johnnie Walker Red Label 1L', 4, 12, 99.90), ('Gin Tanqueray London Dry 750ml', 4, 12, 119.00),
('Sabonete em Barra Dove Original 90g', 5, 4, 3.49), ('Sabonete Líquido Rexona Antibacteriano 250ml', 5, 4, 8.90),
('Shampoo Pantene Restauração 400ml', 5, 5, 18.50), ('Condicionador Pantene Restauração 400ml', 5, 5, 21.90),
('Desodorante Aerossol Rexona Clinical 150ml', 5, 4, 15.90), ('Creme Dental Colgate Total 12 90g', 5, 12, 6.50),
('Enxaguante Bucal Listerine Cool Mint 500ml', 5, 12, 19.90), ('Fralda Pampers Confort Sec G 60 Unidades', 5, 5, 64.90),
('Lenços Umedecidos Pampers 48 Unidades', 5, 5, 11.50), ('Papel Higiênico Neve Folha Dupla 12 Rolos', 5, 12, 17.80),
('Sabão em Pó Omo Lavagem Perfeita 1.6kg', 6, 4, 19.90), ('Lava Roupas Líquido Omo Proteção 3L', 6, 4, 39.90),
('Amaciante de Roupas Comfort Concentrado 1L', 6, 4, 16.50), ('Detergente Líquido Ypê Neutro 500ml', 6, 15, 2.40),
('Desinfetante Pinho Sol Original 1.75L', 6, 12, 13.90), ('Limpador Multiuso Veja Original 500ml', 6, 12, 4.50),
('Água Sanitária Ypê 2L', 6, 15, 5.90), ('Esponja de Aço Assolan C/ 8 Unidades', 6, 15, 2.80),
('Pedra Sanitária Glade Lavanda 25g', 6, 12, 3.20), ('Inseticida Raid Aerossol Multi 450ml', 6, 12, 12.90),
('Conjunto de Panelas Tramontina 5 Peças', 7, 16, 159.90), ('Frigideira Antiaderente Tramontina 24cm', 7, 16, 45.00),
('Jogo de Pratos Duralex C/ 6 Unidades', 7, 16, 39.90), ('Conjunto de Copos de Vidro C/ 6 Unidades', 7, 16, 19.90),
('Faca do Chef Tramontina Professional', 7, 16, 34.90), ('Garrafa Térmica Invicta 1L', 7, 16, 29.90),
('Vassoura de Nylon Noviça Sem Cabo', 7, 15, 12.50), ('Rodo de Plástico Sanremo 40cm', 7, 15, 9.90),
('Pano de Prato Algodão Estampado', 7, 13, 3.50), ('Caixa Organizadora de Plástico 30L', 7, 16, 49.90),
('Banana Prata Kg', 8, 14, 5.90), ('Maçã Gala Nacional Kg', 8, 14, 9.80),
('Laranja Pêra Sacola 5kg', 8, 14, 14.50), ('Batata Monalisa Kg', 8, 14, 6.90),
('Cebola Nacional Kg', 8, 14, 5.50), ('Tomate Italiano Kg', 8, 14, 8.90),
('Alho Roxo Cento', 8, 14, 25.00), ('Uva Sem Semente Vitória 500g', 8, 19, 7.90),
('Morango Inteiro Congelado Poupa Norte 1kg', 8, 19, 18.90), ('Polpa de Acerola Poupa Norte 1kg', 8, 19, 12.50),
('Queijo Mussarela Fatiado Três Marias 500g', 9, 18, 22.90), ('Presunto Cozido Fatiado Sadia 500g', 9, 6, 19.50),
('Manteiga Com Sal Aviação 200g', 9, 9, 11.90), ('Requeijão Cremoso Nestlé 200g', 9, 2, 7.50),
('Iogurte Grego Danone Tradicional 400g', 9, 18, 8.90), ('Queijo Coalho Tradicional Kg', 9, 9, 42.00),
('Salame Tipo Italiano Seara Fatiado 100g', 9, 7, 8.90), ('Margarina Claybom Com Sal 500g', 9, 6, 6.20),
('Leite UHT Integral Piracanjuba 1L', 9, 18, 4.99), ('Bacon em Cubos Seara 200g', 9, 7, 9.50),
('Fritadeira Elétrica Airfryer Mondial 4L', 10, 17, 349.90), ('Liquidificador Mondial Turbo 1200W', 10, 17, 139.90),
('Batedeira Planetária Arno 5L', 10, 17, 429.00), ('Ferro de Passar a Vapor Black+Decker', 10, 17, 89.90),
('Sanduicheira e Minigrill Britânia', 10, 17, 79.90), ('Cafeteira Elétrica Dolce Gusto Arno', 10, 17, 499.00),
('Chaleira Elétrica Inox Mondial 1.7L', 10, 17, 69.90), ('Micro-ondas Consul 20L Prata', 10, 17, 549.00),
('Aspirador de Pó Vertical Philco 2 em 1', 10, 17, 149.90), ('Ventilador de Mesa Arno Silence Force 40cm', 10, 17, 199.90);

-- 4. Estoque Inicial baseado nos produtos criados
INSERT INTO estoque (id_produto, quantidade_atual, ponto_critico, localizacao_corredor)
SELECT 
    id_produto,
    FLOOR(10 + (RAND() * 150)) AS quantidade_atual,
    CASE WHEN preco_unitario > 100 THEN 5 ELSE 15 END AS ponto_critico,
    CONCAT('CORREDOR ', CHAR(65 + FLOOR(RAND() * 6)), '-', FLOOR(1 + RAND() * 10)) AS localizacao_corredor
FROM produtos;

-- 5. Histórico de Movimentações (Entradas e Saídas)
INSERT INTO movimentacoes (id_produto, tipo_movimentacao, quantidade, data_movimentacao)
SELECT id_produto, 'ENTRADA', quantidade_atual + 20, DATE_SUB(NOW(), INTERVAL FLOOR(1 + RAND() * 30) DAY)
FROM estoque;

INSERT INTO movimentacoes (id_produto, tipo_movimentacao, quantidade, data_movimentacao)
SELECT id_produto, 'SAÍDA', FLOOR(1 + (RAND() * 15)), DATE_SUB(NOW(), INTERVAL FLOOR(1 + RAND() * 15) DAY)
FROM estoque LIMIT 50;






USE logbi;

-- QUERY 1: Diagnóstico de Ruptura e Alerta de Compra (Visão Gerencial)
SELECT 
    p.id_produto,
    p.nome_produto,
    c.nome_categoria,
    e.quantidade_atual,
    e.ponto_critico,
    e.localizacao_corredor,
    CASE 
        WHEN e.quantidade_atual = 0 THEN 'RUPTURA CRÍTICA'
        WHEN e.quantidade_atual <= e.ponto_critico THEN 'ALERTA DE RECOMPRA'
        ELSE 'ESTOQUE NORMAL'
    END AS status_estoque
FROM produtos p
INNER JOIN categorias c ON p.id_categoria = c.id_categoria
INNER JOIN estoque e ON p.id_produto = e.id_produto
ORDER BY e.quantidade_atual ASC
LIMIT 15;








USE logbi;

-- QUERY 2: Valor Total do Inventário por Categoria (Visão Financeira)
SELECT 
    c.nome_categoria,
    COUNT(p.id_produto) AS total_produtos_cadastrados,
    SUM(e.quantidade_atual) AS quantidade_total_pecas,
    CONCAT('R$ ', FORMAT(SUM(e.quantidade_atual * p.preco_unitario), 2, 'pt_BR')) AS valor_total_em_estoque,
    ROUND(AVG(p.preco_unitario), 2) AS preco_medio_produto
FROM produtos p
INNER JOIN categorias c ON p.id_categoria = c.id_categoria
INNER JOIN estoque e ON p.id_produto = e.id_produto
GROUP BY c.nome_categoria
ORDER BY SUM(e.quantidade_atual * p.preco_unitario) DESC;


-- QUERY 3: Balanço de Fluxo Logístico (Entradas vs Saídas)
SELECT 
    c.nome_categoria,
    m.tipo_movimentacao,
    SUM(m.quantidade) AS total_unidades_movimentadas,
    COUNT(m.id_movimentacao) AS total_operacoes
FROM movimentacoes m
INNER JOIN produtos p ON m.id_produto = p.id_produto
INNER JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.nome_categoria, m.tipo_movimentacao
ORDER BY c.nome_categoria ASC, total_unidades_movimentadas DESC;






SHOW TABLES;

SELECT COUNT(*) FROM produtos;

SELECT COUNT(*) FROM movimentacoes;



USE logbi;

-- VIEW 1: vw_estoque_critico
-- Objetivo no Power BI: Alimentar cartões de alerta e tabelas de compras.

CREATE OR REPLACE VIEW vw_estoque_critico AS
SELECT 
    p.id_produto,
    p.nome_produto,
    c.nome_categoria,
    e.quantidade_atual,
    e.ponto_critico,
    e.localizacao_corredor,
    CASE 
        WHEN e.quantidade_atual = 0 THEN 'RUPTURA CRÍTICA'
        WHEN e.quantidade_atual <= e.ponto_critico THEN 'ALERTA DE RECOMPRA'
        ELSE 'ESTOQUE NORMAL'
    END AS status_estoque
FROM produtos p
INNER JOIN categorias c ON p.id_categoria = c.id_categoria
INNER JOIN estoque e ON p.id_produto = e.id_produto;



-- VIEW 2: vw_valor_inventario
-- Objetivo no Power BI: Alimentar gráficos de pizza/barras de Capital Parado e KPIs Financeiros.

CREATE OR REPLACE VIEW vw_valor_inventario AS
SELECT 
    c.nome_categoria,
    COUNT(p.id_produto) AS total_produtos_cadastrados,
    SUM(e.quantidade_atual) AS quantidade_total_pecas,
    SUM(e.quantidade_atual * p.preco_unitario) AS valor_total_em_estoque_num, -- Versão numérica pura para o Power BI calcular
    CONCAT('R$ ', FORMAT(SUM(e.quantidade_atual * p.preco_unitario), 2, 'pt_BR')) AS valor_total_em_estoque_formatado,
    ROUND(AVG(p.preco_unitario), 2) AS preco_medio_produto
FROM produtos p
INNER JOIN categorias c ON p.id_categoria = c.id_categoria
INNER JOIN estoque e ON p.id_produto = e.id_produto
GROUP BY c.nome_categoria;



-- VIEW 3: vw_movimentacoes
-- Objetivo no Power BI: Funcionar como nossa "Tabela Fato", gerando gráficos de linha de fluxo temporal.

CREATE OR REPLACE VIEW vw_movimentacoes AS
SELECT 
    m.id_movimentacao,
    p.nome_produto,
    c.nome_categoria,
    f.nome_fornecedor,
    m.tipo_movimentacao,
    m.quantidade,
    m.data_movimentacao
FROM movimentacoes m
INNER JOIN produtos p ON m.id_produto = p.id_produto
INNER JOIN categorias c ON p.id_categoria = c.id_categoria
INNER JOIN fornecedores f ON p.id_fornecedor = f.id_fornecedor;







SELECT * FROM vw_estoque_critico WHERE status_estoque = 'ALERTA DE RECOMPRA';