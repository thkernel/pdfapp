# == Schema Information
#
# Table name: post_categories
#
#  id              :bigint           not null, primary key
#  name            :string
#  parent_category :integer
#  description     :text
#  status          :string
#  user_id         :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class PostCategory < ApplicationRecord

	extend FriendlyId
  friendly_id :name, use: :slugged


  belongs_to :user


end
