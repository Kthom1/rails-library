# frozen_string_literal: true

class Staff < User
  has_many :approved_book_reservations, class_name: 'ReserveRecord', foreign_key: 'staff_id'
  has_many :approved_book_checkouts, class_name: 'CheckoutRecord', foreign_key: 'staff_id'
end
