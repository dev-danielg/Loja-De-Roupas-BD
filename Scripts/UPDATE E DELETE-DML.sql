USE lojaDeRoupa;

-- 01: alterar o telefone do cliente 1
UPDATE Cliente SET telefone = '81999998888' WHERE idCliente = 1;

-- 02: atualizar o email do cliente 2
UPDATE Cliente SET email = 'joao.ramos@novomail.com' WHERE idCliente = 2;

-- 03: atualizar o endereço do cliente 4
UPDATE Cliente SET Endereco_idEndereco = 7 WHERE idCliente = 4;

-- 04: mudar o cargo do funcionário 2
UPDATE Funcionario SET cargo = 'Supervisor de Vendas' WHERE idFuncionario = 2;

-- 05: atualizar o contato do funcionário 4
UPDATE Funcionario SET contato = '31988887777' WHERE idFuncionario = 4;

-- 06: corrigir nome do fornecedor 1
UPDATE Fornecedor SET nome = 'Têxtil Central do Nordeste' WHERE idFornecedor = 1;

-- 07: ajustar o preço do produto 1
UPDATE Produto SET precoProduto = 54.90 WHERE idProduto = 1;

-- 08: aumentar o preço de todos os produtos da marca 'BlueDenim' em 5%
UPDATE Produto SET precoProduto = ROUND(precoProduto * 1.05, 2) WHERE marcaProduto = 'BlueDenim';

-- 09: corrigir cor do produto 9
UPDATE Produto SET corProduto = 'Branco' WHERE idProduto = 9;

-- 10: definir quantidade mínima do estoque 2 como 20
UPDATE Estoque SET quantidadeMinima = 20 WHERE idEstoque = 2;

-- 11: zerar quantidade do estoque 15
UPDATE Estoque SET quantidade = 0 WHERE idEstoque = 15;

-- 12: alterar status de todas as vendas pendentes para 'Concluída'
UPDATE Venda SET status = 'Concluída' WHERE status = 'Pendente';

-- 13: atualizar forma de pagamento da venda 10 para PIX
UPDATE Venda SET FormaPag_IdFormaPag = 3 WHERE IdVenda = 10;

-- 14: alterar desconto da promoção 5 para 30%
UPDATE Promocao SET desconto = 30.00 WHERE idPromocao = 5;

-- 15: deletar cliente 20 (sem vendas registradas)
DELETE FROM Cliente WHERE idCliente = 20 AND idCliente NOT IN (SELECT DISTINCT Cliente_idCliente FROM Venda);

-- 16: deletar produtos com preço menor que 30 reais
DELETE FROM Produto WHERE precoProduto < 30.00;

-- 17: remover registros de estoque com quantidade igual a zero
DELETE FROM Estoque WHERE quantidade = 0;

-- 18: deletar promoções que já expiraram
DELETE FROM Promocao WHERE dataFim < CURDATE();

-- 19: remover itens de venda associados a vendas canceladas
DELETE iv FROM itemVenda iv JOIN Venda v ON iv.Venda_IdVenda = v.IdVenda WHERE v.status = 'Cancelada';

-- 20: excluir fornecedores que nunca fizeram entregas
DELETE f FROM Fornecedor f LEFT JOIN Registro r ON f.idFornecedor = r.Fornecedor_idFornecedor WHERE r.idRegistro IS NULL;
