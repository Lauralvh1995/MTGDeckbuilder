using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTGDeckbuilder.Classes
{
    public class Deck
    {
        string Name { get; set; }
        bool Complete { get; set; }

        List<Card> decklist;

        public Deck(string name)
        {
            Name = name;
            decklist = new List<Card>();
            Complete = false;
        }

        void AddCard(Card card)
        {
            throw new NotImplementedException();
        }

        void RemoveCard(Card card)
        {
            throw new NotImplementedException();
        }

        void CalculateStats()
        {
            throw new NotImplementedException();
        }

        public override string ToString()
        {
            return Name;
        }
    }
}
