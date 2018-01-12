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
        public NonPermanent(int id, string name, List<string> color, List<string> colorIdentity, string cost, int cmc, List<string> type,  Rarity rarity, string text, string flavorText, bool tribal) : base(id, name, color, colorIdentity, cost, cmc, type, rarity, text, flavorText)
        {
            Tribal = tribal;
        }
    }
}
