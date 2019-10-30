CREATE TRIGGER Tri_CriasEstados ON Crias AFTER UPDATE
AS
BEGIN
	DECLARE @viejo INT
	DECLARE @nuevo INT
	SELECT @viejo = cri_estado FROM deleted
	SELECT @nuevo = cri_estado FROM inserted

	if @nuevo<>@viejo
		INSERT INTO Log_CriasEstados
		SELECT cri_id, GETDATE(), @nuevo from inserted
END