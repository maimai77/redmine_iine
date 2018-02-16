# frozen_string_literal: true

module RedmineIine
  module UserPatch
    extend ActiveSupport::Concern

    included do
      has_many :user_iines, dependent: :destroy
    end
  end

  ActiveSupport::Reloader.to_prepare do
    User.include UserPatch
  end
end
