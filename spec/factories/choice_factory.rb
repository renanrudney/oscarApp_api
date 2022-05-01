# == Schema Information
#
# Table name: choices
#
#  id                   :integer          not null, primary key
#  remote_director_name :string           not null
#  remote_movie_name    :string           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  remote_director_id   :integer          not null
#  remote_movie_id      :integer          not null
#  user_id              :integer
#
# Indexes
#
#  index_choices_on_user_id  (user_id)
#
FactoryBot.define do
  factory :choice do
    remote_movie_id { 1 }
    remote_director_id { 1 }
    remote_movie_name { Faker::Creature::Dog.name }
    remote_director_name { Faker::Creature::Dog.name }
    user { User.first }
  end
end
