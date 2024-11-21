-- Selecionar informa��es detalhadas de casos consolidados de COVID-19.
-- O objetivo � criar uma tabela tempor�ria (#TEMP_COVID) com os dados detalhados, substituindo c�digos por descri��es para facilitar a an�lise.

SELECT 
    dpuf.descricao_uf AS UF, -- Descri��o da Unidade Federativa (UF).
    dc.mes AS MES, -- M�s de ocorr�ncia ou registro do caso.
    dc.idade AS IDADE, -- Idade do indiv�duo no momento do registro.
    sx.descricao_sexo AS SEXO, -- Descri��o do sexo do indiv�duo.
    esc.descricao_escola AS ESCOLARIDADE, -- Descri��o do n�vel de escolaridade.
    rc.descricao_raca AS RACA, -- Descri��o da cor/ra�a.
    sn.descricao_sn AS IDA_ESTABELECIMENTO_SAUDE, -- Indicador se a pessoa foi a um estabelecimento de sa�de.
    sn1.descricao_sn AS FICOU_INTERNADO, -- Indicador se a pessoa ficou internada.
    sn2.descricao_sn AS FOI_INTUBADO, -- Indicador se a pessoa foi intubada.
    sn3.descricao_sn AS FEZ_TESTE, -- Indicador se a pessoa realizou teste para COVID-19.
    sn4.descricao_sn AS TEVE_FEBRE, -- Indicador se a pessoa teve febre.
    sn5.descricao_sn AS TEVE_TOSSE, -- Indicador se a pessoa apresentou tosse.
    sn6.descricao_sn AS DIFICULDADE_RESPIRAR, -- Indicador se a pessoa teve dificuldade para respirar.
    sn7.descricao_sn AS DOR_PEITO, -- Indicador se a pessoa apresentou dor no peito.
    sn8.descricao_sn AS PERDA_CHEIRO_SABOR -- Indicador se a pessoa perdeu cheiro ou sabor.

-- Inserir os resultados na tabela tempor�ria #TEMP_COVID.
INTO #TEMP_COVID

-- Origem dos dados principais: tabela consolidada de casos de COVID-19.
FROM DADOS_COVID_CONSOLIDADO AS dc

-- Realizar jun��o � tabela de Unidades Federativas para substituir c�digos por descri��es.
LEFT JOIN DE_PARA_UF AS dpuf 
    ON dpuf.COD_UF = dc.UNIDADE_FEDERATIVDA

-- Jun��o � tabela de sexo para obter descri��es leg�veis.
LEFT JOIN SEXO AS sx 
    ON sx.COD_SEXO = dc.SEXO

-- Jun��o � tabela de escolaridade para obter descri��es dos n�veis de instru��o.
LEFT JOIN ESCOLARIDADE AS esc 
    ON esc.COD_ESCOL = dc.ESCOLARIDADE

-- Jun��o � tabela de cor/ra�a para substituir c�digos por descri��es.
LEFT JOIN COR_RACA AS rc 
    ON rc.COD_RACA = dc.RACA

-- Realizar v�rias jun��es � tabela de respostas SIM_NAO para diferentes vari�veis.
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

-- Esse script organiza os dados e prepara uma tabela tempor�ria detalhada para an�lises mais intuitivas.
