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

        public void AddCard(Card card)
        {
            int checkCount = 0;
            foreach(Card c in decklist)
            {
                if(c.ToString() == card.ToString())
                {
                    string[] supertype = card.GetType().Split('-');
                    if (supertype[0] == "Basic Land")
                    {
                        decklist.Add(card);
                        return;
                    }
                    else if(card.ToString() == "Relentless Rats" || card.ToString() == "Shadowborn Apostle")
                    {
                        decklist.Add(card);
                        return;
                    }
                    else
                    {
                        checkCount++;
                    }
                }
            }
            if(checkCount < 4)
            {
                decklist.Add(card);
            }
        }

        public void RemoveCard(Card card)
        {
            throw new NotImplementedException();
        }

        public void CalculateStats()
        {
            throw new NotImplementedException();
        }

        public List<Card> GetDeckList()
        {
            return decklist;
        }

        public override string ToString()
        {
            return Name;
        }
    }
}
