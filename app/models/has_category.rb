# == Schema Information
#
# Table name: has_categories
#
#  id          :integer          not null, primary key
#  article_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class HasCategory < ActiveRecord::Base
  belongs_to :article
  belongs_to :category
end
