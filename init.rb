# frozen_string_literal: true

basedir = File.expand_path('../lib', __FILE__)
libraries =
  [
    'redmine_wiki_diff_alternative/helper',
    'redmine_wiki_diff_alternative/view_listener',
  ]

libraries.each do |library|
  require_dependency File.expand_path(library, basedir)
end

Redmine::Plugin.register :redmine_wiki_diff_alternative do
  name 'Redmine Wiki Diff Alternative plugin'
  author '9506hqwy'
  description 'This is a wiki diff alternative view plugin for Redmine'
  version '0.2.0'
  url 'https://github.com/9506hqwy/redmine_wiki_diff_alternative'
  author_url 'https://github.com/9506hqwy'

  project_module :wiki_diff_alternative do
    # CAUTION: not used
    permission :manage_wiki_diff_alternative, { }
  end
end
