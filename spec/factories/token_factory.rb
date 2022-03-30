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
FactoryBot.define do
  factory :token do
    user {}
  end
end
