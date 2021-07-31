# frozen_string_literal: true

require 'eac_git/executables'
require 'eac_git/rspec/stubbed_git_local_repo'

module EacGit
  module Rspec
    class Setup
      common_constructor :setup_obj

      def perform
        setup_conditional_git
        setup_stubbed_git_local_repo
      end

      def setup_conditional_git
        setup_obj.conditional(:git) { ::EacGit::Executables.git.validate }
      end

      def setup_stubbed_git_local_repo
        setup_obj.rspec_config.include ::EacGit::Rspec::StubbedGitLocalRepo
      end
    end
  end
end
