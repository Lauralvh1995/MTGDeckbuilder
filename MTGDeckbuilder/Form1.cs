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
        public MTGDeckbuilder()
        {
            InitializeComponent();
            control = new Controller();
            liBoxAllCards.DataSource = new BindingList<Card>(control.allCards);
            liBoxAllDecks.DataSource = new BindingList<Deck>(control.decks);
            liBoxDecklist.DataSource = new BindingList<Card>(control.CurrentDeck.GetDeckList());
            Refresh();
        }
    }
}
