namespace MTGDeckbuilder
{
    partial class MTGDeckbuilder
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.liBoxAllCards = new System.Windows.Forms.ListBox();
            this.liBoxAllDecks = new System.Windows.Forms.ListBox();
            this.liBoxDecklist = new System.Windows.Forms.ListBox();
            this.SuspendLayout();
            // 
            // liBoxAllCards
            // 
            this.liBoxAllCards.FormattingEnabled = true;
            this.liBoxAllCards.Location = new System.Drawing.Point(330, 11);
            this.liBoxAllCards.Name = "liBoxAllCards";
            this.liBoxAllCards.Size = new System.Drawing.Size(155, 238);
            this.liBoxAllCards.TabIndex = 0;
            // 
            // liBoxAllDecks
            // 
            this.liBoxAllDecks.FormattingEnabled = true;
            this.liBoxAllDecks.Location = new System.Drawing.Point(13, 13);
            this.liBoxAllDecks.Name = "liBoxAllDecks";
            this.liBoxAllDecks.Size = new System.Drawing.Size(120, 95);
            this.liBoxAllDecks.TabIndex = 1;
            // 
            // liBoxDecklist
            // 
            this.liBoxDecklist.FormattingEnabled = true;
            this.liBoxDecklist.Location = new System.Drawing.Point(149, 12);
            this.liBoxDecklist.Name = "liBoxDecklist";
            this.liBoxDecklist.Size = new System.Drawing.Size(141, 238);
            this.liBoxDecklist.TabIndex = 2;
            // 
            // MTGDeckbuilder
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(497, 261);
            this.Controls.Add(this.liBoxDecklist);
            this.Controls.Add(this.liBoxAllDecks);
            this.Controls.Add(this.liBoxAllCards);
            this.Name = "MTGDeckbuilder";
            this.Text = "MTG-DeckBuilder";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ListBox liBoxAllCards;
        private System.Windows.Forms.ListBox liBoxAllDecks;
        private System.Windows.Forms.ListBox liBoxDecklist;
    }
}

