-- Criar uma tabela para armazenar os c�digos e descri��es das Unidades Federativas (UFs).
-- Essa tabela serve como um dicion�rio de dados para identificar as UFs de maneira mais leg�vel em an�lises e relat�rios.
CREATE TABLE DE_PARA_UF (
    COD_UF INT PRIMARY KEY, -- C�digo �nico para cada UF.
    DESCRICAO_UF VARCHAR(50) -- Nome ou descri��o completa da UF.
);

-- Inserir os valores correspondentes para cada UF na tabela "DE_PARA_UF".
-- Os c�digos seguem a nomenclatura padr�o do IBGE, enquanto as descri��es correspondem aos nomes dos estados.
INSERT INTO DE_PARA_UF (COD_UF, DESCRICAO_UF)
VALUES
(11, 'Rond�nia'),
(12, 'Acre'),
(13, 'Amazonas'),
(14, 'Roraima'),
(15, 'Par�'),
(16, 'Amap�'),
(17, 'Tocantins'),
(21, 'Maranh�o'),
(22, 'Piau�'),
(23, 'Cear�'),
(24, 'Rio Grande do Norte'),
(25, 'Para�ba'),
(26, 'Pernambuco'),
(27, 'Alagoas'),
(28, 'Sergipe'),
(29, 'Bahia'),
(31, 'Minas Gerais'),
(32, 'Esp�rito Santo'),
(33, 'Rio de Janeiro'),
(35, 'S�o Paulo'),
(41, 'Paran�'),
(42, 'Santa Catarina'),
(43, 'Rio Grande do Sul'),
(50, 'Mato Grosso do Sul'),
(51, 'Mato Grosso'),
(52, 'Goi�s'),
(53, 'Distrito Federal');

-- Criar uma tabela para armazenar os c�digos e descri��es das categorias de cor/ra�a.
-- Essa tabela auxilia na padroniza��o e interpreta��o dos dados relacionados � vari�vel "cor/ra�a".
CREATE TABLE COR_RACA (
    COD_RACA INT PRIMARY KEY, -- C�digo �nico para cada categoria de cor/ra�a.
    DESCRICAO_RACA VARCHAR(50) -- Descri��o textual da categoria.
);

-- Inserir as categorias e seus respectivos c�digos na tabela "COR_RACA".
-- Inclui as categorias padr�o usadas em levantamentos oficiais, como IBGE, e op��es ignoradas.
INSERT INTO COR_RACA (COD_RACA, DESCRICAO_RACA)
VALUES
(1, 'Branca'),
(2, 'Preta'),
(3, 'Amarela'),
(4, 'Parda'),
(5, 'Ind�gena'),
(9, 'Ignorado');

-- Criar uma tabela para mapear os c�digos de escolaridade com suas descri��es.
-- Essa tabela permite an�lises de vari�veis relacionadas ao n�vel de instru��o.
CREATE TABLE ESCOLARIDADE (
    COD_ESCOL INT PRIMARY KEY, -- C�digo �nico para cada n�vel de escolaridade.
    DESCRICAO_ESCOLA VARCHAR(50) -- Descri��o textual do n�vel de escolaridade.
);

-- Inserir as descri��es correspondentes para cada n�vel de escolaridade na tabela "ESCOLARIDADE".
-- As categorias v�o desde "Sem instru��o" at� "P�s-gradua��o, mestrado ou doutorado".
INSERT INTO ESCOLARIDADE (COD_ESCOL, DESCRICAO_ESCOLA)
VALUES
(1, 'Sem instru��o'),
(2, 'Fundamental incompleto'),
(3, 'Fundamental completa'),
(4, 'M�dio incompleto'),
(5, 'M�dio completo'),
(6, 'Superior incompleto'),
(7, 'Superior completo'),
(8, 'P�s-gradua��o, mestrado ou doutorado');

-- Criar uma tabela para mapear respostas bin�rias ou opcionais (Sim/N�o/N�o sabe/Ignorado).
-- �til para padronizar respostas de vari�veis categ�ricas bin�rias ou m�ltiplas.
CREATE TABLE SIM_NAO (
    COD_SN INT PRIMARY KEY, -- C�digo �nico para cada resposta.
    DESCRICAO_SN VARCHAR(20) -- Descri��o textual da resposta.
);

-- Inserir os valores padronizados para respostas na tabela "SIM_NAO".
-- Inclui op��es comuns como "Sim", "N�o", "N�o sabe" e "Ignorado".
INSERT INTO SIM_NAO (COD_SN, DESCRICAO_SN)
VALUES
(1, 'Sim'),
(2, 'N�o'),
(3, 'N�o sabe'),
(9, 'Ignorado');

-- Criar uma tabela para categorizar o sexo das pessoas.
-- Ajuda na an�lise de dados demogr�ficos, permitindo padronizar as respostas relacionadas ao g�nero.
CREATE TABLE SEXO (
    COD_SEXO INT PRIMARY KEY, -- C�digo �nico para cada categoria de sexo.
    DESCRICAO_SEXO VARCHAR(15) -- Descri��o textual da categoria.
);

-- Inserir as categorias de sexo e seus c�digos na tabela "SEXO".
-- Inclui as categorias "Masculino" e "Feminino".
INSERT INTO SEXO (COD_SEXO, DESCRICAO_SEXO)
VALUES
(1, 'Masculino'),
(2, 'Feminino');
