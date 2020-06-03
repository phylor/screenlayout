def screenlayouts
  scripts = Dir["#{ENV["HOME"]}/.screenlayout/*"]

  scripts.map do |script|
    {
      name: name(script),
      script: script
    }
  end
end

def name(script_name)
  File.basename(script_name).gsub(/.sh$/, "")
end

def screenlayout(name)
  layouts = screenlayouts.select { |layout| layout[:name] == name }

  if layouts.size > 0
    layouts.first
  else
    nil
  end
end

def run_post_script
  script_path = File.join(config_directory, "post")

  puts script_path
  if File.exists?(script_path)
    puts "Running post script.."
    system script_path
  end
end

def config_directory
  system_config = ENV.fetch("XDG_CONFIG_HOME", "#{ENV["HOME"]}/.config")

  File.join(system_config, "screenlayout")
end

if ARGV.size == 0
  screenlayouts.each { |layout| puts layout[:name] }
elsif ARGV.size == 1
  new_layout = ARGV[0]
  layout = screenlayout(new_layout)

  if layout
    puts "Switching to #{new_layout}.."
    system layout[:script]

    run_post_script
  else
    puts "Layout #{new_layout} not found"
    exit 1
  end
end
