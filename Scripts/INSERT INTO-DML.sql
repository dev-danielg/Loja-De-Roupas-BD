USE `lojaDeRoupa`;
SET FOREIGN_KEY_CHECKS = 0;

-- 1) 20 Endereços
INSERT INTO `Endereco` (`idEndereco`,`estado`,`cidade`,`bairro`,`rua`,`cep`) VALUES
(1,'PE','Recife','Boa Viagem','Av. Boa Viagem, 1000','51020-020'),
(2,'SP','São Paulo','Pinheiros','R. dos Pinheiros, 234','05422-010'),
(3,'RJ','Rio de Janeiro','Copacabana','Av. Atlântica, 1500','22010-000'),
(4,'MG','Belo Horizonte','Savassi','R. Paraíba, 850','30140-010'),
(5,'BA','Salvador','Barra','R. das Flores, 12','40140-110'),
(6,'CE','Fortaleza','Meireles','Av. Beira Mar, 2000','60165-121'),
(7,'RS','Porto Alegre','Moinhos de Vento','R. Padre Chagas, 500','90430-003'),
(8,'PR','Curitiba','Batel','Av. do Batel, 900','80420-090'),
(9,'DF','Brasília','Asa Sul','CLS 102, Bloco B','70297-400'),
(10,'PE','Olinda','Varadouro','R. do Farol, 45','53300-000'),
(11,'SP','Campinas','Cambuí','R. Coronel Silva Teles, 120','13025-000'),
(12,'RJ','Niterói','Icaraí','Av. Roberto Silveira, 300','24220-001'),
(13,'MG','Uberlândia','Center','Av. Afonso Pena, 1100','38400-200'),
(14,'PA','Belém','Marambaia','R. dos Caripunas, 88','66063-120'),
(15,'RN','Natal','Ponta Negra','Av. Eng. Roberto Freire, 1500','59090-000'),
(16,'GO','Goiânia','Setor Bueno','Av. T-63, 700','74223-040'),
(17,'MA','São Luís','Calhau','Av. Daniel de La Touche, 500','65074-020'),
(18,'SC','Florianópolis','Centro','R. Felipe Schmidt, 250','88010-330'),
(19,'PB','João Pessoa','Tambaú','Av. Boa Viagem, 900','58039-000'),
(20,'PI','Teresina','Noivos','R. Barão do Guarita, 10','64000-000');

-- 2) 20 Fornecedores
INSERT INTO `Fornecedor` (`idFornecedor`,`telefone`,`email`,`nome`,`Endereco_idEndereco`) VALUES
(1,'81998765432','textilcentral@fornecedor.com','Textil Central Ltda',1),
(2,'11976543210','modasul@fornecedor.com','ModaSul Importações',2),
(3,'21988771122','mar@fornecedorrj.com','RioFashion SA',3),
(4,'31999887766','bhfabrica@fornecedor.com','Fábrica Mineira',4),
(5,'71991112233','bahia@textil.com','Bahia Tecidos',5),
(6,'85998223344','forte@fornecedor.com','Fortaleza Textil',6),
(7,'51997774455','porto@fornecedor.com','Gaúcha Moda',7),
(8,'41996665566','curti@fornecedor.com','Curitiba Confecções',8),
(9,'61995556677','bras@fornecedor.com','Brasília Atacadista',9),
(10,'81994447788','olinda@fornecedor.com','Olinda Vestuário',10),
(11,'19993338899','campinas@fornecedor.com','Campinas Fashion',11),
(12,'21992229900','niteroi@fornecedor.com','Niterói Tecidos',12),
(13,'34991111010','ub@fornecedor.com','Triângulo Textile',13),
(14,'91990001112','belem@fornecedor.com','Belém Moda',14),
(15,'84989991213','natal@fornecedor.com','Natal Shoes',15),
(16,'62988881314','goiania@fornecedor.com','Goiânia Imports',16),
(17,'9898771415','saoluis@fornecedor.com','São Luís Atelier',17),
(18,'48986661516','floripa@fornecedor.com','Ilha Fashion',18),
(19,'83985551617','jp@fornecedor.com','Tambaú Traders',19),
(20,'86984441718','teresina@fornecedor.com','Piaui Textil',20);

