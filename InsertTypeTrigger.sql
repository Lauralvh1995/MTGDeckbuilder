--Insert Type Trigger
--Geen idee of ik deze ooit af krijg. Dit zou een INSTEAD OF INSERT trigger op cardTypeCard moeten zijn, die kijkt of er geen Permanent types met Non-Permanent types worden gecombineerd voor een kaart.
--En dat een type alleen mag worden toegewezen, als de kaart één van zijn parent types heeft.
CREATE TRIGGER trg_InsertType ON cardTypeCard
INSTEAD OF INSERT
AS
DECLARE @cardID AS int
DECLARE @tempTypeID AS int
DECLARE @typeID AS int
BEGIN
			
END;


CREATE PROCEDURE CheckParentOrPermanent AS
 DECLARE @CardID AS int
 DECLARE @checktrue AS bit
 DECLARE @Check AS CURSOR;
 SET @Check = CURSOR FOR
 SELECT cardID FROM cardTypeCard;
 OPEN @Check;
 FETCH NEXT FROM @Check INTO @CardID;
 WHILE @@FETCH_STATUS = 0
 BEGIN
	
 FETCH NEXT FROM @Check INTO @CardID;
 END;
 CLOSE @Check;
 DEALLOCATE @Check;
GO