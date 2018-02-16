# frozen_string_literal: true

module RedmineIine
  module IssuePatch
    extend ActiveSupport::Concern

    included do
      has_one :iine_counter, dependent: :destroy
    end

    def iine_count
      iine_counter&.count || 0
    end
  end

  ActiveSupport::Reloader.to_prepare do
    Issue.include IssuePatch
  end
end
