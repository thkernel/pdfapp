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

require 'test_helper'

class PostCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
