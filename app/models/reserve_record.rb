# frozen_string_literal: true

class ReserveRecord < ApplicationRecord
  validates :member_id, presence: true
  validates :staff_id, presence: true, allow_blank: true, on: :create
  validates :staff_id, presence: true, on: :update
  belongs_to :member, class_name: 'Member', foreign_key: 'member_id'
  belongs_to :staff, class_name: 'Staff', foreign_key: 'staff_id', optional: true
  belongs_to :book
  def self.set_initial(reserve_record_params)
    reserve_record = ReserveRecord.new(reserve_record_params)
    reserve_record.valid_until_date = Time.now + (2 * 7 * 24 * 60 * 60)
    Book.set_reserved(reserve_record_params[:book_id])
    reserve_record
  end

  def cancel_reserve(_update_params)
    update_attribute('active', false)
    Book.cancel_reserve(book_id)
    save
    self
  end
end
