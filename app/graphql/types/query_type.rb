Types::QueryType = GraphQL::ObjectType.define do
  # Add root-level fields here.
  # They will be entry points for queries on your schema.
  name "RootQuery"
  description "a root query type"

  field :players do
    type types[PlayerType]
    resolve ->(obj, args, ctx) {
      Player.all
    }
  end

  field :player do
    type PlayerType
    argument :id, !types.ID
    description "Player details"
    resolve ->(obj, args, ctx) {
      Player.find_by(id: args[:id])
    }
  end

  field :freeagent_players do
    type types[PlayerType]
    resolve ->(obj, args, ctx) {
      Player.no_team
    }
  end

  field :injured_players do
    type types[PlayerType]
    resolve ->(obj, args, ctx) {
      Player.injured
    }
  end

  field :teams do
    type types[TeamType]
    resolve ->(obj, args, ctx) {
      Team.all
    }
  end

  field :team do
    type TeamType
    argument :id, !types.ID
    description "Team overview"
    resolve ->(obj, args, ctx) {
      Team.find(args[:id])
    }
  end
end
