# frozen_string_literal: true

module RedmineWikiDiffAlternative
  class ViewListener < Redmine::Hook::ViewListener
    render_on :view_layouts_base_html_head, partial: 'wiki_diff_alternative/html_head'
    render_on :view_layouts_base_body_bottom, partial: 'wiki_diff_alternative/body_bottom'
  end
end
