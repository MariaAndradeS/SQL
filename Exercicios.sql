CREATE DATABASE ChatGPT;
USE ChatGPT;

CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    cidade VARCHAR(50),
    idade INT
);

INSERT INTO clientes (id, nome, cidade, idade)
VALUES
    (1, 'João', 'São Paulo', 35),
    (2, 'Maria', 'Rio de Janeiro', 28),
    (3, 'Pedro', 'Belo Horizonte', 22),
    (4, 'Ana', 'São Paulo', 42),
    (5, 'Lucas', 'Belo Horizonte', 32);
    
CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    valor DECIMAL(10, 2)
);

INSERT INTO pedidos (id, cliente_id, data_pedido, valor)
VALUES
    (1, 1, '2023-09-01', 100.00),
    (2, 2, '2023-09-02', 150.00),
    (3, 1, '2023-09-03', 200.00),
    (4, 3, '2023-09-04', 75.00),
    (5, 2, '2023-09-05', 120.00);

CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    categoria VARCHAR(50),
    preco DECIMAL(10, 2)
);

INSERT INTO produtos (id, nome, categoria, preco)
VALUES
    (1, 'Camiseta', 'Vestuário', 25.00),
    (2, 'Tênis', 'Calçados', 80.00),
    (3, 'Celular', 'Eletrônicos', 500.00),
    (4, 'Livro', 'Livraria', 30.00),
    (5, 'Mochila', 'Acessórios', 40.00);

-- Exercicio 1: Selecione o nome e a idade de todos os clientes de São Paulo.
SELECT nome, idade FROM clientes WHERE cidade = "São Paulo";

-- Exercício 2: Selecione o nome e a data do pedido para todos os pedidos feitos por clientes com menos de 30 anos.
SELECT clientes.nome, pedidos.data_pedido FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
WHERE idade < 30;

-- Exercício 3: Selecione o nome e o preço dos produtos da categoria "Eletrônicos".
SELECT nome, preco FROM produtos WHERE categoria = "Eletrônicos";

-- Exercício 4: Selecione o nome e o valor total dos pedidos para cada cliente.
SELECT clientes.nome, SUM(pedidos.valor) AS valor_total_pedidos FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.nome;

-- Exercício 5: Selecione o nome do cliente, a data do pedido e o valor do pedido para todos os pedidos feitos por clientes de São Paulo.
SELECT clientes.nome, pedidos.data_pedido, pedidos.valor FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
WHERE cidade = "São Paulo";

-- Exercício 6: Selecione o nome dos clientes que fizeram pelo menos 3 pedidos.
SELECT clientes.nome,  SUM(clientes.id) AS quantidade_pedidos FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
WHERE clientes.id >= 3;

-- Exercício 7: Selecione o nome do produto mais caro em cada categoria.
SELECT categoria, produto_mais_caro
FROM (
    SELECT categoria, nome AS produto_mais_caro, preco,
           RANK() OVER (PARTITION BY categoria ORDER BY preco DESC) AS ranking
    FROM produtos
) ranked
WHERE ranking = 1;

-- Exercício 8: Selecione o nome dos produtos que foram vendidos mais de uma vez.

-- Exercício 9: Selecione o nome dos clientes que fizeram pedidos em todas as categorias de produtos.

-- Exercício 10: Selecione o nome dos clientes que têm a mesma idade que pelo menos um outro cliente.

-- Exercício 11: Selecione o nome do cliente e o nome do produto para cada pedido feito, juntando as tabelas clientes, pedidos e produtos.

-- Exercício 12: Selecione o nome do cliente, a data do pedido e o valor do pedido para todos os pedidos feitos, juntando as tabelas clientes e pedidos.

-- Exercício 13: Selecione o nome do cliente, o nome do produto e a data do pedido para cada pedido feito por clientes de São Paulo, juntando as tabelas clientes, pedidos e produtos.

-- Exercício 14: Selecione o nome do produto e a quantidade total vendida desse produto, juntando as tabelas produtos e detalhes_pedidos.

-- Exercício 15: Selecione o nome do cliente e o valor total gasto por cada cliente em pedidos, juntando as tabelas clientes, pedidos e detalhes_pedidos.