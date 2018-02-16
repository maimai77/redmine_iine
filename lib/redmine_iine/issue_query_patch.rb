# frozen_string_literal: true

module RedmineIine
  module IssueQueryPatch
    module Include
      extend ActiveSupport::Concern

      included do
        available_columns << IineQueryColumn.new(
          :iine_counter,
          :count,
          caption: :field_iine_counter_count,
          sortable: "#{IineCounter.table_name}.count"
        )
      end
    end

    module Prepend
      def joins_for_order_statement(order_options)
        return super unless order_options&.include?('iine_counters')
        [super, "LEFT OUTER JOIN #{IineCounter.table_name} ON #{IineCounter.table_name}.issue_id = #{queried_table_name}.id"].join(' ')
      end
    end

    ActiveSupport::Reloader.to_prepare do
      IssueQuery.include Include
      IssueQuery.prepend Prepend
    end
  end
end
