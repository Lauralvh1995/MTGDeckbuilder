SELECT DISTINCT mtgCard.id, mtgCard.name, mtgCard.rulesText, mtgCard.flavor, cardColor.colorCode as 'Color', cardColorIdentity.colorCode as 'Color Identity'
FROM mtgcard
JOIN cardColor ON mtgcard.ID = cardColor.cardID 
JOIN color ON cardColor.colorCode = color.code
JOIN CardColorIdentity ON mtgcard.ID = cardColorIdentity.cardID;
--JOIN cardTypeCard ON mtgcard.ID = cardTypeCard.cardID
--JOIN cardType ON cardTypeCard.cardType = cardType.ID

select deck.Name, mtgcard.name 
from deck 
JOIN deckList ON deck.ID=deckList.deckID
JOIN mtgcard ON deckList.CardID = mtgCard.id 
ORDER BY DeckID, CardID ASC;

SELECT mtgcard.Name as 'Card', c.name as 'Color'
FROM mtgCard JOIN cardColor ON mtgCard.ID = cardColor.cardID
JOIN color c ON cardColor.colorCode = c.code;

SELECT mtgcard.Name as 'Card', c.name as 'Color'
FROM mtgCard JOIN cardColorIdentity ON mtgCard.ID = cardColorIdentity.cardID
JOIN color c ON cardColorIdentity.colorCode = c.code;

--SELECT cardType.Name
--FROM cardTypeCard JOIN cardType ON cardTypeCard.cardType = cardType.id
--WHERE cardID = @cardID

SELECT ID, mtgCard.name, manacost, converted_manacost, p as 'Power', t as 'Toughness', l as 'Loyalty', rulesText, flavor, artist, generated_mana FROM mtgcard

SELECT rarity.code
FROM cardRarity JOIN rarity ON cardRarity.rarity = rarity.code
WHERE cardRarity.cardID = 131