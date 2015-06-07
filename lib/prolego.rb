require "prolego/version"
require "json"
require "open3"

module Prolego
  class Query

    attr_reader :status, :whiny, :error

    def initialize(filepath, whiny: false)
      @file  = filepath
      @whiny = whiny
    end

    def command(predicate, args)
      command = "swipl -qf '#{@file}' -g '#{escape(predicate)}(#{escape(args)}),halt'"
      @output, @error, status = Open3.capture3(command)
      (@status = status.exitstatus) == 0
    end

    def escape(arg)
      arg.to_s.gsub(/^\[|"|'|\]$/, "[" => "", "]" => "", "'" => "'\"'\"'", "\"" => "'\"'\"'")
    end

    def epilog
      fail "Prolog exit status #{@status}. Check errors with Query#error" if @status != 0 && whiny
      JSON.parse @output.gsub("'", "\"") rescue @output
    end

  end
    
end
