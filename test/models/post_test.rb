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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
