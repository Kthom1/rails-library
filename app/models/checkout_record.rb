# frozen_string_literal: true

class CheckoutRecord < ApplicationRecord
  belongs_to :member, class_name: 'Member'
  belongs_to :staff, class_name: 'Staff'
end
