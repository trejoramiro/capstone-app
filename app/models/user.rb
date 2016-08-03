class User < ApplicationRecord
    has_secure_password #bycript needs us to add this
    has_many :groupusers
    has_many :groups, through: :groupusers
end
