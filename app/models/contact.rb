class Contact < ApplicationRecord
    belongs_to :kind, optional: true
    has_many :phones

    # def author
    #     return 'current user'
    # end

    # def as_json(options = {})
    #     super(
    #         root: true,
    #         methods: :author,
    #         include: { kind: { only: :description } }
    #     )
    # end
end
