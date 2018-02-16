# frozen_string_literal: true

class IineCounter < ActiveRecord::Base
  belongs_to :issue, required: true
  has_many :user_iines, dependent: :destroy
end
