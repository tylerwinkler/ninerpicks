class WelcomeController < ApplicationController
  def index
    @featured_polls = Poll.all.sample(5)
  end
end
