using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MTGDeckbuilder.Classes;

namespace MTGTestProject
{
    [TestClass]
    public class ControllerTest
    {
        Controller control = new Controller();
        [TestMethod]
        public void TestCreateDeck()
        {
            control.CreateDeck("Test");
            Assert.AreEqual("Test", control.decks[0].ToString());
            Assert.AreEqual(control.decks[0], control.CurrentDeck);
        }

        [TestMethod]
        public void TestDeleteDeck()
        {
            control.CreateDeck("Test");
            control.DeleteDeck("Test");
            Assert.AreEqual(0, control.decks.Count);
        }
    }
}
