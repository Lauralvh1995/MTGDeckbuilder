using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTGDeckbuilder.Classes
{
    public enum Rarity
    {
        Common,
        Uncommon,
        Rare,
        MythicRare,
        Timeshifted,
        Masterpiece
    }
    public abstract class Card
    {
        string Name { get; set; }
        string Color { get; set; }
        string ColorIdentity { get; set; }
        string Cost { get; set; }
        int ConvertedManaCost { get; set; }
        string SuperType { get; set; }
        string Type { get; set; }
        string SubType { get; set; }
        Rarity Rarity { get; set; }
        string Text { get; set; }

        public Card(string name, string color, string cost, string superType, string type, string subType, Rarity rarity, string text)
        {
            Name = name;
            Color = color;
            Cost = cost;
            SuperType = superType;
            Type = type;
            SubType = subType;
            Rarity = rarity;
            Text = text;

            ColorIdentity = Color; //+ manasymbols in Text (not remindertext)
            ConvertedManaCost = CalculateCMC();
        }

        int CalculateCMC()
        {
            throw new NotImplementedException();
        }
    }
}