-- 3) 20 Funcionários
INSERT INTO `Funcionario` (`idFuncionario`,`nome`,`cargo`,`contato`,`Endereco_idEndereco`) VALUES
(1,'Mariana Silva','Gerente','81999112233',3),
(2,'Carlos Pereira','Atendente','31988776655',4),
(3,'Fernanda Gomes','Caixa','11977665544',2),
(4,'Lucas Almeida','Estoquista','41976554433',8),
(5,'Paula Santos','Vendedora','71975443322',5),
(6,'Renato Costa','Supervisor','85974332211',6),
(7,'Bianca Rocha','Atendente','51973221100',7),
(8,'Mateus Freitas','Vendedor','61972110099',9),
(9,'Luiza Martins','Gerente de RH','19971009988',11),
(10,'Thiago Barros','Analista','21970998877',12),
(11,'Patrícia Lima','Caixa','34969887766',13),
(12,'Rafael Nunes','Estoquista','91968776655',14),
(13,'Sofia Duarte','Vendedora','84967665544',15),
(14,'André Melo','Supervisor','62966554433',16),
(15,'Carla Farias','Atendente','98965443322',17),
(16,'Bruno Serpa','Vendedor','48964332211',18),
(17,'Marcos Vinicius','Gerente de Loja','83963221100',19),
(18,'Adriana Pires','Caixa','86962110099',20),
(19,'Diego Torres','Vendedor','81961009988',1),
(20,'Natália Ribeiro','Atendente','11960998877',10);

-- 4) 20 Clientes
INSERT INTO `Cliente` (`idCliente`,`nomeCliente`,`email`,`telefone`,`Endereco_idEndereco`) VALUES
(1,'Ana Costa','ana.costa@email.com','81912345678',1),
(2,'João Ramos','joao.ramos@email.com','11934567890',2),
(3,'Marcos Silva','marcos.silva@email.com','21945678901',3),
(4,'Juliana Alves','juliana.alves@email.com','31956789012',4),
(5,'Roberto Souza','roberto.souza@email.com','71967890123',5),
(6,'Isabela Moreira','isabela.moreira@email.com','85978901234',6),
(7,'Felipe Araújo','felipe.araujo@email.com','51989012345',7),
(8,'Caroline Dias','caroline.dias@email.com','41990123456',8),
(9,'Rafaela Pinto','rafaela.pinto@email.com','61901234567',9),
(10,'Gustavo Henrique','gustavo.henrique@email.com','81912340000',10),
(11,'Larissa Teixeira','larissa.tx@email.com','19923456789',11),
(12,'Eduardo Nogueira','edu.nogueira@email.com','21934561234',12),
(13,'Vanessa Rocha','vanessa.rocha@email.com','34945672345',13),
(14,'Igor Fernandes','igor.fernandes@email.com','91956783456',14),
(15,'Monica Castro','monica.castro@email.com','84967894567',15),
(16,'Paulo Henrique','paulo.henrique@email.com','62978905678',16),
(17,'Bruna Lopes','bruna.lopes@email.com','98989016789',17),
(18,'Leandro Mota','leandro.mota@email.com','48990127890',18),
(19,'Renata Alves','renata.alves@email.com','83901238901',19),
(20,'Vitor Ramos','vitor.ramos@email.com','86912349012',20);

-- 5) 20 Categorias
INSERT INTO `Categoria` (`idCategoria`,`tipo`) VALUES
(1,'Masculina'),(2,'Feminina'),(3,'Infantil'),(4,'Acessório'),(5,'Calçado'),
(6,'Esporte'),(7,'Praia'),(8,'Festa'),(9,'Casual'),(10,'Formal'),
(11,'Inverno'),(12,'Verão'),(13,'Unissex'),(14,'Jeans'),(15,'Esportivo'),
(16,'Plus Size'),(17,'Lingerie'),(18,'Baby'),(19,'Noite'),(20,'Outdoor');

