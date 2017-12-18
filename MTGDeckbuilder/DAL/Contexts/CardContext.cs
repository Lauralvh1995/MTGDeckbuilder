﻿using MTGDeckbuilder.DAL.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTGDeckbuilder.Classes;

namespace MTGDeckbuilder.DAL.Contexts
{
    class CardContext : ICardContext
    {
        IDatabaseConnector connector;

        public CardContext()
        {
            connector = new SQLServerConnector();
        }

        public List<Card> FetchAllCards()
        {
            throw new NotImplementedException();
        }

        public Card GetCard(string name)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsByColor(string color)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsbyExclusiveColor(string color)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsByFlavorText(string flavortext)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsByManaCost(int cost)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsByName(string name)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsByPower(int power)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsByRarity(Rarity rarity)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsByText(string text)
        {
            throw new NotImplementedException();
        }

        public List<Card> SearchCardsByToughness(int toughness)
        {
            throw new NotImplementedException();
        }
    }
}
