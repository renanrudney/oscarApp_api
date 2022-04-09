# == Schema Information
#
# Table name: choices
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  remote_director_id :integer          not null
#  remote_movie_id    :integer          not null
#  user_id            :integer
#
# Indexes
#
#  index_choices_on_user_id  (user_id)
#
class Choice < ApplicationRecord
    validates_presence_of :remote_director_id
    validates_presence_of :remote_movie_id
    validates_uniqueness_of :user_id
    belongs_to :user
end
