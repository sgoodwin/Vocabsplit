#!/usr/bin/env ruby

require "minitest/autorun"
require './split.rb'

class TestSplitter < Minitest::Test
  def test_split_no_parens
    words = ["おはよう", "hello"]
    assert_equal split(words), words
  end

  def test_split_with_parens
    words = ["お早う　（おはよう)", "hello"]
    assert_equal ["お早う", "おはよう", "hello"], split(words)
  end
end
