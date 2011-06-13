require "rip_hashrocket/version"

module RipHashrocket
  def self.process(options)
  
    directory = options[0] || Dir.pwd
    backup = options[1] || false

    count = 0
    rbfiles = File.join(directory ,"**", "*.rb")
    Dir.glob(rbfiles).each do |filename|
      file = File.new(filename, "r+")
      
      made_changes = false
      lines = file.readlines

      lines.each_with_index do |line, i|
        newline = line.replace_rockets(line)
        if lines[i] != newline
          puts "line: #{lines[i]}"
          puts "newline: #{newline}"
          made_changes = true 
          count += 1
        end
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
    p "Hash Rockets has upgraded hash syntax in #{count} out of #{Dir.glob(rbfiles).count} source files tested"    
  end

end

class String
  def replace_rockets(s)
    s.gsub(/:([a-z.]*) => /) do |n|
      n.include?('-') ? n : "#{n[1..n.size-5]}: " 
    end
  end
end
