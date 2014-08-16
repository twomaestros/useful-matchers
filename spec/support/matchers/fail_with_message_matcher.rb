# Copyright (c) 2006-2014, Tammer Saleh, thoughtbot, inc.

# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:

# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

# Taken from shoulda_matchers:
# https://github.com/thoughtbot/shoulda-matchers/blob/master/spec/support/fail_with_message_matcher.rb

RSpec::Matchers.define :fail_with_message do |expected|
  def supports_block_expectations?
    true
  end

  match do |block|
    @actual = nil

    begin
      block.call
    rescue RSpec::Expectations::ExpectationNotMetError => ex
      @actual = ex.message
    end

    @actual && @actual == expected
  end

  def failure_message
    msg = "Expectation should have failed with message '#{expected}'"

    if @actual
      msg << ", actually failed with '#{@actual}'"
    else
      msg << ", but did not fail."
    end

    msg
  end

  def failure_message_for_should
    failure_message
  end

  def failure_message_when_negated
    msg  = "Expectation should not have failed with message '#{expected}'"
    msg << ", but did."

    msg
  end

  def failure_message_for_should_not
    failure_message_when_negated
  end
end