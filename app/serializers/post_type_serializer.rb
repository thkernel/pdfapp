# == Schema Information
#
# Table name: post_types
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PostTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status
  has_one :user
end
