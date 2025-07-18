# frozen_string_literal: true

module EacGit
  module RemoteLike
    class LsResult
      class << self
        def by_ls_remote_command_output(output)
          new(
            output.each_line.map { |line| line.strip.split(/\s+/) }.to_h { |x| [x[1], x[0]] } # rubocop:disable Style/MapToHash
          )
        end
      end

      common_constructor :hashes
      delegate :fetch, :[], :count, :any?, :empty?, to: :hashes
    end
  end
end
