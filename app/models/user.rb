class User < ApplicationRecord
    has_secure_password #bycript needs us to add this
    has_many :group_users
    has_many :groups, through: :group_users

    has_many :votes
    has_many :vists

    has_many :messages

end
