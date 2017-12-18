using MTGDeckbuilder.DAL.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTGDeckbuilder.Classes;

namespace MTGDeckbuilder.DAL.Contexts
{
    class DeckContext : IDeckContext
    {
        public void AddCardToDeck(Deck deck, Card card)
        {
            throw new NotImplementedException();
        }

        public void DeleteDeck(Deck deck)
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
    }
}
