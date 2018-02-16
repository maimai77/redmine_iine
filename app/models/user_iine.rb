# frozen_string_literal: true

class UserIine < ActiveRecord::Base
  belongs_to :iine_counter, counter_cache: :count, required: true
  belongs_to :user, required: true

  validates :user, uniqueness: { scope: :iine_counter }
end
