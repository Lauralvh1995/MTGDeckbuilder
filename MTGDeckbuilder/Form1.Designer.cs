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
            this.btAddCard = new System.Windows.Forms.Button();
            this.btRemoveCard = new System.Windows.Forms.Button();
            this.btNewDeck = new System.Windows.Forms.Button();
            this.lbComplete = new System.Windows.Forms.Label();
            this.btSaveDeck = new System.Windows.Forms.Button();
            this.btDeleteDeck = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // liBoxAllCards
            // 
            this.liBoxAllCards.FormattingEnabled = true;
            this.liBoxAllCards.Location = new System.Drawing.Point(342, 11);
            this.liBoxAllCards.Name = "liBoxAllCards";
            this.liBoxAllCards.Size = new System.Drawing.Size(159, 238);
            this.liBoxAllCards.TabIndex = 0;
            this.liBoxAllCards.SelectedIndexChanged += new System.EventHandler(this.liBoxAllCards_SelectedIndexChanged);
            // 
            // liBoxAllDecks
            // 
            this.liBoxAllDecks.FormattingEnabled = true;
            this.liBoxAllDecks.Location = new System.Drawing.Point(13, 13);
            this.liBoxAllDecks.Name = "liBoxAllDecks";
            this.liBoxAllDecks.Size = new System.Drawing.Size(120, 95);
            this.liBoxAllDecks.TabIndex = 1;
            this.liBoxAllDecks.SelectedIndexChanged += new System.EventHandler(this.liBoxAllDecks_SelectedIndexChanged);
            // 
            // liBoxDecklist
            // 
            this.liBoxDecklist.FormattingEnabled = true;
            this.liBoxDecklist.Location = new System.Drawing.Point(149, 12);
            this.liBoxDecklist.Name = "liBoxDecklist";
            this.liBoxDecklist.Size = new System.Drawing.Size(154, 238);
            this.liBoxDecklist.TabIndex = 2;
            this.liBoxDecklist.SelectedIndexChanged += new System.EventHandler(this.liBoxDecklist_SelectedIndexChanged);
            // 
            // btAddCard
            // 
            this.btAddCard.Location = new System.Drawing.Point(309, 84);
            this.btAddCard.Name = "btAddCard";
            this.btAddCard.Size = new System.Drawing.Size(27, 23);
            this.btAddCard.TabIndex = 3;
            this.btAddCard.Text = "<<";
            this.btAddCard.UseVisualStyleBackColor = true;
            this.btAddCard.Click += new System.EventHandler(this.btAddCard_Click);
            // 
            // btRemoveCard
            // 
            this.btRemoveCard.Location = new System.Drawing.Point(309, 113);
            this.btRemoveCard.Name = "btRemoveCard";
            this.btRemoveCard.Size = new System.Drawing.Size(27, 23);
            this.btRemoveCard.TabIndex = 4;
            this.btRemoveCard.Text = ">>";
            this.btRemoveCard.UseVisualStyleBackColor = true;
            this.btRemoveCard.Click += new System.EventHandler(this.btRemoveCard_Click);
            // 
            // btNewDeck
            // 
            this.btNewDeck.Location = new System.Drawing.Point(12, 131);
            this.btNewDeck.Name = "btNewDeck";
            this.btNewDeck.Size = new System.Drawing.Size(120, 23);
            this.btNewDeck.TabIndex = 5;
            this.btNewDeck.Text = "New Deck";
            this.btNewDeck.UseVisualStyleBackColor = true;
            this.btNewDeck.Click += new System.EventHandler(this.btNewDeck_Click);
            // 
            // lbComplete
            // 
            this.lbComplete.AutoSize = true;
            this.lbComplete.ForeColor = System.Drawing.Color.Red;
            this.lbComplete.Location = new System.Drawing.Point(13, 115);
            this.lbComplete.Name = "lbComplete";
            this.lbComplete.Size = new System.Drawing.Size(59, 13);
            this.lbComplete.TabIndex = 6;
            this.lbComplete.Text = "Incomplete";
            // 
            // btSaveDeck
            // 
            this.btSaveDeck.Location = new System.Drawing.Point(12, 161);
            this.btSaveDeck.Name = "btSaveDeck";
            this.btSaveDeck.Size = new System.Drawing.Size(120, 23);
            this.btSaveDeck.TabIndex = 7;
            this.btSaveDeck.Text = "Save Deck";
            this.btSaveDeck.UseVisualStyleBackColor = true;
            this.btSaveDeck.Click += new System.EventHandler(this.btSaveDeck_Click);
            // 
            // btDeleteDeck
            // 
            this.btDeleteDeck.Location = new System.Drawing.Point(12, 226);
            this.btDeleteDeck.Name = "btDeleteDeck";
            this.btDeleteDeck.Size = new System.Drawing.Size(120, 23);
            this.btDeleteDeck.TabIndex = 8;
            this.btDeleteDeck.Text = "Delete Deck";
            this.btDeleteDeck.UseVisualStyleBackColor = true;
            this.btDeleteDeck.Click += new System.EventHandler(this.btDeleteDeck_Click);
            // 
            // MTGDeckbuilder
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(513, 261);
            this.Controls.Add(this.btDeleteDeck);
            this.Controls.Add(this.btSaveDeck);
            this.Controls.Add(this.lbComplete);
            this.Controls.Add(this.btNewDeck);
            this.Controls.Add(this.btRemoveCard);
            this.Controls.Add(this.btAddCard);
            this.Controls.Add(this.liBoxDecklist);
            this.Controls.Add(this.liBoxAllDecks);
            this.Controls.Add(this.liBoxAllCards);
            this.Name = "MTGDeckbuilder";
            this.Text = "MTG-DeckBuilder";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox liBoxAllCards;
        private System.Windows.Forms.ListBox liBoxAllDecks;
        private System.Windows.Forms.ListBox liBoxDecklist;
        private System.Windows.Forms.Button btAddCard;
        private System.Windows.Forms.Button btRemoveCard;
        private System.Windows.Forms.Button btNewDeck;
        private System.Windows.Forms.Label lbComplete;
        private System.Windows.Forms.Button btSaveDeck;
        private System.Windows.Forms.Button btDeleteDeck;
    }
}

