using MTGDeckbuilder.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTGDeckbuilder.Classes
{
    public class Deck
    {
        int ID { get; set; }
        string Name { get; set; }
        bool Complete { get; set; }

        List<Card> decklist;
        IStore store;

        public Deck(string name)
        {
            Name = name;
            decklist = new List<Card>();
            Complete = false;
            store = new SQLStore();
        }

        public void AddCard(Card card)
        {
            int checkCount = 0;
            foreach(Card c in decklist)
            {
                if(c.ToString() == card.ToString())
                {
                    string[] supertype = card.GetCardType().Split('-');
                    if (supertype[0] == "Basic Land")
                    {
                        decklist.Add(card);
                        store.AddCardToDeck(this, card);
                        CheckComplete();
                        return;
                    }
                    else if(card.ToString() == "Relentless Rats" || card.ToString() == "Shadowborn Apostle")
                    {
                        decklist.Add(card);
                        store.AddCardToDeck(this, card);
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
                store.AddCardToDeck(this, card);
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

        public int GetID()
        {
            return ID;
        }
    }
}
