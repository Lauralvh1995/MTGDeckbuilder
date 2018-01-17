namespace MTGDeckbuilder
{
    partial class NewDeck
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
            this.tbNewDeckName = new System.Windows.Forms.TextBox();
            this.btSubmit = new System.Windows.Forms.Button();
            this.lbEnterName = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // tbNewDeckName
            // 
            this.tbNewDeckName.Location = new System.Drawing.Point(13, 34);
            this.tbNewDeckName.Name = "tbNewDeckName";
            this.tbNewDeckName.Size = new System.Drawing.Size(259, 20);
            this.tbNewDeckName.TabIndex = 0;
            // 
            // btSubmit
            // 
            this.btSubmit.Location = new System.Drawing.Point(108, 65);
            this.btSubmit.Name = "btSubmit";
            this.btSubmit.Size = new System.Drawing.Size(75, 23);
            this.btSubmit.TabIndex = 1;
            this.btSubmit.Text = "Submit";
            this.btSubmit.UseVisualStyleBackColor = true;
            this.btSubmit.Click += new System.EventHandler(this.btSubmit_Click);
            // 
            // lbEnterName
            // 
            this.lbEnterName.AutoSize = true;
            this.lbEnterName.Location = new System.Drawing.Point(101, 18);
            this.lbEnterName.Name = "lbEnterName";
            this.lbEnterName.Size = new System.Drawing.Size(88, 13);
            this.lbEnterName.TabIndex = 2;
            this.lbEnterName.Text = "New deck name:";
            // 
            // NewDeck
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 101);
            this.Controls.Add(this.lbEnterName);
            this.Controls.Add(this.btSubmit);
            this.Controls.Add(this.tbNewDeckName);
            this.Name = "NewDeck";
            this.Text = "NewDeck";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox tbNewDeckName;
        private System.Windows.Forms.Button btSubmit;
        private System.Windows.Forms.Label lbEnterName;
    }
}