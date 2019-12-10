module Mutations
    class CreateVote < BaseMutation
        argument :link_id, ID, required: false

        type Types::VoteType

        def resolve(link_id: nil)
            return unless link_id

            Vote.create!(
                user: context[:current_user],
                link: Link.find(link_id)
            )
        rescue => e
            nil
        end
    end
end