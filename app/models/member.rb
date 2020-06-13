# frozen_string_literal: true

class Member < User
  has_many :reserved_books, class_name: 'ReserveRecord', foreign_key: 'member_id'
  has_many :checked_out_books, class_name: 'CheckoutRecord', foreign_key: 'member_id'
end
