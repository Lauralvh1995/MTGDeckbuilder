using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MTGDeckbuilder.Classes;

namespace MTGTestProject
{
    [TestClass]
    public class ControllerTest
    {
        [TestMethod]
        public void TestCreateDeck()
        {
            Controller control = new Controller();
            control.CreateDeck("Test");
            Assert.AreEqual("Test", control.decks[0].ToString());
            Assert.AreEqual(control.decks[0], control.CurrentDeck);
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
