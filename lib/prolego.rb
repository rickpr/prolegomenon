require "prolego/version"

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
      @output.lines.map {|x| x.slice(/(?<=\] ).*d/).split("------").join " "}
    end

  end
    
end
