# frozen_string_literal: true

class CheckoutRecord < ApplicationRecord
  validates :member_id, presence: true
  validates :staff_id, presence: true, allow_blank: true, on: :create
  validates :staff_id, presence: true, on: :update
  validates :supposed_return_date, presence: true
  validates :actual_return_date, presence: true, allow_blank: true
  belongs_to :member, class_name: 'User', foreign_key: 'member_id'
  belongs_to :staff, class_name: 'Staff', foreign_key: 'staff_id', optional: true

  def self.set_initial(checkout_record_params)
    checkout_record = CheckoutRecord.new(checkout_record_params)
    checkout_record.checkout_date = Time.now
    checkout_record.supposed_return_date = Time.now + (2 * 7 * 24 * 60 * 60)
    Book.set_checked_out(checkout_record_params[:book_id])
    checkout_record
  end
end
