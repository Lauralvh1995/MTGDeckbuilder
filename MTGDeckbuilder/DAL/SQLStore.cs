using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTGDeckbuilder.Classes;
using System.Data;
using MTGDeckbuilder.Exceptions;

namespace MTGDeckbuilder.DAL
{
    public class SQLStore : IStore
    {
        IDatabaseConnector connector;
        List<Card> allcards;
        List<Deck> alldecks;

        public SQLStore()
        {
            connector = new SQLServerConnector();
            allcards = FetchAllCards();
            alldecks =  new List<Deck>();/*GetAllDecks();*/
        }

        public void AddCardToDeck(Deck deck, Card card)
        {
            IDbCommand command = connector.CreateCommand();
            command.CommandText = "INSERT INTO [deckList] ([deckID], [cardID]) VALUES (@deck, @card);";
            command.AddParameterWithValue("deck", deck.GetID());
            command.AddParameterWithValue("card", card.GetID());

            connector.ExecuteNonQuery(command);
        }

        public void DeleteDeck(Deck deck)
        {
            IDbCommand command = connector.CreateCommand();
            command.CommandText = "UPDATE [DECK] SET [Active]=@active WHERE [ID]=@id;";
            command.AddParameterWithValue("active", false);
            command.AddParameterWithValue("id", deck.GetID());

            connector.ExecuteNonQuery(command);
        }

        public List<Card> FetchAllCards()
        {
            List<Card> cards = new List<Card>();

            List<int> cardIDs = new List<int>();
            List<string> cardNames = new List<string>();
            List<string> manaCosts = new List<string>();
            List<int> CMCs = new List<int>();
            List<int> Ps = new List<int>();
            List<int> Ts = new List<int>();
            List<int> Ls = new List<int>();
            List<string> rules = new List<string>();
            List<string> flavor = new List<string>();
            List<string> artist = new List<string>();
            List<string> generatedMana = new List<string>();
            List<int> rarity = new List<int>();

            List<List<string>> types = new List<List<string>>();
            List<List<string>> color = new List<List<string>>();
            List<List<string>> colorIdentity = new List<List<string>>();

            IDbCommand command = connector.CreateCommand();
            command.CommandText = "SELECT ID, mtgCard.name, manacost, converted_manacost, p as 'Power', t as 'Toughness', l as 'Loyalty', rulesText, flavor, artist, generated_mana FROM mtgcard";
            using (IDataReader reader = connector.ExecuteReader(command))
            {
                while (reader.Read())
                {
                    cardIDs.Add(reader.GetInt32(0));
                    cardNames.Add(reader.GetString(1));
                    manaCosts.Add(reader.GetString(2));
                    CMCs.Add(reader.GetInt32(3));
                    Ps.Add(reader.GetInt32(4));
                    Ts.Add(reader.GetInt32(5));
                    Ls.Add(reader.GetInt32(6));
                    rules.Add(reader.GetString(7));
                    flavor.Add(reader.GetString(8));
                    artist.Add(reader.GetString(9));
                    generatedMana.Add(reader.GetString(10));
                }
            }
            foreach(int i in cardIDs)
            {
                List<string> cardtypes = new List<string>();
                IDbCommand commandGetTypes = connector.CreateCommand();
                command.CommandText = "SELECT cardType.Name FROM cardTypeCard JOIN cardType ON cardTypeCard.cardType = cardType.id WHERE cardID = " + i;
                //command.AddParameterWithValue("cardID", i);
                using (IDataReader reader = connector.ExecuteReader(command))
                {
                    
                    while (reader.Read())
                    {
                        cardtypes.Add(reader.GetString(0));
                    }
                }
                types.Add(cardtypes);

                List<string> cardcolors = new List<string>();
                IDbCommand commandGetColors = connector.CreateCommand();
                command.CommandText = "SELECT Color.Name FROM cardColor JOIN Color ON cardColor.colorCode = color.Code WHERE cardID = " + i;
                //command.AddParameterWithValue("cardID2", i);
                using (IDataReader reader = connector.ExecuteReader(command))
                {

                    while (reader.Read())
                    {
                        cardcolors.Add(reader.GetString(0));
                    }
                }
                color.Add(cardcolors);

                List<string> cardColorIdentities = new List<string>();
                IDbCommand commandGetCIs = connector.CreateCommand();
                command.CommandText = "SELECT Color.Name FROM cardColorIdentity JOIN Color ON cardColorIdentity.colorCode = color.Code WHERE cardID = " + i;
                //command.AddParameterWithValue("cardID3", i);
                using (IDataReader reader = connector.ExecuteReader(command))
                {

                    while (reader.Read())
                    {
                        cardColorIdentities.Add(reader.GetString(0));
                    }
                }
                colorIdentity.Add(cardColorIdentities);

                IDbCommand commandGetRarity = connector.CreateCommand();
                command.CommandText = "SELECT rarity.code FROM cardRarity JOIN rarity ON cardRarity.rarity = rarity.code WHERE cardRarity.cardID = " + i;
                //command.AddParameterWithValue("cardID4", i);
                using (IDataReader reader = connector.ExecuteReader(command))
                {
                    rarity.Add(1/*reader.GetInt32(0)*/);
                }
            }

            foreach(int id in cardIDs)
            {
                if (types[id - 1] != null && id < 165)
                {
                    if (types[id-1].Contains("Artifact") || types[id - 1].Contains("Creature") || types[id - 1].Contains("Enchantment") || types[id - 1].Contains("Land") || types[id - 1].Contains("Planeswalker"))
                    { //Hier ArgumentOutOfBoundsException, op [164], in een lijst van Count=165, en [164] is gewoon gevuld!
                        cards.Add(new Permanent(cardIDs[id-1], cardNames[id - 1], color[id - 1], colorIdentity[id - 1], manaCosts[id - 1], CMCs[id], types[id - 1], (Rarity)rarity[id - 1], rules[id], flavor[id - 1], Ps[id - 1], Ts[id - 1], Ls[id - 1]));
                    }
                    else
                    {
                        if (types[id - 1].Contains("Tribal"))
                        {
                            cards.Add(new NonPermanent(cardIDs[id - 1], cardNames[id - 1], color[id - 1], colorIdentity[id], manaCosts[id - 1], CMCs[id - 1], types[id - 1], (Rarity)rarity[id - 1], rules[id - 1], flavor[id - 1], true));
                        }
                        else
                        {
                            cards.Add(new NonPermanent(cardIDs[id - 1], cardNames[id - 1], color[id - 1], colorIdentity[id], manaCosts[id - 1], CMCs[id - 1], types[id - 1], (Rarity)rarity[id - 1], rules[id - 1], flavor[id - 1], false));
                        }
                    }
                }
                System.Diagnostics.Debug.Print("hope this works");
            }
            return cards;
        }

