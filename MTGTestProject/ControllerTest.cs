using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MTGDeckbuilder.Classes;
using MTGDeckbuilder.DAL;

namespace MTGTestProject
{
    [TestClass]
    public class ControllerTest
    {
        [TestMethod]
        public void TestCreateDeck()
        {
            Controller control = new Controller();
            IStore store = new SQLStore();
            control.CreateDeck("Test");
            Assert.AreEqual("Test", control.CurrentDeck.ToString());
            Assert.AreEqual(store.LoadDeck(control.CurrentDeck.ToString()), control.CurrentDeck);
        }

        [TestMethod]
        public void TestDeleteDeck()
        {
            Controller control = new Controller();
            control.CreateDeck("Test2");
            control.DeleteDeck("Test2");
            Assert.AreEqual(0, control.decks.Count);
        }
    }
}
