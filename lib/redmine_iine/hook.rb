# frozen_string_literal: true

module RedmineIine
  class Hook < Redmine::Hook::ViewListener
    render_on :view_issues_show_description_bottom, partial: 'redmine_iine/hooks/view_issues_show_description_bottom'
  end
end
