CREATE VIEW ProdutosVendidos as
SELECT
  Produto.idProduto "ID",
  Produto.nome "Produto"
FROM Produto
WHERE Produto.idProduto IN (
  SELECT itemVenda.Produto_idProduto FROM itemVenda
);


CREATE VIEW FormaPagVendas as
SELECT
  FormaPag.IdFormaPag "ID Forma",
  FormaPag.Tipo "Forma de pagamento",
  COALESCE(COUNT(Venda.IdVenda), 0) "Quantidade de vendas"
FROM FormaPag
LEFT JOIN Venda ON FormaPag.IdFormaPag = Venda.FormaPag_IdFormaPag
GROUP BY FormaPag.IdFormaPag, FormaPag.Tipo;


CREATE VIEW ClienteGastoTotal AS
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


CREATE VIEW ProdutoTotalCusto AS
SELECT
  Produto.idProduto "ID",
  Produto.nome "Produto",
  COALESCE((SELECT SUM(itemVenda.valorTotal) FROM itemVenda WHERE itemVenda.Produto_idProduto = Produto.idProduto), 0) "Receita total vendida",
  COALESCE((SELECT SUM(Registro.CustoEntrega) FROM Registro WHERE Registro.Produto_idProduto = Produto.idProduto), 0) "Custo total entrega"
FROM Produto
WHERE COALESCE((SELECT SUM(itemVenda.valorTotal) FROM itemVenda WHERE itemVenda.Produto_idProduto = Produto.idProduto), 0) > 0
ORDER BY "Receita total vendida" DESC;


CREATE VIEW ClienteGastoMedio AS
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


CREATE VIEW PromocaoAtivaHoje AS
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


CREATE VIEW ClienteUltimaCompra AS
SELECT
  Cliente.idCliente "ID",
  Cliente.nomeCliente "Cliente",
  (SELECT MAX(Venda.dataVenda) FROM Venda WHERE Venda.Cliente_idCliente = Cliente.idCliente) "Data da última compra"
FROM Cliente;


CREATE VIEW ProdutosSemEstoque AS
SELECT
  Produto.idProduto "ID",
  Produto.nome "Produto",
  COALESCE(Estoque.quantidade, 0) "Estoque"
FROM Produto
LEFT JOIN Estoque ON Produto.idProduto = Estoque.Produto_idProduto
WHERE COALESCE(Estoque.quantidade, 0) = 0
ORDER BY Produto.idProduto;


CREATE VIEW ProdutosJaVendidos AS
SELECT
  Produto.idProduto "ID",
  Produto.nome "Produto"
FROM Produto
WHERE Produto.idProduto IN (
  SELECT itemVenda.Produto_idProduto FROM itemVenda
);


CREATE VIEW VendasPendentes AS
SELECT
  Venda.IdVenda "ID da venda",
  Venda.dataVenda "Data da venda",
  Cliente.nomeCliente "Nome do cliente"
FROM Venda
JOIN Cliente ON Venda.Cliente_idCliente = Cliente.idCliente
WHERE Venda.status = 'Pendente';