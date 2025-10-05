USE lojaDeRoupa;

-- 01 - adicionar auditoria em Cliente
ALTER TABLE Cliente
  ADD COLUMN dataCadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ADD COLUMN ativo TINYINT(1) NOT NULL DEFAULT 1;

-- 02 - normalizar tamanhos de telefone/contato
ALTER TABLE Fornecedor MODIFY telefone VARCHAR(30);
ALTER TABLE Cliente    MODIFY telefone VARCHAR(30);
ALTER TABLE Funcionario MODIFY contato VARCHAR(30);

-- 03 - precisão monetária em Produto
ALTER TABLE Produto MODIFY precoProduto DECIMAL(10,2) NOT NULL;

-- 04 - renomear nomeProduto para nome
ALTER TABLE Produto CHANGE nomeProduto nome VARCHAR(255) NOT NULL;

-- 05 - tornar email único em Cliente e Fornecedor
ALTER TABLE Cliente    ADD CONSTRAINT uq_cliente_email UNIQUE (email);
ALTER TABLE Fornecedor ADD CONSTRAINT uq_fornecedor_email UNIQUE (email);

-- 06 - adicionar quantidadeMinima em Estoque
ALTER TABLE Estoque ADD COLUMN quantidadeMinima INT NOT NULL DEFAULT 0;

-- 07 - adicionar descricaoCurta em Produto (substitui criação de índice)
ALTER TABLE Produto ADD COLUMN descricaoCurta VARCHAR(255) NULL;

-- 08 - adicionar observacoes em Registro (substitui adição de FKs)
ALTER TABLE Registro ADD COLUMN observacoes TEXT NULL;

-- 09 - dividir rua: criar ruas separadas (apenas criação das colunas)
ALTER TABLE Endereco
  ADD COLUMN ruaNome VARCHAR(255),
  ADD COLUMN numero VARCHAR(50);

-- 10 - migrar Dataentrega para DATETIME (adiciona coluna) e statusEntrega
ALTER TABLE Registro
  ADD COLUMN dataEntregaHora DATETIME NULL,
  ADD COLUMN statusEntrega VARCHAR(50) NOT NULL DEFAULT 'Pendente';
