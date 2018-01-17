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
        }

        public Deck(int id, string name, bool complete)
        {
            ID = id;
            Name = name;
            Complete = complete;
            decklist = new List<Card>();
        }

        public void CreateStore()
        {
            store = new SQLStore();
        }

        public void AddCard(Card card)
        {
            CreateStore();
            int checkCount = 0;
            foreach(Card c in decklist)
            {
                if(c.ToString() == card.ToString())
                {
                    string[] type = card.GetCardType().Split(' ');
                    if (type[0] == "Basic")
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
                    store.RemoveCardFromDeck(this, c);
                    return;
                }
            }
            CheckComplete();
        }

        public void CalculateStats()
        {
            //Dan is dit de enige Must die ik links ga laten liggen.
            //Tijd tekort gekomen, en teveel problemen gehad met queries, databases en andere zooi.
            //Ook in de SQLStore werkt niet alles. Errors waar ik niet wijzer uit wordt, ook al gebruik ik de debugger.
            throw new NotImplementedException();
        }

        public List<Card> GetDeckList()
        {
            return decklist;
        }

        public bool CheckComplete()
        {
            if(decklist.Count >= 60)
            {
                Complete = true;
            }
            else
            {
                Complete = false;
            }

            return Complete;
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
