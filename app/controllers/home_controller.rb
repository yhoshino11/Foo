class HomeController < ApplicationController
  def index
    @contents = Content.all.reverse.select do |c|
      c.title.present? && c.text.present?
    end
  end
end
