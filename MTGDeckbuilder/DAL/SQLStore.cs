using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTGDeckbuilder.Classes;
using System.Data;

namespace MTGDeckbuilder.DAL
{
    public class SQLStore : IStore
    {
        IDatabaseConnector connector;

        public SQLStore()
        {
            connector = new SQLServerConnector();
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

            IDbCommand command = connector.CreateCommand();
            command.CommandText = "SELECT * " +
                                    "FROM [mtgcard] " +
                                    "JOIN [cardColor] ON mtgcard.ID = cardColor.cardID" +
                                    "JOIN [color] ON cardColor.colorCode = color.code;" +
                                    "JOIN [cardColorIdentity] ON mtgcard.ID = cardColorIdentity.cardID" +
                                    "JOIN [cardTypeCard] ON mtgcard.ID = cardTypeCard.cardID" +
                                    "JOIN [cardType] ON cardTypeCard.typeID = cardType.ID";

            using (IDataReader reader = connector.ExecuteReader(command))
            {
                while (reader.Read())
                {
                    //Card card = new Permanent()
                    //{

                    //};

                    //cards.Add(card);
                }
            }

            return cards;
        }

        public Card GetCard(string name)
        {
            throw new NotImplementedException();
        }

        public Deck LoadDeck(string name)
        {
            throw new NotImplementedException();
        }

        public void RemoveCardFromDeck(Deck deck, Card card)
        {
            throw new NotImplementedException();
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
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsbyExclusiveColor(string color)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsByFlavorText(string flavortext)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsByManaCost(int cost)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsByName(string name)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsByPower(int power)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsByRarity(Rarity rarity)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsByText(string text)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsByToughness(int toughness)
        {
            throw new NotImplementedException();
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
