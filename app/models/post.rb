# == Schema Information
#
# Table name: posts
#
#  id               :bigint           not null, primary key
#  title            :string
#  post_type_id     :bigint
#  post_category_id :bigint
#  content          :text
#  status           :string
#  user_id          :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Post < ApplicationRecord
  
extend FriendlyId
  friendly_id :title, use: :slugged
    
  belongs_to :post_type
  belongs_to :post_category
  belongs_to :user

  has_one_attached :thumbnail
  has_one_attached :file

  
  

  validates :slug, uniqueness: true
end
