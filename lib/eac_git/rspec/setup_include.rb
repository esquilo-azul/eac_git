# frozen_string_literal: true

require 'eac_ruby_utils/rspec/conditional'
require 'eac_git/executables'
require 'eac_git/rspec/stubbed_git_local_repo'

module EacGit
  module Rspec
    module SetupInclude
      class << self
        def setup(setup_obj)
          setup_conditional_git
          setup_stubbed_git_local_repo(setup_obj)
        end

        def setup_conditional_git
          ::EacRubyUtils::Rspec::Conditional.default.add(:git) do
            ::EacGit::Executables.git.validate
          end
        end

        def setup_stubbed_git_local_repo(setup_obj)
          setup_obj.rspec_config.include ::EacGit::Rspec::StubbedGitLocalRepo
        end
      end
    end
  end
end
