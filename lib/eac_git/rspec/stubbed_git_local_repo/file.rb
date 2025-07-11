# frozen_string_literal: true

require 'fileutils'

module EacGit
  module Rspec
    module StubbedGitLocalRepo
      class File < ::EacGit::Rspec::StubbedGitLocalRepo::FsObject
        def touch
          ::FileUtils.touch(path.to_path)
        end

        def delete
          path.unlink
        end

        delegate :write, to: :path
      end
    end
  end
end
