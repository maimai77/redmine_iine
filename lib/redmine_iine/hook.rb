# frozen_string_literal: true

module RedmineIine
  class Hook < Redmine::Hook::ViewListener
    def view_layouts_base_content(context = {})
      controller = context[:controller]
      if controller.controller_name == 'issues' && controller.action_name == 'show'
        controller.render partial: 'redmine_iine/hooks/view_layouts_base_content'
      end
    end
  end
end
