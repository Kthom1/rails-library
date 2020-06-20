# frozen_string_literal: true

class Notification < ApplicationRecord
  validates :member_id, presence: true
  validates :message, presence: true
  belongs_to :member, class_name: 'Member', foreign_key: 'member_id'

  def self.notify(member_id, book_id, message)
    reserve_record = ReserveRecord.find_by(member_id: member_id, book_id: book_id, active: true)
    Notification.create(member_id: member_id, message: message) unless reserve_record.nil?
  end
end
