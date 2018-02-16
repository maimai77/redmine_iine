# frozen_string_literal: true

class UserIinesController < ApplicationController
  before_action :set_issue

  def create
    @issue.create_iine_counter unless @issue.iine_counter
    IineCounter.increment_counter :count, @issue.iine_counter
    head :ok
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end
end
