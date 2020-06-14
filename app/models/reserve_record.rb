# frozen_string_literal: true

class ReserveRecord < ApplicationRecord
  belongs_to :member, class_name: 'Member', foreign_key: 'member_id'
  belongs_to :staff, class_name: 'Staff', foreign_key: 'staff_id'
end
