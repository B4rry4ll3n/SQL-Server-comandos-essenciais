DECLARE @path VARCHAR(MAX) = (SELECT [path] FROM sys.traces WHERE is_default = 1)

SELECT
    TextData,
    Duration,
    StartTime,
    EndTime,
    SPID,
    ApplicationName,
    LoginName
FROM
    sys.fn_trace_gettable(@path, DEFAULT)
WHERE
    EventClass IN ( 115 )
ORDER BY
    StartTime DESC



	/*
	
	Identifica quando backups foram gerados ou restaurados
Utilizando o default trace, conseguimos identificar a ocorr�ncia de comandos de BACKUP e RESTORE na inst�ncia. Para melhor entendimento desse script, 
sugiro a leitura do artigo Utilizando o trace padr�o do SQL Server para auditar eventos (fn_trace_gettable).
	*/