        public List<Deck> GetAllDecks()
        {
            List<Deck> decks = new List<Deck>();
            IDbCommand command = connector.CreateCommand();
            List<int> ID = new List<int>();
            List<string> name = new List<string>();
            List<bool> completed = new List<bool>();
            List<List<string>> cardnames = new List<List<string>>();
            command.CommandText = "SELECT * FROM Deck WHERE active=1";
            using (IDataReader reader = connector.ExecuteReader(command))
            {
                while (reader.Read())
                {
                    ID.Add(reader.GetInt32(0));
                    name.Add(reader.GetString(1));
                    completed.Add(reader.GetBoolean(3));
                }
            }
            for(int i =1; i==ID.Count(); i++) //DAFUQ, dit hele blok wordt overgeslagen!
            {
                List<string> cardnamesname = new List<string>();
                IDbCommand command2 = connector.CreateCommand();
                command2.CommandText = "SELECT mtgCard.name FROM mtgcard JOIN deckList ON mtgCard.id = deckList.CardID WHERE deckList.DeckID = @deckID";
                command2.AddParameterWithValue("deckID", i);
                using (IDataReader reader = connector.ExecuteReader(command))
                {
                    while (reader.Read())
                    {
                        cardnamesname.Add(reader.GetString(1));
                    }
                }
                cardnames.Add(cardnamesname);
                Deck deck = new Deck(ID[i-1], name[i-1], completed[i-1]);
                //Hier dezelfde error als bij het inladen van alle kaarten. IK snap het niet meer.
                decks.Add(deck);
            }
            
            for (int i2 = 0; i2 == decks.Count(); i2++)
            {
                foreach (string st in cardnames[i2])
                {
                    if (cardnames[i2].Count != 0)
                    {
                        decks[i2].GetDeckList().Add(GetCard(st));
                    }
                }
            }
            return decks;
        }

        public Card GetCard(string name)
        {
            foreach(Card card in allcards)
            {
                if(name == card.ToString())
                {
                    return card;
                }
            }
            throw new NoSuchCardException("No such card found");
        }

        public Deck LoadDeck(string name)
        {
            Deck deck = new Deck(name);
            IDbCommand command = connector.CreateCommand();
            command.CommandText = "SELECT * FROM Deck WHERE name = @name AND available = true";
            command.AddParameterWithValue("name", name);
            using (IDataReader reader = connector.ExecuteReader(command))
            {
                while (reader.Read())
                {
                    deck = new Deck(reader.GetString(1));
                }
            }
            return deck;
        }

        public void RemoveCardFromDeck(Deck deck, Card card)
        {
            IDbCommand command = connector.CreateCommand();
            command.CommandText = "DELETE TOP(1) FROM Decklist WHERE deckID = @deck AND cardID = @card;";
            command.AddParameterWithValue("deck", deck.GetID());
            command.AddParameterWithValue("card", card.GetID());

            connector.ExecuteNonQuery(command);
        }

