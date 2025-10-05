USE lojaDeRoupa;

-- 01: Produtos com estoque disponível
SELECT
  Produto.idProduto "ID",
  Produto.nome "Produto",
  Estoque.quantidade "Quantidade"
FROM Produto
JOIN Estoque ON Produto.idProduto = Estoque.Produto_idProduto
WHERE Estoque.quantidade > 0;

-- 02: Quantidade total vendida por produto
SELECT
  Produto.idProduto "ID",
  Produto.nome "Produto",
  SUM(itemVenda.quantidade) "Quantidade total vendida"
FROM itemVenda
JOIN Produto ON itemVenda.Produto_idProduto = Produto.idProduto
GROUP BY Produto.idProduto, Produto.nome;

-- 03: Clientes que nunca compraram
SELECT
  Cliente.idCliente "ID",
  Cliente.nomeCliente "Cliente",
  Cliente.email "Email"
FROM Cliente
LEFT JOIN Venda ON Cliente.idCliente = Venda.Cliente_idCliente
WHERE Venda.IdVenda IS NULL;

-- 04: Vendas pendentes com o nome do cliente
SELECT
  Venda.IdVenda "ID da venda",
  Venda.dataVenda "Data da venda",
  Cliente.nomeCliente "Nome do cliente"
FROM Venda
JOIN Cliente ON Venda.Cliente_idCliente = Cliente.idCliente
WHERE Venda.status = 'Pendente';

-- 05: Quantidade recebida por fornecedor
SELECT
  Fornecedor.idFornecedor "ID Fornecedor",
  Fornecedor.nome "Fornecedor",
  COALESCE(SUM(Registro.Quantidade), 0) "Quantidade total recebida"
FROM Fornecedor
LEFT JOIN Registro ON Fornecedor.idFornecedor = Registro.Fornecedor_idFornecedor
GROUP BY Fornecedor.idFornecedor, Fornecedor.nome;

-- 06: Produtos que já foram vendidos
SELECT
  Produto.idProduto "ID",
  Produto.nome "Produto"
FROM Produto
WHERE Produto.idProduto IN (
  SELECT itemVenda.Produto_idProduto FROM itemVenda
);

-- 07: Promoções e número de itens vendidos por promoção
SELECT
  Promocao.idPromocao "ID Promo",
  Promocao.nome "Promoção",
  COALESCE(COUNT(itemVenda.Produto_idProduto), 0) "Itens vendidos"
FROM Promocao
LEFT JOIN itemVenda ON Promocao.idPromocao = itemVenda.Promocao_idPromocao
GROUP BY Promocao.idPromocao, Promocao.nome;

-- 08: Quantidade de vendas por forma de pagamento
SELECT
  FormaPag.IdFormaPag "ID Forma",
  FormaPag.Tipo "Forma de pagamento",
  COALESCE(COUNT(Venda.IdVenda), 0) "Quantidade de vendas"
FROM FormaPag
LEFT JOIN Venda ON FormaPag.IdFormaPag = Venda.FormaPag_IdFormaPag
GROUP BY FormaPag.IdFormaPag, FormaPag.Tipo;

-- 09: Produtos sem estoque (sem registro em Estoque ou estoque zero)
SELECT
  Produto.idProduto "ID",
  Produto.nome "Produto",
  COALESCE(Estoque.quantidade, 0) "Estoque"
FROM Produto
LEFT JOIN Estoque ON Produto.idProduto = Estoque.Produto_idProduto
WHERE COALESCE(Estoque.quantidade, 0) = 0
ORDER BY Produto.idProduto;

-- 10: Total gasto por cada cliente (subselect por cliente)
SELECT
  Cliente.idCliente "ID",
  Cliente.nomeCliente "Cliente",
  COALESCE(
    (SELECT SUM(itemVenda.valorTotal)
     FROM Venda
     JOIN itemVenda ON Venda.IdVenda = itemVenda.Venda_IdVenda
     WHERE Venda.Cliente_idCliente = Cliente.idCliente), 0
  ) "Total gasto"
FROM Cliente;

-- 11: Vendas cujo total (soma de itens) é maior que R$200
SELECT
  Venda.IdVenda "ID da venda",
  Venda.dataVenda "Data da venda",
  SUM(itemVenda.valorTotal) "Total da venda"
FROM Venda
JOIN itemVenda ON Venda.IdVenda = itemVenda.Venda_IdVenda
GROUP BY Venda.IdVenda, Venda.dataVenda
HAVING SUM(itemVenda.valorTotal) > 200;

-- 12: Produtos nunca vendidos
SELECT
  Produto.idProduto "ID",
  Produto.nome "Produto"
