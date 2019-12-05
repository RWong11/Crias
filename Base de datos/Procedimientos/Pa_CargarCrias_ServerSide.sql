alter procedure [dbo].[Pa_CargarCrias_ServerSide] 
@search varchar(8), -- criterio de filtro para el id de la cria
@order varchar(18), -- Campo por el cual se ordenara
@orderDir varchar(5), -- ASC o DESC
@startRec varchar(4), -- 150 (Se salte 150 tuplas)
@pageSize varchar(4), -- 50 (Muestre 50 tuplas) (Significa que esta en la pagina 4 y hay 50 tuplas por pagina)
@clasificacion varchar(20),
@estado varchar(20),
@ciudad varchar(20),
@proceso varchar(20),
@total int OUTPUT
AS
BEGIN
	if LEN(@search) > 0
		SELECT *, 1 as totalFiltrado FROM Vi_Crias WHERE cri_id = @search
	ELSE
	BEGIN
		DECLARE @sql varchar(1024)
		set @sql = 'SELECT *, COUNT(*) OVER() as totalFiltrado from vi_Crias '
		SET @sql = @sql + 'WHERE cla_id=' +@clasificacion+' AND est_id=' +@estado+' AND ciu_id=' +@ciudad+' AND proceso_actual='+@proceso+' '
		SET @sql = @sql + 'ORDER BY ' +@order +' ' +@orderDir +' OFFSET ' +@startRec + ' ROWS FETCH NEXT ' +@pageSize + ' ROWS ONLY'
		EXEC (@sql)
	END

	SELECT @total = count(cri_id) FROM CRIAS
END