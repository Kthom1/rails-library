# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_before_action :verify_authenticity_token, only: [:index]
  def index
    @books = Book.limit(5).order('id desc')
    @checkout_records = current_user ? current_user.checkout_records.where(active: true) : []
    @reserve_records = current_user ? current_user.reserve_records.where(active: true) : []
    @search_books = Book.where(name: params[:search]) if params[:search]
  end
end
