using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MTGDeckbuilder.Classes;

namespace MTGTestProject
{
    [TestClass]
    public class DeckTest
    {
        [TestMethod]
        public void AddCardTest()
        {
            Deck deck = new Deck("Test");
            deck.AddCard(new Permanent("Llanowar Elves", "G", "G", "G", 1, "Creature - Elf Warrior", Rarity.Common, "T: Add G to your mana pool", "One bone broken for every twig snapped underfoot.", 1, 1, 0));
            Assert.AreEqual(deck.GetDeckList()[0].ToString(), "Llanowar Elves");
        }
    }
}
