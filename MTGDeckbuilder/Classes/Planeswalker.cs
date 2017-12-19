using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTGDeckbuilder.Classes
{
    class Planeswalker : Permanent
    {
        string Loyalty { get; set; }
        public Planeswalker(string name, string color, string colorIdentity, string cost, int cmc, string type, Rarity rarity, string text, string flavorText, string power, string toughness, string loyalty) : base(name, color, colorIdentity, cost, cmc, type, rarity, text, flavorText, power, toughness)
        {
            Loyalty = loyalty;
        }
    }
}
