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
            allcards = new BindingList<Card>();
            alldecks = new BindingList<Deck>();
            decklist = new BindingList<Card>();
            
            Redraw();

            selectedCard = liBoxAllCards.SelectedItem as Card;
            selectedDeck = liBoxAllDecks.SelectedItem as Deck;
            
        }

        private void btAddCard_Click(object sender, EventArgs e)
        {
            control.CurrentDeck.AddCard(selectedCard);
            UpdateDecklist();
        }

        private void btRemoveCard_Click(object sender, EventArgs e)
        {
            control.CurrentDeck.RemoveCard(selectedDeckCard);
            UpdateDecklist();
        }

        private void btDeleteDeck_Click(object sender, EventArgs e)
        {
            control.DeleteDeck(selectedDeck.ToString());
            UpdateAllDecks();
        }

        private void btNewDeck_Click(object sender, EventArgs e)
        {
            CreateDeckButton();
            UpdateAllDecks();
        }

        private void btSaveDeck_Click(object sender, EventArgs e)
        {
            control.SaveDeck();
            Redraw();
        }

        private void liBoxAllDecks_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedDeck = liBoxAllDecks.SelectedItem as Deck;
            control.CurrentDeck = liBoxAllDecks.SelectedItem as Deck;
            UpdateDecklist();
        }

        private void liBoxDecklist_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedDeckCard = liBoxDecklist.SelectedItem as Card;
        }

        private void liBoxAllCards_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedCard = liBoxAllCards.SelectedItem as Card;
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
        }

        public void Redraw()
        {
            allcards = new BindingList<Card>(control.searchedCards);
            alldecks = new BindingList<Deck>(control.decks);
            decklist = new BindingList<Card>(control.CurrentDeck.GetDeckList());

            liBoxAllCards.DataSource = null;
            liBoxAllDecks.DataSource = null;
            liBoxDecklist.DataSource = null;
            liBoxAllCards.DataSource = allcards;
            liBoxAllDecks.DataSource = alldecks;
            liBoxDecklist.DataSource = decklist;
        }

        public void UpdateDecklist()
        {
            decklist = new BindingList<Card>(control.CurrentDeck.GetDeckList());
            liBoxDecklist.DataSource = null;
            liBoxDecklist.DataSource = decklist;
        }

        public void UpdateAllDecks()
        {
            alldecks = new BindingList<Deck>(control.decks);
            liBoxAllDecks.DataSource = null;
            liBoxAllDecks.DataSource = alldecks;
            //liBoxAllDecks.Hide();
            //liBoxAllDecks.Show();
        }
    }
}
