require "yaml"

$services = []

service_type = ARGV[0]
puts "Finding all services with type '#{service_type}'..."

Dir["fs-eng/*.yml"].each do |blueprint_filename|
  # puts blueprint_filename
  input_file = File.open(blueprint_filename, 'r')
  input_yml = input_file.read
  input_file.close

  blueprint = YAML::load(input_yml)
  next if blueprint['version'] == 0.3

  blueprint_name = blueprint['name']
  next if blueprint['deploy'].nil?

  systems = blueprint['deploy']
  systems.each do |system_name, services|
    services.each do |service_name, service_def|
      if service_def.has_key? 'type' and service_def['type'] == service_type
        $services.push([blueprint_name, system_name, service_name])
      end
    end
  end
end

puts "Found #{$services.size} services of type '#{service_type}':"

$services.each do |b, sys, srv|
  puts "#{b} | #{sys} | #{srv}"
end