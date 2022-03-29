# == Schema Information
#
# Table name: tokens
#
#  id           :integer          not null, primary key
#  token_number :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
# Indexes
#
#  index_tokens_on_user_id  (user_id)
#
class Token < ApplicationRecord
    belongs_to :user
    before_save :generate_token_number

    def generate_token_number
        self.token_number = rand(0..100)
    end
end
