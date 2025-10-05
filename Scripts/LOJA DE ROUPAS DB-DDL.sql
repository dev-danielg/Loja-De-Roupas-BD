-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lojaDeRoupa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lojaDeRoupa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lojaDeRoupa` DEFAULT CHARACTER SET utf8 ;
USE `lojaDeRoupa` ;

-- -----------------------------------------------------
-- Table `lojaDeRoupa`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(30) NOT NULL,
  `cidade` VARCHAR(75) NOT NULL,
  `bairro` VARCHAR(75) NOT NULL,
  `rua` VARCHAR(100) NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`idEndereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojaDeRoupa`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `telefone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  INDEX `fk_Fornecedor_Endereco1_idx` (`Endereco_idEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_Fornecedor_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `lojaDeRoupa`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojaDeRoupa`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `contato` VARCHAR(20) NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  INDEX `fk_Funcionario_Endereco1_idx` (`Endereco_idEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionario_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `lojaDeRoupa`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojaDeRoupa`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nomeCliente` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_Endereco1_idx` (`Endereco_idEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `lojaDeRoupa`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojaDeRoupa`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(100) NOT NULL,
  `descricaoProduto` VARCHAR(250) NULL,
  `precoProduto` DECIMAL(7,2) ZEROFILL NOT NULL,
  `tamanhoProduto` CHAR(1) NOT NULL,
  `marcaProduto` VARCHAR(45) NOT NULL,
  `corProduto` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojaDeRoupa`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Estoque` (
  `idEstoque` INT NOT NULL AUTO_INCREMENT,
  `quantidade` INT NOT NULL,
  `dataEntrada` DATE NOT NULL,
  `dataSaida` DATE NOT NULL,
  PRIMARY KEY (`idEstoque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojaDeRoupa`.`Promocao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Promocao` (
  `idPromocao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `dataInicio` DATE NOT NULL,
  `dataFim` DATE NOT NULL,
  `tipo` ENUM("Dinheiro", "Porcentagem") NOT NULL,
  `desconto` DECIMAL(7,2) NOT NULL,
  `descricao` VARCHAR(250) NULL,
  PRIMARY KEY (`idPromocao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojaDeRoupa`.`FormaPag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`FormaPag` (
  `IdFormaPag` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  `ValorPago` INT NOT NULL,
  `QtdParcelas` INT NOT NULL,
  PRIMARY KEY (`IdFormaPag`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojaDeRoupa`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Venda` (
  `IdVenda` INT NOT NULL AUTO_INCREMENT,
  `dataVenda` DATE NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `Funcionario_idFuncionario` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `FormaPag_IdFormaPag` INT NOT NULL,
  PRIMARY KEY (`IdVenda`),
  INDEX `fk_Venda_Funcionario1_idx` (`Funcionario_idFuncionario` ASC) VISIBLE,
  INDEX `fk_Venda_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Venda_FormaPag1_idx` (`FormaPag_IdFormaPag` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `lojaDeRoupa`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `lojaDeRoupa`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_FormaPag1`
    FOREIGN KEY (`FormaPag_IdFormaPag`)
    REFERENCES `lojaDeRoupa`.`FormaPag` (`IdFormaPag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojaDeRoupa`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojaDeRoupa`.`produtoEstoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`produtoEstoque` (
  `Produto_idProduto` INT NOT NULL,
  `Estoque_idEstoque` INT NOT NULL,
  PRIMARY KEY (`Estoque_idEstoque`, `Produto_idProduto`),
  INDEX `fk_Produto_has_Estoque_Estoque1_idx` (`Estoque_idEstoque` ASC) VISIBLE,
  INDEX `fk_Produto_has_Estoque_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Estoque_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `lojaDeRoupa`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Estoque_Estoque1`
    FOREIGN KEY (`Estoque_idEstoque`)
    REFERENCES `lojaDeRoupa`.`Estoque` (`idEstoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojaDeRoupa`.`Registro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`Registro` (
  `idRegistro` INT NOT NULL AUTO_INCREMENT,
  `Fornecedor_idFornecedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `CustoEntrega` DECIMAL(7,2) NOT NULL,
  `Quantidade` INT NOT NULL,
  `Dataentrega` DATE NOT NULL,
  PRIMARY KEY (`idRegistro`, `Fornecedor_idFornecedor`, `Produto_idProduto`),
  INDEX `fk_Registro_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Registro_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `lojaDeRoupa`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `lojaDeRoupa`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojaDeRoupa`.`produtoCategoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`produtoCategoria` (
  `Produto_idProduto` INT NOT NULL,
  `Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Categoria_idCategoria`),
  INDEX `fk_Produto_has_Categoria_Categoria1_idx` (`Categoria_idCategoria` ASC) VISIBLE,
  INDEX `fk_Produto_has_Categoria_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Categoria_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `lojaDeRoupa`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Categoria_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `lojaDeRoupa`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojaDeRoupa`.`itemVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojaDeRoupa`.`itemVenda` (
  `Produto_idProduto` INT NOT NULL,
  `Venda_IdVenda` INT NOT NULL,
  `valorTotal` DECIMAL(7,2) NOT NULL,
  `quantidade` INT NOT NULL,
  `Promocao_idPromocao` INT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Venda_IdVenda`),
  INDEX `fk_itemVenda_Promocao1_idx` (`Promocao_idPromocao` ASC) VISIBLE,
  INDEX `fk_itemVenda_Venda1_idx` (`Venda_IdVenda` ASC) VISIBLE,
  CONSTRAINT `fk_itemVenda_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `lojaDeRoupa`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itemVenda_Promocao1`
    FOREIGN KEY (`Promocao_idPromocao`)
    REFERENCES `lojaDeRoupa`.`Promocao` (`idPromocao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itemVenda_Venda1`
    FOREIGN KEY (`Venda_IdVenda`)
    REFERENCES `lojaDeRoupa`.`Venda` (`IdVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
