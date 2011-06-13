require "rip_hashrocket/version"

module RipHashrocket
  def self.process(options)
    # TODO : add options for recursivity (and application of the script to a single file)
    rbfiles = File.join(directory ,"**", "*.rb")
    Dir.glob(rbfiles).each do |filename|
      file = File.new(filename, "r+")
      
      lines = file.readlines

      lines.each_with_index do |line, i|
        newline = replace_rockets(line)
        lines[i] = newline
      end
            
      file.pos = 0
      file.puts(lines.join)
      file.close
    end
    p "Magic comments set for #{Dir.glob(rbfiles).count} source files"    
  end

  def replace_rockets(s)
    s.gsub(/:([a-z.]*) => /) do |n|
      n.include?('-') ? n : "#{n[1..n.size-5]}: " 
    end
  end

  def self.ipsum  
    "Lorem ipsum dolor sit amet, consectetur adipisicing ...."  
  end
end
