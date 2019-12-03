create procedure [dbo].[Pa_CargarCrias_ServerSide] 
@search varchar(32), -- criterio de filtro
@order varchar(18), -- Campo por el cual se ordenara
@orderDir varchar(5), -- ASC o DESC
@startRec varchar(4), -- 150 (Se salte 150 tuplas)
@pageSize varchar(4) -- 50 (Muestre 50 tuplas) (Significa que esta en la pagina 4 y hay 50 tuplas por pagina)
AS
BEGIN
	DECLARE @sql varchar(1024)
	set @sql = 'SELECT * from vi_Crias '

	if LEN(@search) > 0
		SET @sql = @sql + 'WHERE cri_id LIKE ''%'+@search+'%'' OR cla_descripcion LIKE ''%'+@search+'%'' OR est_descripcion LIKE ''%'+@search+'%'' '

	SET @sql = @sql + 'ORDER BY ' +@order +' ' +@orderDir +' OFFSET ' +@startRec + ' ROWS FETCH NEXT ' +@pageSize + ' ROWS ONLY'
	EXEC (@sql)
END
