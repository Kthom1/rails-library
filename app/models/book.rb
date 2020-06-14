# frozen_string_literal: true

class Book < ApplicationRecord
  def self.set_reserved(id)
    book = Book.find(id)
    book.reserved = true
    book.save
  end

  def self.set_checked_out(id)
    book = Book.find(id)
    book.checked_out = true
    book.save
  end
end
