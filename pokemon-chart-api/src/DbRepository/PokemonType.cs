using System;
using System.Collections.Generic;

namespace DbRepository
{
    public partial class PokemonType
    {
        public PokemonType()
        {
            RelationshipTypeANavigations = new HashSet<Relationship>();
            RelationshipTypeBNavigations = new HashSet<Relationship>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Color { get; set; }

        public virtual ICollection<Relationship> RelationshipTypeANavigations { get; set; }
        public virtual ICollection<Relationship> RelationshipTypeBNavigations { get; set; }
    }
}