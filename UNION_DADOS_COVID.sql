-- Criar a tabela `DADOS_COVID_CONSOLIDADO` para consolidar informações de COVID-19.
-- Esta tabela armazena os dados das unidades federativas, mês, características individuais, e sintomas de pacientes.

CREATE TABLE DADOS_COVID_CONSOLIDADO (
    UNIDADE_FEDERATIVDA INT, -- Código da Unidade Federativa.
    MES INT, -- Mês de ocorrência ou registro.
    IDADE INT, -- Idade do paciente.
    SEXO INT, -- Código do sexo do paciente.
    ESCOLARIDADE INT, -- Código do nível de escolaridade.
    RACA INT, -- Código de cor/raça.
    IDA_ESTABELECIMENTO_SAUDE INT, -- Indicador se o paciente foi a um estabelecimento de saúde.
    FICOU_INTERNADO INT, -- Indicador se o paciente ficou internado.
    FOI_INTUBADO INT, -- Indicador se o paciente foi intubado.
    FEZ_TESTE INT, -- Indicador se o paciente realizou teste para COVID-19.
    TEVE_FEBRE INT, -- Indicador se o paciente apresentou febre.
    TEVE_TOSSE INT, -- Indicador se o paciente apresentou tosse.
    DIFICULDADE_RESPIRAR INT, -- Indicador se o paciente teve dificuldade para respirar.
    DOR_PEITO INT, -- Indicador se o paciente apresentou dor no peito.
    PERDA_CHEIRO_SABOR INT -- Indicador se o paciente perdeu cheiro ou sabor.
);

-- Inserir os dados consolidados provenientes de diferentes tabelas de meses específicos.
-- Os dados das tabelas mensais (COVIDJULHO, COVIDAGOSTO, COVIDSETEMBRO, COVIDOUTUBRO, COVIDNOVEMBRO)
-- são combinados usando a operação `UNION ALL` para evitar duplicatas e consolidar todas as informações.

INSERT INTO DADOS_COVID_CONSOLIDADO (
    UNIDADE_FEDERATIVDA, 
    MES, 
    IDADE, 
    SEXO, 
    ESCOLARIDADE, 
    RACA, 
    IDA_ESTABELECIMENTO_SAUDE, 
    FICOU_INTERNADO, 
    FOI_INTUBADO, 
    FEZ_TESTE, 
    TEVE_FEBRE, 
    TEVE_TOSSE, 
    DIFICULDADE_RESPIRAR, 
    DOR_PEITO, 
    PERDA_CHEIRO_SABOR
)
-- Inserindo dados de COVIDJULHO.
SELECT 
    UF, -- Código da Unidade Federativa.
    V1013, -- Mês de ocorrência.
    A002, -- Idade.
    A003, -- Sexo.
    A005, -- Escolaridade.
    A004, -- Cor/raça.
    B002, -- Indicador de ida ao estabelecimento de saúde.
    B005, -- Indicador de internação.
    B006, -- Indicador de intubação.
    B008, -- Indicador de realização de teste para COVID-19.
    B0011, -- Indicador de febre.
    B0012, -- Indicador de tosse.
    B0014, -- Indicador de dificuldade para respirar.
    B0016, -- Indicador de dor no peito.
    B00111 -- Indicador de perda de cheiro ou sabor.
FROM COVIDJULHO

-- Inserindo dados de COVIDAGOSTO.
UNION ALL
SELECT 
    UF, V1013, A002, A003, A005, A004, B002, B005, B006, B008, B0011, B0012, B0014, B0016, B00111
FROM COVIDAGOSTO

-- Inserindo dados de COVIDSETEMBRO.
UNION ALL
SELECT 
    UF, V1013, A002, A003, A005, A004, B002, B005, B006, B008, B0011, B0012, B0014, B0016, B00111
FROM COVIDSETEMBRO

-- Inserindo dados de COVIDOUTUBRO.
UNION ALL
SELECT 
    UF, V1013, A002, A003, A005, A004, B002, B005, B006, B008, B0011, B0012, B0014, B0016, B00111
FROM COVIDOUTUBRO

-- Inserindo dados de COVIDNOVEMBRO.
UNION ALL
SELECT 
    UF, V1013, A002, A003, A005, A004, B002, B005, B006, B008, B0011, B0012, B0014, B0016, B00111
FROM COVIDNOVEMBRO;

-- Este código cria e popula a tabela consolidada `DADOS_COVID_CONSOLIDADO` com dados de diferentes meses.
-- Isso possibilita análises centralizadas sobre os dados de sintomas, características e ocorrências relacionadas à COVID-19.
