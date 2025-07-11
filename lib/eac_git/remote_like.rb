# frozen_string_literal: true

module EacGit
  module RemoteLike
    require_sub __FILE__
    enable_abstract_methods

    # @return [String] The output of command "git fetch".
    def fetch
      local.command('fetch', name).execute!
    end

    # @return [EacRubyUtils::Envs::Command
    def git_command(*_args)
      raise_abstract_method __method__
    end

    # @return [EacGit::RemoteLike::LsResult]
    def ls
      ::EacGit::RemoteLike::LsResult.by_ls_remote_command_output(
        git_command('ls-remote', remote_reference).execute!
      )
    end

    # @return [String]
    def remote_reference
      raise_abstract_method __method__
    end
  end
end
