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
                        CheckComplete();
                        return;
                    }
                    else if(card.ToString() == "Relentless Rats" || card.ToString() == "Shadowborn Apostle")
                    {
                        decklist.Add(card);
                        CheckComplete();
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
            CheckComplete();
        }

        public void RemoveCard(Card card)
        {
            foreach(Card c in decklist.ToList())
            {
                if(c == card)
                {
                    decklist.Remove(c);
                    return;
                }
            }
            CheckComplete();
        }

        public void CalculateStats()
        {
            throw new NotImplementedException();
        }

        public List<Card> GetDeckList()
        {
            return decklist;
        }

        void CheckComplete()
        {
            if(decklist.Count >= 60)
            {
                Complete = true;
            }
            else
            {
                Complete = false;
            }
        }

        public override string ToString()
        {
            return Name;
        }
    }
}
