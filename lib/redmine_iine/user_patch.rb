# frozen_string_literal: true

module RedmineIine
  module UserPatch
    extend ActiveSupport::Concern

    included do
      has_many :user_iines, dependent: :destroy
    end

    def iine?(issue)
      UserIine.exists?(iine_counter: issue.iine_counter, user: self)
    end
  end

  ActiveSupport::Reloader.to_prepare do
    User.include UserPatch
  end
end
