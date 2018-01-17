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

        BindingList<Card> allcards;
        BindingList<Deck> alldecks;
        BindingList<Card> decklist;
        public MTGDeckbuilder()
        {
            InitializeComponent();
            control = new Controller();
            allcards = new BindingList<Card>(control.allCards);
            alldecks = new BindingList<Deck>(control.decks);
            decklist = new BindingList<Card>(control.CurrentDeck.GetDeckList());

            liBoxAllCards.DataSource = allcards;
            liBoxAllDecks.DataSource = alldecks;
            liBoxDecklist.DataSource = decklist;

            Redraw();
        }

        private void btAddCard_Click(object sender, EventArgs e)
        {
            control.CurrentDeck.AddCard(selectedCard);
            Redraw();
        }

        private void btRemoveCard_Click(object sender, EventArgs e)
        {
            control.CurrentDeck.RemoveCard(selectedDeckCard);
            Redraw();
        }

        private void btDeleteDeck_Click(object sender, EventArgs e)
        {
            control.DeleteDeck(control.decks[liBoxDecklist.SelectedIndex].ToString());
            Redraw();
        }

        private void btNewDeck_Click(object sender, EventArgs e)
        {
            CreateDeckButton();
            Redraw();
        }

        private void btSaveDeck_Click(object sender, EventArgs e)
        {
            control.SaveDeck();
            Redraw();
        }

        private void liBoxAllDecks_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedDeck = control.decks[liBoxDecklist.SelectedIndex];
            control.CurrentDeck = control.decks[liBoxDecklist.SelectedIndex];
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
            Redraw();
        }

        public void Redraw()
        {
            liBoxAllCards.Hide();
            liBoxAllDecks.Hide();
            liBoxDecklist.Hide();
            liBoxAllCards.Show();
            liBoxAllDecks.Show();
            liBoxDecklist.Show();
        }
    }
}
