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
        public NonPermanent(string name, string color, string cost, string superType, string type, string subType, Rarity rarity, string text, bool tribal) : base(name, color, cost, superType, type, subType, rarity, text)
        {
            Tribal = tribal;
        }
    }
}
