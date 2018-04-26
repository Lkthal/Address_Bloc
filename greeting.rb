def greeting
    greet = ARGV.shift
    ARGV.each do |arg|
    puts "#{greet}, #{arg}!"
    end
end

greeting
