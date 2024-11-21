-- Criar uma tabela para armazenar os códigos e descrições das Unidades Federativas (UFs).
-- Essa tabela serve como um dicionário de dados para identificar as UFs de maneira mais legível em análises e relatórios.
CREATE TABLE DE_PARA_UF (
    COD_UF INT PRIMARY KEY, -- Código único para cada UF.
    DESCRICAO_UF VARCHAR(50) -- Nome ou descrição completa da UF.
);

-- Inserir os valores correspondentes para cada UF na tabela "DE_PARA_UF".
-- Os códigos seguem a nomenclatura padrão do IBGE, enquanto as descrições correspondem aos nomes dos estados.
INSERT INTO DE_PARA_UF (COD_UF, DESCRICAO_UF)
VALUES
(11, 'Rondônia'),
(12, 'Acre'),
(13, 'Amazonas'),
(14, 'Roraima'),
(15, 'Pará'),
(16, 'Amapá'),
(17, 'Tocantins'),
(21, 'Maranhão'),
(22, 'Piauí'),
(23, 'Ceará'),
(24, 'Rio Grande do Norte'),
(25, 'Paraíba'),
(26, 'Pernambuco'),
(27, 'Alagoas'),
(28, 'Sergipe'),
(29, 'Bahia'),
(31, 'Minas Gerais'),
(32, 'Espírito Santo'),
(33, 'Rio de Janeiro'),
(35, 'São Paulo'),
(41, 'Paraná'),
(42, 'Santa Catarina'),
(43, 'Rio Grande do Sul'),
(50, 'Mato Grosso do Sul'),
(51, 'Mato Grosso'),
(52, 'Goiás'),
(53, 'Distrito Federal');

-- Criar uma tabela para armazenar os códigos e descrições das categorias de cor/raça.
-- Essa tabela auxilia na padronização e interpretação dos dados relacionados à variável "cor/raça".
CREATE TABLE COR_RACA (
    COD_RACA INT PRIMARY KEY, -- Código único para cada categoria de cor/raça.
    DESCRICAO_RACA VARCHAR(50) -- Descrição textual da categoria.
);

-- Inserir as categorias e seus respectivos códigos na tabela "COR_RACA".
-- Inclui as categorias padrão usadas em levantamentos oficiais, como IBGE, e opções ignoradas.
INSERT INTO COR_RACA (COD_RACA, DESCRICAO_RACA)
VALUES
(1, 'Branca'),
(2, 'Preta'),
(3, 'Amarela'),
(4, 'Parda'),
(5, 'Indígena'),
(9, 'Ignorado');

-- Criar uma tabela para mapear os códigos de escolaridade com suas descrições.
-- Essa tabela permite análises de variáveis relacionadas ao nível de instrução.
CREATE TABLE ESCOLARIDADE (
    COD_ESCOL INT PRIMARY KEY, -- Código único para cada nível de escolaridade.
    DESCRICAO_ESCOLA VARCHAR(50) -- Descrição textual do nível de escolaridade.
);

-- Inserir as descrições correspondentes para cada nível de escolaridade na tabela "ESCOLARIDADE".
-- As categorias vão desde "Sem instrução" até "Pós-graduação, mestrado ou doutorado".
INSERT INTO ESCOLARIDADE (COD_ESCOL, DESCRICAO_ESCOLA)
VALUES
(1, 'Sem instrução'),
(2, 'Fundamental incompleto'),
(3, 'Fundamental completa'),
(4, 'Médio incompleto'),
(5, 'Médio completo'),
(6, 'Superior incompleto'),
(7, 'Superior completo'),
(8, 'Pós-graduação, mestrado ou doutorado');

-- Criar uma tabela para mapear respostas binárias ou opcionais (Sim/Não/Não sabe/Ignorado).
-- Útil para padronizar respostas de variáveis categóricas binárias ou múltiplas.
CREATE TABLE SIM_NAO (
    COD_SN INT PRIMARY KEY, -- Código único para cada resposta.
    DESCRICAO_SN VARCHAR(20) -- Descrição textual da resposta.
);

-- Inserir os valores padronizados para respostas na tabela "SIM_NAO".
-- Inclui opções comuns como "Sim", "Não", "Não sabe" e "Ignorado".
INSERT INTO SIM_NAO (COD_SN, DESCRICAO_SN)
VALUES
(1, 'Sim'),
(2, 'Não'),
(3, 'Não sabe'),
(9, 'Ignorado');

-- Criar uma tabela para categorizar o sexo das pessoas.
-- Ajuda na análise de dados demográficos, permitindo padronizar as respostas relacionadas ao gênero.
CREATE TABLE SEXO (
    COD_SEXO INT PRIMARY KEY, -- Código único para cada categoria de sexo.
    DESCRICAO_SEXO VARCHAR(15) -- Descrição textual da categoria.
);

-- Inserir as categorias de sexo e seus códigos na tabela "SEXO".
-- Inclui as categorias "Masculino" e "Feminino".
INSERT INTO SEXO (COD_SEXO, DESCRICAO_SEXO)
VALUES
(1, 'Masculino'),
(2, 'Feminino');
