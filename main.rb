require_relative 'hangman'

file_name = "google-10000-english-no-swears.txt"

if File.exist?(file_name)
else
  abort "The file #{file_name} does not exist."
end

dictionary = File.readlines(file_name).map(&:chomp)
filtered = dictionary.select { |word| word.length >= 5 && word.length <= 12 }
word = filtered.sample
# p word.split("")

# p word.gsub(/./) { |l|  " _ "}

p game = Hangman.new(word)
game.play