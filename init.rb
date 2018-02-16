# frozen_string_literal: true

require_dependency 'redmine_iine/hook'
require_dependency 'redmine_iine/issue_patch'
require_dependency 'redmine_iine/issue_query_patch'

Redmine::Plugin.register :redmine_iine do
  name 'Redmine イイネ Plugin'
  author 'maimai77'
  version '0.0.1'
end
