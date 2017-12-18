using MTGDeckbuilder.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTGDeckbuilder.DAL.Interfaces
{
    interface IDeckContext
    {
        void SaveDeck(Deck deck);
        Deck LoadDeck(string name);
        void DeleteDeck(Deck deck);
        void AddCardToDeck(Deck deck, Card card);
        void RemoveCardFromDeck(Deck deck, Card card);
    }
}
