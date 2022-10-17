# frozen_string_literal: true

require File.expand_path('../../test_helper', __FILE__)

class WikiTest < Redmine::IntegrationTest
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
    projects(:projects_001).enable_module!(:wiki_diff_alternative)
  end

  def test_wiki_diff
    log_user('admin', 'admin')

    get(
      '/projects/ecookbook/wiki/CookBook_documentation/diff',
      params: {
        version: '2',
        version_from: '1',
      })

    assert_response :success
  end

  def test_wiki_edit
    log_user('admin', 'admin')

    get('/projects/ecookbook/wiki/CookBook_documentation/edit')

    assert_response :success
    assert_select 'a.tab-diff-preview'
  end
end
