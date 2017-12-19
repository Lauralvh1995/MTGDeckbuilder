using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTGDeckbuilder.Classes
{
    public class Permanent : Card
    {
        string Power { get; set; }
        string Toughness { get; set; }

        public Permanent(string name, string color, string colorIdentity, string cost, int cmc, string type, Rarity rarity, string text, string flavorText, string power, string toughness) : base(name, color, colorIdentity, cost, cmc, type, rarity, text, flavorText)
        {
            Power = power;
            Toughness = toughness;
        }
    }
}
