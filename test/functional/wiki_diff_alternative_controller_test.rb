# frozen_string_literal: true

require File.expand_path('../../test_helper', __FILE__)

class WikiDiffAlternativeControllerTest < ActionController::TestCase
  include Redmine::I18n

  fixtures :enabled_modules,
           :member_roles,
           :members,
           :projects,
           :roles,
           :users,
           :wiki_content_versions,
           :wiki_contents,
           :wiki_pages,
           :wikis

  def setup
    @request.session[:user_id] = 2

    @project = projects(:projects_001)
    @page = wiki_pages(:wiki_pages_001)
  end

  def test_preview
    post :preview, params: {
      project_id: @project.id,
      id: @page.title,
      version: @page.version,
      text: @page.content,
    }

    assert_response :success
  end

  def test_preview_no_project
    post :preview, params: {
      project_id: -1,
      id: @page.title,
      version: @page.version,
      text: @page.content,
    }

    assert_response :not_found
  end

  def test_preview_no_page
    post :preview, params: {
      project_id: @project.id,
      id: 'unknown',
      version: @page.version,
      text: @page.content,
    }

    assert_response :not_found
  end

  def test_preview_no_perm
    role = Role.find(1)
    role.remove_permission! :edit_wiki_pages

    post :preview, params: {
      project_id: @project.id,
      id: @page.title,
      version: @page.version,
      text: @page.content,
    }

    assert_response :forbidden
  end
end
