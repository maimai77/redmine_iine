# frozen_string_literal: true

class UserIinesController < ApplicationController
  before_action :set_issue
  before_action :set_user_iine

  def create
    @issue.create_iine_counter unless @issue.iine_counter
    UserIine.find_or_create_by!(iine_counter: @issue.iine_counter, user: User.current)
    @issue.iine_counter.reload
    render partial: 'redmine_iine/iine', locals: { issue: @issue }
  end

  def destroy
    @user_iine.try!(:destroy)
    @issue.iine_counter.reload
    render partial: 'redmine_iine/iine', locals: { issue: @issue }
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def set_user_iine
    @user_iine = UserIine.find_by(iine_counter: @issue.iine_counter, user: User.current)
  end
end
