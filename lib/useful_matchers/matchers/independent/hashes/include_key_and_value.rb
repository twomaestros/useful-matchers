module UsefulMatchers
  module Matchers
    module Independent
      module Hashes
        def include_key(key)
          IncludeKeyAndValueMatcher.new key
        end
        
        class IncludeKeyAndValueMatcher
          def initialize(key)
            @key = key
            
            @value     = nil
            # Use boolean flag since we can't test whether @value is set by testing whether @value is nil
            # because we should be able to evaluate nil values.
            @value_set = false
            @subject   = nil
          end
          
          def matches?(subject)
            @subject = subject
            
            if @value_set
              ensure_subject_has_target_key && ensure_target_key_corresponds_to_target_value
            else
              ensure_subject_has_target_key
            end
          end
          
          def with_value(value)
            @value     = value
            @value_set = true
            self
          end
          
          def failure_message
            if @value_set
              "expected that the value for key #{format_key} in the hash is #{format_value}"
            else
              "expected that the hash contains #{format_key} as a key"
            end
          end
          alias failure_message_for_should failure_message
          
          def failure_message_when_negated
            if @value_set
              "expected that the value for key #{format_key} in the hash isn't #{format_value}"
            else
              "expected that the hash doesn't contain #{format_key} as a key"
            end
          end
          alias failure_message_for_should_not failure_message_when_negated
          
          private
          
          def ensure_subject_has_target_key
            @subject.keys.include?(@key)
          end
          
          def ensure_target_key_corresponds_to_target_value
            @subject[@key] == @value
          end
          
          def format_key
            format_parameter(@key)
          end
          
          def format_value
            format_parameter(@value)
          end
          
          def format_parameter(param)
            formatted_param = param
            
            case param
            when ''
              formatted_param = 'empty string'
            when nil
              formatted_param = 'nil'
            end
            
            if param.class == Symbol
              formatted_param = ":#{param.to_s}"
            end
            
            formatted_param
          end
        end
      end
    end
  end
end