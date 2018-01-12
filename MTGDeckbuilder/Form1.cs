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
            liBoxAllCards.DataSource = control.allCards;
            liBoxAllDecks.DataSource = control.decks;
            liBoxDecklist.DataSource = control.CurrentDeck.GetDeckList();
            Refresh();
        }
    }
}
