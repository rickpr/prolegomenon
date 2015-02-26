require "prolego/version"
require "json"

module Prolego
  class Query

    def initialize filepath
      @file=filepath
    end

    def command predicate,args
      @output=%x[swipl -q -f '#{@file}' -g '#{parg predicate}(#{parg args}),halt']
    end

    def parg arg
      arg.to_s.gsub /^\[|"|'|\]$/, "[" => "", "]" => "", "'" => "'\"'\"'", "\"" => "'\"'\"'"
    end

    def epilog
      JSON.parse @output.gsub("'","\"")
    end

  end
    
end
