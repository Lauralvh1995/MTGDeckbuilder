using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MTGDeckbuilder.Classes;
using MTGDeckbuilder.DAL;
using System.Windows.Forms;

namespace MTGTestProject
{
    [TestClass]
    public class DeckTest
    {
        Controller control = new Controller();
        IStore store = new SQLStore();
        Deck deck;
        [TestMethod]
        public void AddCardTest()
        {
            control.CreateDeck("Test3");
            Card card = store.GetCard("Forest");
            deck = control.CurrentDeck;

            deck.AddCard(card);

            Assert.AreEqual(deck.GetDeckList()[0].ToString(), "Forest");
        }

        [TestMethod]
        public void DeleteCardTest()
        {
            control.CreateDeck("Test4");
            Card card = store.GetCard("Swamp");
            deck = control.CurrentDeck;

            deck.AddCard(card);
            deck.RemoveCard(card);
            Assert.AreEqual(deck.GetDeckList().Count, 0);
        }
    }
}
