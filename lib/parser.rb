require 'tokens'
module Emojit
  class Parser
    def initialize(filename)
      @filename = filename || raise(ArgumentError, 'You should provide a script name. eg: ./emojit my_file.emoj')
    end

    def execute(verbose)
      # READ FILE
      data = File.read(@filename)

      # DROP LEADING SPACES
      # data.gsub!(/^\s*(.*)/) { $1 }

      # MAIN PROGRAM
      data.gsub!(/#{BeginMain}/,"def main")
      data.gsub!(/#{EndMethod}|#{EndWhile}|#{EndMain}|#{EndIf}|#{End}/,"end")

      # MACROS
      data.gsub!(/@#{True}/,"true")
      data.gsub!(/@#{False}/,"false")

      # CONDITIONALS
      data.gsub!(/#{If} (\w*)/) { "if #{$1}" }
      data.gsub!(/#{ElseIf} (\w*)/) { "elsif #{$1}"}
      data.gsub!(/#{Else}/,"else")

      # LOOP
      data.gsub!(/#{While} (\w*)/) { "while #{$1}" }

      # ASSIGNMENTS
      data.gsub!(/#{AssignVariable}/) { " = " }

      # METHODS
      data.gsub!(/#{DeclareMethod} (\w+)/) { "def #{$1}" }

      # METHOD CALLS
      data.gsub!(/#{CallMethod} (\w*) (\w+) (\w+)/) { "#{$1}(#{$2}, #{$3})" }

      # ARITHMETICS
      data.gsub!(/#{MinusOperator}/) { "-" }
      data.gsub!(/#{PlusOperator}/) { "+" }
      data.gsub!(/#{MultiplicationOperator}/) { "*" }
      data.gsub!(/#{DivisionOperator}/) { "/" }
      data.gsub!(/#{ModuloOperator}/) { "%" }
      data.gsub!(/#{PlusEquals}/) { "+=" }
      data.gsub!(/#{MinusEquals}/) { "-=" }

      # COMPARISONS
      data.gsub!(/#{LessThan}#{EqualTo}/) { "<=" }
      data.gsub!(/#{GreaterThan}#{EqualTo}/) { ">=" }
      data.gsub!(/#{EqualTo}/) { "==" }
      data.gsub!(/#{NotEqualTo}/) { "!=" }
      data.gsub!(/#{GreaterThan}/) { ">" }
      data.gsub!(/#{LessThan}/) { "<" }
      data.gsub!(/#{Or}/) { "||" }
      data.gsub!(/#{And}/) { "&&" }

      # MORE FUN
      data.gsub!(/#{Return} (\w+)/) { "return #{$1}" }
      data.gsub!(/#{Print} (.*)/) { "puts #{$1}" }
      data.gsub!(/#{RaiseException} (.*)/) { "raise #{$1}" }
      data.gsub!(/#{Loop}/) { "while true" }
      data.gsub!(/#{BreakLoop}/) { "break" }
      data.gsub!(/#{BeginLambda}/) { "{ " }
      data.gsub!(/#{EndLambda}/) { " }" }

      # WRAPPING IT ALL UP
      locs = data.split("\n").reject { |l| l.empty? } + ["main"]

      code = locs.join("\n")

      if verbose
        puts locs.map.with_index { |l,i| "L%04d: %s" % [i, l] }.join("\n")
      end

      eval(code)
    end
  end
end
