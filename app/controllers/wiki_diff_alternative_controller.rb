# frozen_string_literal: true

class WikiDiffAlternativeController < ApplicationController
  before_action :find_wiki, :find_existing_page

  def preview
    unless User.current.allowed_to?(:edit_wiki_pages, @project)
      return deny_access
    end

    text = params[:text]
    content_to = WikiContent.new(text: text)

    version = params[:version]
    content_from = @page.content_for_version(version)

    @diff = WikiDiff.new(content_to, content_from)

    render(partial: 'wiki_diff_alternative/preview')
  end

  def find_wiki
    @project = Project.find(params[:project_id])
    @wiki = @project.wiki
    render_404 unless @wiki
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def find_existing_page
    @page = @wiki.find_page(params[:id])
    if @page.nil?
      render_404
      return
    end
  end
end