-- 6) 20 Produtos
INSERT INTO `Produto` (`idProduto`,`nomeProduto`,`descricaoProduto`,`precoProduto`,`tamanhoProduto`,`marcaProduto`,`corProduto`) VALUES
(1,'Camiseta Básica','Camiseta 100% algodão, malha leve',49.90,'M','EssencialWear','Branco'),
(2,'Calça Jeans Slim','Calça jeans skinny, elastano',129.90,'G','BlueDenim','Azul'),
(3,'Jaqueta Parka','Parka com forro, resistente à chuva',249.90,'G','NorthEdge','Verde'),
(4,'Vestido Floral','Vestido curto em viscose',159.90,'P','Floratta','Amarelo'),
(5,'Tênis Runner','Tênis esportivo, sola EVA',199.90,'U','RunFast','Preto'),
(6,'Short Praia','Short leve com estampa',69.90,'M','BeachCo','Colorido'),
(7,'Blusa de Frio','Suéter acrílico, gola alta',119.90,'G','WarmUp','Cinza'),
(8,'Saia Midi','Saia plissada em poliéster',89.90,'P','Elegance','Rosa'),
(9,'Camisa Social','Camisa algodão slim fit',139.90,'M','OfficeLine','Branco'),
(10,'Bota Couro','Bota cano médio em couro',329.90,'G','LeatherCraft','Marrom'),
(11,'Regata Fitness','Regata dry-fit para treino',39.90,'M','ProMove','Preto'),
(12,'Macacão Jeans','Macacão em jeans confortável',189.90,'G','DenimLab','Azul'),
(13,'Chinelo Slide','Slide borracha com logo',59.90,'U','SlidePro','Preto'),
(14,'Blazer Casual','Blazer leve para uso diário',219.90,'M','UrbanFit','Azul Marinho'),
(15,'Top Esportivo','Top com suporte médio',69.90,'P','ActiveWear','Roxo'),
(16,'Calça Moletom','Moletom confortável com elástico',99.90,'G','Comfy','Cinza'),
(17,'Vestido Longo','Vestido longo estampado',179.90,'M','SummerVibe','Verde'),
(18,'Gorro Tricot','Gorro em lã sintética',29.90,'U','KnitStyle','Bordô'),
(19,'Meia Esportiva','Par de meias com amortecimento',19.90,'U','SportSox','Branco'),
(20,'Bolsa Tiracolo','Bolsa pequena para uso diário',149.90,'U','CarryAll','Preto');

-- 7) 20 Estoques  
INSERT INTO `Estoque` (`idEstoque`,`quantidade`,`dataEntrada`,`dataSaida`,`Produto_idProduto`) VALUES
(1,50,'2025-01-10','2026-01-10',1),
(2,120,'2025-02-15','2026-02-15',2),
(3,30,'2025-03-01','2026-03-01',3),
(4,40,'2025-03-10','2026-03-10',4),
(5,80,'2025-01-20','2026-01-20',5),
(6,150,'2025-04-05','2026-04-05',6),
(7,60,'2025-05-11','2026-05-11',7),
(8,25,'2025-06-22','2026-06-22',8),
(9,70,'2025-07-03','2026-07-03',9),
(10,15,'2025-08-14','2026-08-14',10),
(11,200,'2025-01-05','2026-01-05',11),
(12,18,'2025-02-28','2026-02-28',12),
(13,90,'2025-03-15','2026-03-15',13),
(14,55,'2025-04-20','2026-04-20',14),
(15,33,'2025-05-30','2026-05-30',15),
(16,77,'2025-06-01','2026-06-01',16),
(17,44,'2025-07-10','2026-07-10',17),
(18,66,'2025-08-01','2026-08-01',18),
(19,88,'2025-09-12','2026-09-12',19),
(20,99,'2025-10-01','2026-10-01',20);