        public void SaveDeck(Deck deck)
        {
            IDbCommand command = connector.CreateCommand();
            command.CommandText = "INSERT INTO [Deck] (name, active, completed) VALUES (@deck, @active, @complete);";
            command.AddParameterWithValue("deck", deck.ToString());
            command.AddParameterWithValue("active", true);
            command.AddParameterWithValue("complete", false);

            connector.ExecuteNonQuery(command);
        }

        public List<Card> SearchCardsByColor(string color)
        {
            List<Card> foundCards = new List<Card>();
            foreach (Card card in allcards)
            {
                if (card.GetColors().Contains(color))
                {
                    foundCards.Add(card);
                }
            }
            if(foundCards.Count > 0)
            {
                return foundCards;
            }
            throw new NoSuchCardException("No such card(s) found");
        }

        public List<Card> SearchCardsbyExclusiveColor(string color)
        {
            List<Card> foundCards = new List<Card>();
            foreach (Card card in allcards)
            {
                if ((card.GetColors().Contains(color) && card.GetColors().Count == 1) || card.GetColors().Contains(color) && card.GetColors().Count == 1 && card.GetColors().Contains("Colorless"))
                {
                    foundCards.Add(card);
                }
            }
            if (foundCards.Count > 0)
            {
                return foundCards;
            }
            throw new NoSuchCardException("No such card(s) found");
        }

        public List<Card> SearchCardsByFlavorText(string flavortext)
        {
            List<Card> foundCards = new List<Card>();
            foreach (Card card in allcards)
            {
                if (card.GetFlavor().Contains(flavortext))
                {
                    foundCards.Add(card);
                }
            }
            if (foundCards.Count > 0)
            {
                return foundCards;
            }
            throw new NoSuchCardException("No such card(s) found");
        }

        public List<Card> SearchCardsByManaCost(int cost)
        {
            List<Card> foundCards = new List<Card>();
            foreach (Card card in allcards)
            {
                if (card.GetCost() == cost)
                {
                    foundCards.Add(card);
                }
            }
            if (foundCards.Count > 0)
            {
                return foundCards;
            }
            throw new NoSuchCardException("No such card(s) found");
        }

        public List<Card> SearchCardsByName(string name)
        {
            List<Card> foundCards = new List<Card>();
            foreach (Card card in allcards)
            {
                if (card.ToString().Contains(name))
                {
                    foundCards.Add(card);
                }
            }
            if (foundCards.Count > 0)
            {
                return foundCards;
            }
            throw new NoSuchCardException("No such card(s) found");
        }

        public List<Card> SearchCardsByPower(int power)
        {
            List<Card> foundCards = new List<Card>();
            foreach (Card card in allcards)
            {
                if (card is Permanent)
                {
                    Permanent p = card as Permanent;
                    if (p.GetPower() == power)
                    {
                        foundCards.Add(card);
                    }
                }
            }
            if (foundCards.Count > 0)
            {
                return foundCards;
            }
            throw new NoSuchCardException("No such card(s) found");
        }

        public List<Card> SearchCardsByRarity(Rarity rarity)
        {
            List<Card> foundCards = new List<Card>();
            foreach (Card card in allcards)
            {
                if (card.GetRarity() == rarity)
                {
                    foundCards.Add(card);
                }
            }
            if (foundCards.Count > 0)
            {
                return foundCards;
            }
            throw new NoSuchCardException("No such card(s) found");
        }

        public List<Card> SearchCardsByText(string text)
        {
            List<Card> foundCards = new List<Card>();
            foreach (Card card in allcards)
            {
                if (card.GetRules().Contains(text))
                {
                    foundCards.Add(card);
                }
            }
            if (foundCards.Count > 0)
            {
                return foundCards;
            }
            throw new NoSuchCardException("No such card(s) found");
        }

        public List<Card> SearchCardsByToughness(int toughness)
        {
            List<Card> foundCards = new List<Card>();
            foreach (Card card in allcards)
            {
                if (card is Permanent)
                {
                    Permanent p = card as Permanent;
                    if (p.GetToughness() == toughness)
                    {
                        foundCards.Add(card);
                    }
                }
            }
            if (foundCards.Count > 0)
            {
                return foundCards;
            }
            throw new NoSuchCardException("No such card(s) found");
        }

        public void SetComplete(Deck deck, bool set)
        {
            IDbCommand command = connector.CreateCommand();
            command.CommandText = "UPDATE [DECK] SET [Complete]=@complete WHERE [ID]=@id;";
            command.AddParameterWithValue("complete", set);
            command.AddParameterWithValue("id", deck.GetID());

            connector.ExecuteNonQuery(command);
        }
    }
}
