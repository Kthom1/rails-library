# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :checkout_records
  has_many :reserve_records
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

  def self.set_returned(id)
    book = Book.find(id)
    book.checked_out = false
    book.save
  end

  def self.cancel_reserve(id)
    book = Book.find(id)
    book.reserved = false
    book.save
  end
end
