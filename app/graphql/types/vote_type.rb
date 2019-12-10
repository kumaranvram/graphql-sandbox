module Types
    class VoteType < BaseObject 
        field :id, ID, null: false
        field :link, LinkType, null: false
        field :user, UserType, null: false
    end
end