-- Criar a tabela `DADOS_COVID_CONSOLIDADO` para consolidar informa��es de COVID-19.
-- Esta tabela armazena os dados das unidades federativas, m�s, caracter�sticas individuais, e sintomas de pacientes.

CREATE TABLE DADOS_COVID_CONSOLIDADO (
    UNIDADE_FEDERATIVDA INT, -- C�digo da Unidade Federativa.
    MES INT, -- M�s de ocorr�ncia ou registro.
    IDADE INT, -- Idade do paciente.
    SEXO INT, -- C�digo do sexo do paciente.
    ESCOLARIDADE INT, -- C�digo do n�vel de escolaridade.
    RACA INT, -- C�digo de cor/ra�a.
    IDA_ESTABELECIMENTO_SAUDE INT, -- Indicador se o paciente foi a um estabelecimento de sa�de.
    FICOU_INTERNADO INT, -- Indicador se o paciente ficou internado.
    FOI_INTUBADO INT, -- Indicador se o paciente foi intubado.
    FEZ_TESTE INT, -- Indicador se o paciente realizou teste para COVID-19.
    TEVE_FEBRE INT, -- Indicador se o paciente apresentou febre.
    TEVE_TOSSE INT, -- Indicador se o paciente apresentou tosse.
    DIFICULDADE_RESPIRAR INT, -- Indicador se o paciente teve dificuldade para respirar.
    DOR_PEITO INT, -- Indicador se o paciente apresentou dor no peito.
    PERDA_CHEIRO_SABOR INT -- Indicador se o paciente perdeu cheiro ou sabor.
);

-- Inserir os dados consolidados provenientes de diferentes tabelas de meses espec�ficos.
-- Os dados das tabelas mensais (COVIDJULHO, COVIDAGOSTO, COVIDSETEMBRO, COVIDOUTUBRO, COVIDNOVEMBRO)
-- s�o combinados usando a opera��o `UNION ALL` para evitar duplicatas e consolidar todas as informa��es.

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
    UF, -- C�digo da Unidade Federativa.
    V1013, -- M�s de ocorr�ncia.
    A002, -- Idade.
    A003, -- Sexo.
    A005, -- Escolaridade.
    A004, -- Cor/ra�a.
    B002, -- Indicador de ida ao estabelecimento de sa�de.
    B005, -- Indicador de interna��o.
    B006, -- Indicador de intuba��o.
    B008, -- Indicador de realiza��o de teste para COVID-19.
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

-- Este c�digo cria e popula a tabela consolidada `DADOS_COVID_CONSOLIDADO` com dados de diferentes meses.
-- Isso possibilita an�lises centralizadas sobre os dados de sintomas, caracter�sticas e ocorr�ncias relacionadas � COVID-19.
