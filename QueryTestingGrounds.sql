SELECT DISTINCT mtgCard.id, mtgCard.name, mtgCard.rulesText, mtgCard.flavor, STUFF(cardColor.colorCode) as 'Color', cardColorIdentity.colorCode as 'Color Identity'
FROM [mtgcard]
JOIN [cardColor] ON mtgcard.ID = cardColor.cardID 
JOIN [color] ON cardColor.colorCode = color.code
JOIN [cardColorIdentity] ON mtgcard.ID = cardColorIdentity.cardID
JOIN [cardTypeCard] ON mtgcard.ID = cardTypeCard.cardID
JOIN [cardType] ON cardTypeCard.cardType = cardType.ID

Select SUBSTRING(
(
    SELECT ',' + colorCode AS 'data()'
        FROM colorCode
        FOR XML PATH('')
), 2 , 9999) As Color