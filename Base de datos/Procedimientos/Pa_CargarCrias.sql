select * from crias

select * from Vi_Crias

delete from crias where cri_id > 1

create procedure Pa_CargarCrias
AS
BEGIN
	SELECT * FROM Vi_Crias
END

exec Pa_CargarCrias
EXEC Pa_CargarCrias