class PopulateTagsService
  # URLS = [
  #   'https://gist.githubusercontent.com/makelefy/f5ff045c08f8982d130ccd4c5b616019/raw/dec1c23701b9f78763defa6263386b44481d4622/stopWords.txt',
  #   'https://raw.githubusercontent.com/words/fillers/master/data.txt',
  #   'https://raw.githubusercontent.com/words/hedges/master/data.txt'
  # ].freeze

  def initialize(event)
    @event = event
    @allowed_words = load_allowed_words
    # binding.pry
  end

  def call
    words.each do |word|
      @event.tag_list.add(word.downcase) if @allowed_words.include? word.downcase
    end
  end

  def words
    @event.description.split
  end

  def load_allowed_words
    File.open('white_list_tags.txt').read.split(/\n/)
  end
end
