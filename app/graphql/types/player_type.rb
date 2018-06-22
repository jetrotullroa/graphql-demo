PlayerType = GraphQL::ObjectType.define do
  name "Player"
  description "a player type"

  field :id, !types.ID
  field :name, !types.String
  field :position, !types.String
  field :injured, types.Boolean
  field :team_id, types.ID
  field :updated_at, types.String
  field :created_at, types.String
end
