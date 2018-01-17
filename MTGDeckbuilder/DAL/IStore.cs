using MTGDeckbuilder.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTGDeckbuilder.DAL
{
    public interface IStore
    {
        //Cards
        List<Card> SearchCardsByName(string name);
        List<Card> SearchCardsByColor(string color);
        List<Card> SearchCardsbyExclusiveColor(string color);
        List<Card> SearchCardsByManaCost(int cost);
        List<Card> SearchCardsByText(string text);
        List<Card> SearchCardsByFlavorText(string flavortext);
        List<Card> SearchCardsByRarity(Rarity rarity);
        List<Card> SearchCardsByPower(int power);
        List<Card> SearchCardsByToughness(int toughness);
        Card GetCard(string name);
        List<Card> FetchAllCards();

        //Decks
        void InsertDeck(Deck deck);
        Deck LoadDeck(string name);
        void DeleteDeck(Deck deck);
        void AddCardToDeck(Deck deck, Card card);
        void RemoveCardFromDeck(Deck deck, Card card);
        void SetComplete(Deck deck, bool set);
        List<Deck> GetAllDecks();
    }
}
