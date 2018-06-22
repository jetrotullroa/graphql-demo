TeamType = GraphQL::ObjectType.define do
  name "Team"
  description "a team type"

  field :id, types.ID
  field :name, !types.String
  field :description, types.String
  field :updated_at, types.String
  field :created_at, types.String
  field :players do
    type types[PlayerType]
    resolve -> (obj, args, ctx) {
      obj.players.healthy
    }
  end
end
