require 'awesome_print'
require 'yaml'
require 'bluecloth'

class Picture < Hash
  class << self
    def files
      Dir["pictures/*.yml"].sort_by {|entry| File.basename(entry) }.reverse
    end
    
    def all
      set = Picture.files
      return [] unless set
      set.map {|i| self.load i}
    end
    
    def load(file_path)
      meta, description = File.read(file_path).split(/\n\n/, 2)
      Picture.new(YAML.load(meta).inject({}) {|h, (k,v)| h.merge(k.to_sym => v) }.merge(:description => description, :id => File.basename(file_path).gsub(/\..*/, '')))
    end
    
    def find(id)
      file_path =  Dir["pictures/#{id}.yml"].first
      Picture.load file_path if file_path
    end
  end
  
  def initialize(attributes = {})
    self.update(attributes)
  end
  
  def description
    begin
      BlueCloth.new(self[:description].to_s.strip).to_html
    rescue 
      markdown self[:description]
    end
  end

  def source
    self[:source]
  end
  
  def title
    self[:title]
  end
  
  def date
    self[:date]
  end
  
  def author
    self[:author]
  end
  
  def author
    self[:id]
  end
  
  def url
    "http://thistime.imeuble.info/#{self.id}"
  end
end