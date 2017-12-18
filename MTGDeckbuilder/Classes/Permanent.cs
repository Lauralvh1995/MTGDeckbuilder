using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTGDeckbuilder.Classes
{
    public class Permanent : Card
    {
        int Power { get; set; }
        int Toughness { get; set; }

        public Permanent(string name, string color, string colorIdentity, string cost, string type, Rarity rarity, string text, string flavorText, int power, int toughness) : base(name, color, colorIdentity, cost, type, rarity, text, flavorText)
        {
            Power = power;
            Toughness = toughness;
        }
    }
}
