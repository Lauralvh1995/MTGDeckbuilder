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

        public Permanent(string name, string color, string cost, string superType, string type, string subType, Rarity rarity, string text, int power, int toughness) : base(name, color, cost, superType, type, subType, rarity, text)
        {
            Power = power;
            Toughness = toughness;
        }
    }
}
