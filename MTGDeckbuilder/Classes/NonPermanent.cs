using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTGDeckbuilder.Classes
{
    public class NonPermanent : Card
    {
        bool Tribal { get; set; }
        public NonPermanent(string name, string color, string colorIdentity, string cost, int cmc, string type,  Rarity rarity, string text, string flavorText, bool tribal) : base(name, color, colorIdentity, cost, cmc, type, rarity, text, flavorText)
        {
            Tribal = tribal;
        }
    }
}
