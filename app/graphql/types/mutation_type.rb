Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :injured_a_player, types.ID do
    description "To injured a player"
    type PlayerType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      player = Player.find_by(id: args[:id], injured: false)
      player.update(injured: true)
      player
    }
  end
end