-- 8) produtoEstoque removido (modelo alterado) -- não inserir

-- 9) 20 Promoções
INSERT INTO `Promocao` (`idPromocao`,`nome`,`dataInicio`,`dataFim`,`tipo`,`desconto`,`descricao`) VALUES
(1,'Promo Verão','2025-01-01','2025-02-28','Porcentagem',10.00,'Desconto de verão'),
(2,'Black Week','2025-11-20','2025-11-30','Porcentagem',20.00,'Descontos gerais'),
(3,'Liquidação Inverno','2025-07-01','2025-07-31','Porcentagem',30.00,'Queima de estoque inverno'),
(4,'Cupom 10','2025-03-01','2025-03-31','Dinheiro',10.00,'Cupom fixo R$10'),
(5,'Comprou3 levou1','2025-05-01','2025-05-31','Porcentagem',25.00,'Oferta especial'),
(6,'Promo Outlet','2025-06-01','2025-06-15','Porcentagem',35.00,'Outlet'),
(7,'Aniversário Loja','2025-09-10','2025-09-20','Porcentagem',15.00,'Promo aniversario'),
(8,'Festival de Sapatos','2025-10-01','2025-10-10','Porcentagem',12.50,'Promo calçados'),
(9,'Desconto Estudante','2025-04-01','2025-04-30','Porcentagem',5.00,'Estudantes com ID'),
(10,'Cartão Parceiro','2025-02-01','2025-02-28','Dinheiro',20.00,'Desconto com parceiro'),
(11,'Mega Oferta','2025-12-01','2025-12-31','Porcentagem',40.00,'Festa de fim de ano'),
(12,'Promo Social','2025-08-01','2025-08-15','Porcentagem',8.00,'Oferta redes sociais'),
(13,'Combo Família','2025-03-15','2025-04-15','Dinheiro',50.00,'Desconto por combo'),
(14,'Semana da Moda','2025-05-10','2025-05-17','Porcentagem',18.00,'Semana da moda'),
(15,'Outlet Especial','2025-06-20','2025-06-30','Porcentagem',22.00,'Outlet especial'),
(16,'Promo Noite','2025-07-20','2025-07-25','Porcentagem',14.00,'Promoção noturna'),
(17,'Desconto VIP','2025-09-01','2025-09-30','Porcentagem',16.00,'Clientes VIP'),
(18,'Amigo Indica','2025-11-01','2025-11-30','Dinheiro',25.00,'Indicação premiada'),
(19,'Flash Sale','2025-10-15','2025-10-16','Porcentagem',50.00,'Oferta relâmpago'),
(20,'Promo Final','2025-12-20','2025-12-31','Porcentagem',30.00,'Final de ano');

-- 10) 20 Formas de Pagamento
INSERT INTO `FormaPag` (`IdFormaPag`,`Tipo`,`ValorPago`,`QtdParcelas`) VALUES
(1,'Cartão de Crédito',1,6),
(2,'Boleto',0,1),
(3,'PIX',1,1),
(4,'Cartão Débito',1,1),
(5,'Transferência',1,1),
(6,'Cashback',0,1),
(7,'Cartão Loja',1,12),
(8,'Parcelado',1,10),
(9,'Vale Presente',0,1),
(10,'Paypal',1,3),
(11,'Apple Pay',1,1),
(12,'Google Pay',1,1),
(13,'Cheque',0,1),
(14,'Cartão Corporativo',1,6),
(15,'Voucher',0,1),
(16,'PayLater',1,12),
(17,'Débito Automático',1,3),
(18,'Transferência Internacional',1,1),
(19,'Boleto Fácil',0,1),
(20,'PIX Parcelado',1,4);

