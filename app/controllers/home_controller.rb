# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @books = Book.limit(5).order('id desc')
  end
end
