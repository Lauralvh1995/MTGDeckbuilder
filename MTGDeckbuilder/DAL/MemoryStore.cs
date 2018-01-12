using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTGDeckbuilder.Classes;

namespace MTGDeckbuilder.DAL
{
    public class MemoryStore : IStore
    {
        public MemoryStore()
        {

        }
        public void AddCardToDeck(Deck deck, Card card)
        {
            throw new NotImplementedException();
        }

        public void DeleteDeck(Deck deck)
        {
            throw new NotImplementedException();
        }

        public List<Card> FetchAllCards()
        {
            throw new NotImplementedException();
        }

        public List<Deck> GetAllDecks()
        {
            throw new NotImplementedException();
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
            throw new NotImplementedException();
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
            throw new NotImplementedException();
        }
    }
}
