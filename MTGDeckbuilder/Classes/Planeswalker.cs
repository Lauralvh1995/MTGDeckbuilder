using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTGDeckbuilder.Classes
{
    class Planeswalker : Permanent
    {
        int Loyalty { get; set; }
        public Planeswalker(string name, string color, string colorIdentity, string cost, string type, Rarity rarity, string text, string flavorText, int power, int toughness, int loyalty) : base(name, color, colorIdentity, cost, type, rarity, text, flavorText, power, toughness)
        {
            Loyalty = loyalty;
        }
    }
}
