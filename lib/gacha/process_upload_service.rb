class Gacha
  class ProcessUploadService
    attr_reader :file_contents, :file_urls, :guild, :file_url,
                :gacha

    def initialize(guild, file_urls)
      @file_urls = file_urls
      @guild = guild
    end

    def perform
      if valid?
        file_urls.each do |file_url|
          @file_url = file_url
          process_file_contents
          database_transaction
        end
        true
      else
        false
      end
    end

    def valid?
      guild.present? && file_urls.present?
    end

    private

    def database_transaction
      Gacha.transaction do
        create_gacha!
        create_items!
      end
    end

    def process_file_contents
      @file_contents = HTTParty.get(file_url).body
      @file_contents = @file_contents.strip.split("\n")
    end

    def create_gacha!
      @gacha = guild.gachas.create!(
        key_name: file_contents[0].gsub(' ', '_'),
        name: file_contents[1]
      )
    end

    def create_items!
      file_contents[2..-1].each do |content|
        content = content.strip.split(' ')
        gacha.items.create!(
          chance: content[0],
          name: content[1..-1].join(' ')
        )
      end
    end
  end
end
