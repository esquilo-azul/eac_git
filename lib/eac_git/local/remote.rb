# frozen_string_literal: true

module EacGit
  class Local
    class Remote
      NO_SUCH_REMOTE_CODE = 512

      enable_simple_cache
      include ::EacGit::RemoteLike

      common_constructor :local, :name

      # @return [String]
      def add(url)
        local.command('remote', 'add', name, url).execute!
      end

      def exist?
        url
      end

      # @return [EacRubyUtils::Envs::Command
      def git_command(*)
        local.command(*)
      end

      # @return [EacGit::Local::Remote::Push]
      def push
        ::EacGit::Local::Remote::Push.new(self)
      end

      # @return [String]
      def remote_reference
        name
      end

      # @return [String]
      def remove
        local.command('remote', 'remove', name).execute!
      end

      # @return [String, nil]
      def url
        url_get(exit_outputs: { NO_SUCH_REMOTE_CODE => nil }).if_present(nil, &:strip)
      end

      # @return [String]
      def url=(new_url)
        local.command('remote', 'set-url', name, new_url).execute!
      end

      # @return [String, nil]
      def url_get(**)
        local.command('remote', 'get-url', name).execute!(**)
      end
    end
  end
end
