#!/usr/bin/env ruby
require 'byebug'
require 'csv'

def split(words)
  first = words.first

  if first.include? "（"
    subwords = first.split "（"
    return [subwords.first.strip.chomp.gsub("　", ""), subwords.last.gsub(/[（）()]/, "").strip, words.last]
  end

  if first.include? "("
    subwords = first.split "("
    return [subwords.first.strip.chomp.gsub("　", ""), subwords.last.gsub(/[（）()]/, "").strip, words.last]
  end

  words[0..2]
end

CSV.open("./output.csv", "wb") do |csv|

  CSV.foreach(ARGV[0]) do |row|
    csv << split(row)
  end

end