FROM Produto
LEFT JOIN itemVenda ON Produto.idProduto = itemVenda.Produto_idProduto
WHERE itemVenda.Produto_idProduto IS NULL;

-- 13: Top 5 produtos por receita
SELECT
  Produto.idProduto "ID",
  Produto.nome "Produto",
  SUM(itemVenda.valorTotal) "Receita total"
FROM itemVenda
JOIN Produto ON itemVenda.Produto_idProduto = Produto.idProduto
GROUP BY Produto.idProduto, Produto.nome
ORDER BY SUM(itemVenda.valorTotal) DESC
LIMIT 5;

-- 14: Última compra por cliente (data)
SELECT
  Cliente.idCliente "ID",
  Cliente.nomeCliente "Cliente",
  (SELECT MAX(Venda.dataVenda) FROM Venda WHERE Venda.Cliente_idCliente = Cliente.idCliente) "Data da última compra"
FROM Cliente;

-- 15: Gasto médio por pedido de cada cliente (total gasto / número de pedidos)
SELECT
  Cliente.idCliente "ID",
  Cliente.nomeCliente "Cliente",
  COALESCE(
    (SELECT ROUND(SUM(itemVenda.valorTotal) / COUNT(DISTINCT Venda.IdVenda), 2)
     FROM Venda
     JOIN itemVenda ON Venda.IdVenda = itemVenda.Venda_IdVenda
     WHERE Venda.Cliente_idCliente = Cliente.idCliente), 0
  ) "Gasto médio por pedido"
FROM Cliente;

-- 16: Produtos com estoque > 0 e total vendido
SELECT
  Produto.idProduto "ID",
  Produto.nome "Produto",
  COALESCE((SELECT SUM(itemVenda.quantidade) FROM itemVenda WHERE itemVenda.Produto_idProduto = Produto.idProduto), 0) "Total vendido",
  COALESCE((SELECT Estoque.quantidade FROM Estoque WHERE Estoque.Produto_idProduto = Produto.idProduto LIMIT 1), 0) "Estoque atual"
FROM Produto
WHERE COALESCE((SELECT Estoque.quantidade FROM Estoque WHERE Estoque.Produto_idProduto = Produto.idProduto LIMIT 1), 0) > 0
ORDER BY "Total vendido" DESC;

-- 17: Últimas 10 vendas com nome do cliente, número de itens e total
SELECT
  Venda.IdVenda "ID da venda",
  Venda.dataVenda "Data da venda",
  Cliente.nomeCliente "Cliente",
  COUNT(itemVenda.Produto_idProduto) "Quantidade de itens",
  SUM(itemVenda.valorTotal) "Total da venda"
FROM Venda
JOIN Cliente ON Venda.Cliente_idCliente = Cliente.idCliente
JOIN itemVenda ON Venda.IdVenda = itemVenda.Venda_IdVenda
GROUP BY Venda.IdVenda, Venda.dataVenda, Cliente.nomeCliente
ORDER BY Venda.dataVenda DESC
LIMIT 10;

-- 18: Produtos que tiveram vendas com promoção ativa hoje
SELECT DISTINCT
  Produto.idProduto "ID",
  Produto.nome "Produto",
  Promocao.idPromocao "ID Promo",
  Promocao.nome "Promoção"
FROM itemVenda
JOIN Produto ON itemVenda.Produto_idProduto = Produto.idProduto
JOIN Promocao ON itemVenda.Promocao_idPromocao = Promocao.idPromocao
WHERE CURDATE() BETWEEN Promocao.dataInicio AND Promocao.dataFim
ORDER BY Produto.nome;

-- 19: Total entregue por mês (últimos 12 meses)
SELECT
  YEAR(Registro.Dataentrega) "Ano",
  MONTH(Registro.Dataentrega) "Mês",
  SUM(Registro.Quantidade) "Quantidade total entregue"
FROM Registro
WHERE Registro.Dataentrega >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY YEAR(Registro.Dataentrega), MONTH(Registro.Dataentrega)
ORDER BY "Ano" DESC, "Mês" DESC;

-- 20: Produtos com receita total e custo total de entrega
SELECT
  Produto.idProduto "ID",
  Produto.nome "Produto",
  COALESCE((SELECT SUM(itemVenda.valorTotal) FROM itemVenda WHERE itemVenda.Produto_idProduto = Produto.idProduto), 0) "Receita total vendida",
  COALESCE((SELECT SUM(Registro.CustoEntrega) FROM Registro WHERE Registro.Produto_idProduto = Produto.idProduto), 0) "Custo total entrega"
FROM Produto
WHERE COALESCE((SELECT SUM(itemVenda.valorTotal) FROM itemVenda WHERE itemVenda.Produto_idProduto = Produto.idProduto), 0) > 0
ORDER BY "Receita total vendida" DESC;