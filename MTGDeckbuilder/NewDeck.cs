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
    public partial class NewDeck : Form
    {
        private string word;

        public NewDeck()
        {
            this.InitializeComponent();
        }

        public string Word
        {
            get
            {
                return word;
            }
            private set
            {
                word = value;
            }
        }

        private void btSubmit_Click(object sender, EventArgs e)
        {
            if (tbNewDeckName.TextLength > 0)
            {
                Word = tbNewDeckName.Text;
                DialogResult = DialogResult.OK;
                this.Close();
            }
        }
    }
}