-- 11) 20 Vendas
INSERT INTO `Venda` (`IdVenda`,`dataVenda`,`status`,`Funcionario_idFuncionario`,`Cliente_idCliente`,`FormaPag_IdFormaPag`) VALUES
(1,'2025-01-11','Concluída',1,1,1),
(2,'2025-02-18','Concluída',2,2,2),
(3,'2025-03-05','Pendente',3,3,3),
(4,'2025-03-12','Concluída',4,4,4),
(5,'2025-04-20','Concluída',5,5,5),
(6,'2025-05-06','Cancelada',6,6,6),
(7,'2025-06-15','Concluída',7,7,7),
(8,'2025-07-22','Concluída',8,8,8),
(9,'2025-08-03','Pendente',9,9,9),
(10,'2025-08-25','Concluída',10,10,10),
(11,'2025-09-01','Concluída',11,11,11),
(12,'2025-09-10','Concluída',12,12,12),
(13,'2025-10-05','Pendente',13,13,13),
(14,'2025-10-10','Concluída',14,14,14),
(15,'2025-11-11','Concluída',15,15,15),
(16,'2025-11-20','Concluída',16,16,16),
(17,'2025-12-01','Pendente',17,17,17),
(18,'2025-12-15','Concluída',18,18,18),
(19,'2025-12-24','Concluída',19,19,19),
(20,'2025-12-31','Concluída',20,20,20);

-- 12) 20 itemVenda
INSERT INTO `itemVenda` (`Produto_idProduto`,`Venda_IdVenda`,`valorTotal`,`quantidade`,`Promocao_idPromocao`) VALUES
(1,1,99.80,2,1),
(2,2,129.90,1,NULL),
(3,3,499.80,2,3),
(4,4,159.90,1,NULL),
(5,5,399.80,2,5),
(6,6,139.80,2,NULL),
(7,7,119.90,1,6),
(8,7,179.80,2,6),
(9,8,279.80,2,NULL),
(10,9,329.90,1,8),
(11,10,79.80,2,NULL),
(12,11,189.90,1,11),
(13,12,59.90,1,12),
(14,13,119.80,2,NULL),
(15,14,219.90,1,14),
(16,15,209.70,3,15),
(17,16,99.90,1,NULL),
(18,17,179.90,1,17),
(19,18,29.90,1,NULL),
(20,19,39.80,2,NULL);

-- 13) 20 Registros (entrada de mercadorias)
INSERT INTO `Registro` (`idRegistro`,`Fornecedor_idFornecedor`,`Produto_idProduto`,`CustoEntrega`,`Quantidade`,`Dataentrega`) VALUES
(1,1,1,150.00,50,'2025-01-09'),
(2,2,2,200.00,120,'2025-02-14'),
(3,3,3,300.00,30,'2025-03-02'),
(4,4,4,80.00,40,'2025-03-09'),
(5,5,5,180.00,80,'2025-01-19'),
(6,6,6,220.00,150,'2025-04-04'),
(7,7,7,95.00,60,'2025-05-10'),
(8,8,8,45.00,25,'2025-06-21'),
(9,9,9,140.00,70,'2025-07-02'),
(10,10,10,250.00,15,'2025-08-13'),
(11,11,11,60.00,200,'2025-01-04'),
(12,12,12,170.00,18,'2025-02-27'),
(13,13,13,30.00,90,'2025-03-14'),
(14,14,14,110.00,55,'2025-04-19'),
(15,15,15,70.00,33,'2025-05-29'),
(16,16,16,120.00,77,'2025-06-02'),
(17,17,17,150.00,44,'2025-07-09'),
(18,18,18,40.00,66,'2025-08-02'),
(19,19,19,20.00,88,'2025-09-11'),
(20,20,20,95.00,99,'2025-10-01');

-- 14) 20 produtoCategoria
INSERT INTO `produtoCategoria` (`Produto_idProduto`,`Categoria_idCategoria`) VALUES
(1,9),(2,14),(3,11),(4,12),(5,6),
(6,7),(7,11),(8,2),(9,10),(10,5),
(11,15),(12,14),(13,5),(14,9),(15,6),
(16,9),(17,12),(18,11),(19,6),(20,4);

SET FOREIGN_KEY_CHECKS = 1;