require "rip_hashrocket/version"

module RipHashrocket
  def self.process(options)
  
    directory = options[0] || Dir.pwd

    # TODO : add options for recursivity (and application of the script to a single file)
    rbfiles = File.join(directory ,"**", "*.rb")
    Dir.glob(rbfiles).each do |filename|
      file = File.new(filename, "r+")
      
      lines = file.readlines

      lines.each_with_index do |line, i|
        newline = line.replace_rockets(line)
        lines[i] = newline
      end
            
      file.pos = 0
      file.puts(lines.join)
      file.close
    end
    p "Hash Rockets replaced for #{Dir.glob(rbfiles).count} source files"    
  end

end

class String
  def replace_rockets(s)
    s.gsub(/:([a-z.]*) => /) do |n|
      n.include?('-') ? n : "#{n[1..n.size-5]}: " 
    end
  end
end
