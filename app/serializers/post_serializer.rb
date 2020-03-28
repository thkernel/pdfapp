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

class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :status
  has_one :post_type
  has_one :post_category
  has_one :user
end
