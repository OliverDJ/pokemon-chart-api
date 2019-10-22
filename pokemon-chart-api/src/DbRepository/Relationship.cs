using System;
using System.Collections.Generic;

namespace DbRepository
{
    public partial class Relationship
    {
        public int TypeA { get; set; }
        public int TypeB { get; set; }
        public double Multiplier { get; set; }

        public virtual PokemonType TypeANavigation { get; set; }
        public virtual PokemonType TypeBNavigation { get; set; }
    }
}