require "rip_hashrocket/version"

module RipHashrocket
  def self.process(options)
  
    directory = options[0] || Dir.pwd
    backup = options[1] || false

    # TODO : add options for recursivity (and application of the script to a single file)
    rbfiles = File.join(directory ,"**", "*.rb")
    Dir.glob(rbfiles).each do |filename|
      file = File.new(filename, "r+")
      
      made_changes = false
      lines = file.readlines

      lines.each_with_index do |line, i|
        newline = line.replace_rockets(line)
        made_changes = true if lines[i] != newline
        lines[i] = newline
      end
  
      file.close
      if made_changes
	      if backup
          File.rename(filename, filename + ".bak")
        else
          File.delete(filename)
        end

	      file = File.new(filename, "w+")
	
	      file.rewind
	      file.puts(lines.join)
	      file.close
      end
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
