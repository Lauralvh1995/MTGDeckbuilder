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
        string Type { get; set; }
        Rarity Rarity { get; set; }
        string Text { get; set; }
        string FlavorText { get; set; }

        public Card(string name, string color, string colorIdentity, string cost, int cmc, string type, Rarity rarity, string text, string flavorText)
        {
            Name = name;
            Color = color;
            Cost = cost;
            Type = type;
            Rarity = rarity;
            Text = text;
            FlavorText = flavorText;

            ColorIdentity = colorIdentity;
            ConvertedManaCost = cmc;
        }

        public string GetType()
        {
            return Type;
        }

        public override string ToString()
        {
            return Name;
        }
    }
}
