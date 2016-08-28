class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  def user
    return User.find_by(id: self.user_id)
  end

end
