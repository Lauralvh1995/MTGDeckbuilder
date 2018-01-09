using MTGDeckbuilder.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTGDeckbuilder.Classes
{
    public class Controller
    {
        public Deck CurrentDeck;
        public List<Deck> decks;

        private IStore store;
        public Controller()
        {
            store = new SQLStore();
            decks = new List<Deck>();
        }
        public void CreateDeck(string name)
        {
            Deck deck = new Deck(name);
            CurrentDeck = deck;
            SaveDeck();
        }

        public void SaveDeck()
        {
            int check = 0;
            foreach(Deck deck in decks)
            {
                if(deck.ToString() == CurrentDeck.ToString())
                {
                    check++;
                }
            }

            if (check == 0)
            {
                decks.Add(CurrentDeck);
                store.SaveDeck(CurrentDeck);
            }
            else
            {
                store.SaveDeck(CurrentDeck);
            }
        }

        public void LoadDeck(string name)
        {
            CurrentDeck = store.LoadDeck(name);
        }

        public void DeleteDeck(string name)
        {
            foreach (Deck deck in decks.ToList())
            {
                if (deck.ToString() == CurrentDeck.ToString())
                {
                    decks.Remove(deck);
                    store.DeleteDeck(deck);
                }
            }
        }
    }
}
