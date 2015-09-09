# == Schema Information
#
# Table name: contents
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  text       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Content < ActiveRecord::Base
  belongs_to :user

  def markdown
    GitHub::Markdown.render_gfm(text)
  end
end
