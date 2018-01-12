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
        int ID { get; set; }
        string Name { get; set; }
        List<string> Color { get; set; }
        List<string> ColorIdentity { get; set; }
        string Cost { get; set; }
        int ConvertedManaCost { get; set; }
        List<string> Type { get; set; }
        Rarity Rarity { get; set; }
        string Text { get; set; }
        string FlavorText { get; set; }

        public Card(int id, string name, List<string> color, List<string> colorIdentity, string cost, int cmc, List<string> type, Rarity rarity, string text, string flavorText)
        {
            ID = id;
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

        public Card(string name, List<string> color, List<string> colorIdentity, string cost, int cmc, List<string> type, Rarity rarity, string text, string flavorText)
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

        public string GetCardType()
        {
            string type = "";
            foreach(string t in Type)
            {
                type = type + " " + t;
            }
            return type;
        }

        public override string ToString()
        {
            return Name;
        }
        public int GetID()
        {
            return ID;
        }

        public List<string> GetColors()
        {
            return Color;
        }

        public List<string> GetColorIdentity()
        {
            return ColorIdentity;
        }
        public List<string> GetTypes()
        {
            return Type;
        }

        public string GetRules()
        {
            return Text;
        }
        public string GetFlavor()
        {
            return FlavorText;
        }
        public int GetCost()
        {
            return ConvertedManaCost;
        }
        public Rarity GetRarity()
        {
            return Rarity;
        }
    }
}
