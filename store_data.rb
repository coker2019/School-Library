require 'json'

def read_file(file)
  if File.exist?(file)
    if File.empty?(file)
      []
    else
      file_data = File.read(file)
      JSON.parse(file_data)
    end
  else
    []
  end
end

def write_file(file, content)
  data = content.map { |item| item.send(:to_hash) }  # Accessing private method using send
  json = JSON.generate(data)
  File.write(file, json)
end





