# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  login           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
    factory :user do
        login { Faker::Internet.username }
        password { Faker::Internet.password }
    end
end
