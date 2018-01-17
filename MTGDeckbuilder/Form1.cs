using MTGDeckbuilder.Classes;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MTGDeckbuilder
{
    public partial class MTGDeckbuilder : Form
    {
        Controller control;

        Card selectedCard;
        Card selectedDeckCard;
        Deck selectedDeck;
        public MTGDeckbuilder()
        {
            InitializeComponent();
            control = new Controller();
            liBoxAllCards.DataSource = new BindingList<Card>(control.allCards);
            liBoxAllDecks.DataSource = new BindingList<Deck>(control.decks);
            liBoxDecklist.DataSource = new BindingList<Card>(control.CurrentDeck.GetDeckList());
            Refresh();
        }

        private void btAddCard_Click(object sender, EventArgs e)
        {
            control.CurrentDeck.AddCard(selectedCard);
            liBoxDecklist.Refresh();
        }

        private void btRemoveCard_Click(object sender, EventArgs e)
        {
            control.CurrentDeck.RemoveCard(selectedDeckCard);
            liBoxDecklist.Refresh();
        }

        private void btDeleteDeck_Click(object sender, EventArgs e)
        {
            control.DeleteDeck(control.LoadAllDecks()[liBoxDecklist.SelectedIndex].ToString());
        }

        private void btNewDeck_Click(object sender, EventArgs e)
        {
            CreateDeckButton();
        }

        private void btSaveDeck_Click(object sender, EventArgs e)
        {
            control.SaveDeck();
        }

        private void liBoxAllDecks_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedDeck = control.LoadAllDecks()[liBoxDecklist.SelectedIndex];
            control.CurrentDeck = control.LoadAllDecks()[liBoxDecklist.SelectedIndex];
        }

        private void liBoxDecklist_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedDeckCard = control.CurrentDeck.GetDeckList()[liBoxDecklist.SelectedIndex];
        }

        private void liBoxAllCards_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedCard = control.searchedCards[liBoxAllCards.SelectedIndex];
        }

        public void CreateDeckButton()
        {
            NewDeck newDeck = new NewDeck();
            newDeck.ShowDialog();

            string name = newDeck.Word;

            if (newDeck.DialogResult == DialogResult.OK)
            {
                control.CreateDeck(name);
            }
            liBoxAllDecks.Refresh();
        }
    }
}
