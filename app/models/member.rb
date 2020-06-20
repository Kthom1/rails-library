# frozen_string_literal: true

class Member < User
  has_many :reserve_records, class_name: 'ReserveRecord', foreign_key: 'member_id'
  has_many :checkout_records, class_name: 'CheckoutRecord', foreign_key: 'member_id'
  has_many :notifications, class_name: 'Notification', foreign_key: 'member_id'
  has_many :books, through: :checkout_records
  has_many :books, through: :reserve_records
end
