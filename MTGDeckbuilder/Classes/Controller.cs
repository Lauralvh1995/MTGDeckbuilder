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

        public Controller()
        {
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
                //stuur naar Database
            }
            else
            {
                //stuur changes naar Database
            }
        }

        public void LoadDeck(string name)
        {
            throw new NotImplementedException();
        }

        public void DeleteDeck(string name)
        {
            throw new NotImplementedException();
        }
    }
}
