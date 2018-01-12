using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MTGDeckbuilder.Classes;
using MTGDeckbuilder.DAL;

namespace MTGTestProject
{
    [TestClass]
    public class DeckTest
    {
        [TestMethod]
        public void AddCardTest()
        {
            Controller control = new Controller();
            IStore store = new SQLStore();
            control.CreateDeck("Test4");
            Card card = store.GetCard("Forest");
            Deck deck = control.decks[7];

            deck.AddCard(card);

            Assert.AreEqual(deck.GetDeckList()[0].ToString(), "Forest");
        }
    }
}
