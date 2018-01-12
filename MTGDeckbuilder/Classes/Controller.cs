﻿using MTGDeckbuilder.DAL;
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
        public List<Card> allCards;
        public List<Card> searchedCards;

        private IStore store;
        public Controller()
        {
            store = new SQLStore();
            allCards = store.FetchAllCards();
            decks = LoadAllDecks();
            searchedCards = allCards;
            CurrentDeck = decks[0];
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

        public List<Deck> LoadAllDecks()
        {
            return store.GetAllDecks();
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

        void SearchCardsByName(string name)
        {
            searchedCards.Clear();
            searchedCards = store.SearchCardsByName(name);
        }
        void SearchCardsByColor(string color)
        {
            searchedCards.Clear();
            searchedCards = store.SearchCardsByColor(color);
        }
        void SearchCardsbyExclusiveColor(string color)
        {
            searchedCards.Clear();
            searchedCards = store.SearchCardsbyExclusiveColor(color);
        }
        void SearchCardsByManaCost(int cost)
        {
            searchedCards.Clear();
            searchedCards = store.SearchCardsByManaCost(cost);
        }
        void SearchCardsByText(string text)
        {
            searchedCards.Clear();
            searchedCards = store.SearchCardsByText(text);
        }
        void SearchCardsByFlavorText(string flavortext)
        {
            searchedCards.Clear();
            searchedCards = store.SearchCardsByFlavorText(flavortext);
        }
        void SearchCardsByRarity(Rarity rarity)
        {
            searchedCards.Clear();
            searchedCards = store.SearchCardsByRarity(rarity);
        }
        void SearchCardsByPower(int power)
        {
            searchedCards.Clear();
            searchedCards = store.SearchCardsByPower(power);
        }
        void SearchCardsByToughness(int toughness)
        {
            searchedCards.Clear();
            searchedCards = store.SearchCardsByToughness(toughness);
        }
        void GetCard(string name)
        {
            searchedCards.Clear();
            searchedCards.Add(store.GetCard(name));
        }
    }
}
