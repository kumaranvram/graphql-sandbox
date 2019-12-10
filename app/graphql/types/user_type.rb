module Types
    class UserType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      
      # Don't leak user emails. FOR DEMO PURPOSES ONLY
      
      field :email, String, null: false
      field :votes, [Types::VoteType], null: false
    end
  end