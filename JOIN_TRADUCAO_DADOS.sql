-- Selecionar informações detalhadas de casos consolidados de COVID-19.
-- O objetivo é criar uma tabela temporária (#TEMP_COVID) com os dados detalhados, substituindo códigos por descrições para facilitar a análise.

SELECT 
    dpuf.descricao_uf AS UF, -- Descrição da Unidade Federativa (UF).
    dc.mes AS MES, -- Mês de ocorrência ou registro do caso.
    dc.idade AS IDADE, -- Idade do indivíduo no momento do registro.
    sx.descricao_sexo AS SEXO, -- Descrição do sexo do indivíduo.
    esc.descricao_escola AS ESCOLARIDADE, -- Descrição do nível de escolaridade.
    rc.descricao_raca AS RACA, -- Descrição da cor/raça.
    sn.descricao_sn AS IDA_ESTABELECIMENTO_SAUDE, -- Indicador se a pessoa foi a um estabelecimento de saúde.
    sn1.descricao_sn AS FICOU_INTERNADO, -- Indicador se a pessoa ficou internada.
    sn2.descricao_sn AS FOI_INTUBADO, -- Indicador se a pessoa foi intubada.
    sn3.descricao_sn AS FEZ_TESTE, -- Indicador se a pessoa realizou teste para COVID-19.
    sn4.descricao_sn AS TEVE_FEBRE, -- Indicador se a pessoa teve febre.
    sn5.descricao_sn AS TEVE_TOSSE, -- Indicador se a pessoa apresentou tosse.
    sn6.descricao_sn AS DIFICULDADE_RESPIRAR, -- Indicador se a pessoa teve dificuldade para respirar.
    sn7.descricao_sn AS DOR_PEITO, -- Indicador se a pessoa apresentou dor no peito.
    sn8.descricao_sn AS PERDA_CHEIRO_SABOR -- Indicador se a pessoa perdeu cheiro ou sabor.

-- Inserir os resultados na tabela temporária #TEMP_COVID.
INTO #TEMP_COVID

-- Origem dos dados principais: tabela consolidada de casos de COVID-19.
FROM DADOS_COVID_CONSOLIDADO AS dc

-- Realizar junção à tabela de Unidades Federativas para substituir códigos por descrições.
LEFT JOIN DE_PARA_UF AS dpuf 
    ON dpuf.COD_UF = dc.UNIDADE_FEDERATIVDA

-- Junção à tabela de sexo para obter descrições legíveis.
LEFT JOIN SEXO AS sx 
    ON sx.COD_SEXO = dc.SEXO

-- Junção à tabela de escolaridade para obter descrições dos níveis de instrução.
LEFT JOIN ESCOLARIDADE AS esc 
    ON esc.COD_ESCOL = dc.ESCOLARIDADE

-- Junção à tabela de cor/raça para substituir códigos por descrições.
LEFT JOIN COR_RACA AS rc 
    ON rc.COD_RACA = dc.RACA

-- Realizar várias junções à tabela de respostas SIM_NAO para diferentes variáveis.
LEFT JOIN SIM_NAO AS sn 
    ON sn.COD_SN = dc.IDA_ESTABELECIMENTO_SAUDE
LEFT JOIN SIM_NAO AS sn1 
    ON sn1.COD_SN = dc.FICOU_INTERNADO
LEFT JOIN SIM_NAO AS sn2 
    ON sn2.COD_SN = dc.FOI_INTUBADO
LEFT JOIN SIM_NAO AS sn3 
    ON sn3.COD_SN = dc.FEZ_TESTE
LEFT JOIN SIM_NAO AS sn4 
    ON sn4.COD_SN = dc.TEVE_FEBRE
LEFT JOIN SIM_NAO AS sn5 
    ON sn5.COD_SN = dc.TEVE_TOSSE
LEFT JOIN SIM_NAO AS sn6 
    ON sn6.COD_SN = dc.DIFICULDADE_RESPIRAR
LEFT JOIN SIM_NAO AS sn7 
    ON sn7.COD_SN = dc.DOR_PEITO
LEFT JOIN SIM_NAO AS sn8 
    ON sn8.COD_SN = dc.PERDA_CHEIRO_SABOR;

-- Esse script organiza os dados e prepara uma tabela temporária detalhada para análises mais intuitivas.
