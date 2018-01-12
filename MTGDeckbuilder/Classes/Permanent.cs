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
        int Loyalty { get; set; }

        public Permanent(int id, string name, List<string> color, List<string> colorIdentity, string cost, int cmc, List<string> type, Rarity rarity, string text, string flavorText, int power, int toughness, int loyalty) : base(id, name, color, colorIdentity, cost, cmc, type, rarity, text, flavorText)
        {
            Power = power;
            Toughness = toughness;
            Loyalty = loyalty;
        }

        public int GetPower()
        {
            return Power;
        }

        public int GetToughness()
        {
            return Toughness;
        }

        public int GetLoyalty()
        {
            return Loyalty;
        }
    }
}
