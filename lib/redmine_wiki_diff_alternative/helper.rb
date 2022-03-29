# frozen_string_literal: true

require 'diff/lcs'
require 'diff/lcs/hunk'

module RedmineWikiDiffAlternative
  module Helper
    def to_unified_wiki_diff(diff)
      from_lines = diff.content_from.text.split("\n")
      to_lines = diff.content_to.text.split("\n")
      hunks = Diff::LCS.diff(from_lines, to_lines).map do |b|
        Diff::LCS::Hunk.new(from_lines, to_lines, b, 3, 0)
      end

      merge_hunks(hunks).reduce('') { |result, hunk| result + "\n" + hunk.diff(:unified) }
    end

    def merge_hunks(hunks)
      ret = []

      hunks.each_with_index do |hunk, idx|
        if idx != 0
          if hunk.overlaps?(hunks[idx -1])
            hunk.merge(hunks[idx - 1])
          else
            ret << hunks[idx - 1]
          end
        end

        if (idx + 1) == hunks.length
          ret << hunk
        end
      end

      ret
    end
  end
end

WikiHelper.include RedmineWikiDiffAlternative::Helper
