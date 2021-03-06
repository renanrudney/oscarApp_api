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
class User < ApplicationRecord
    has_secure_password
    has_one :token
    has_one :choice
end
