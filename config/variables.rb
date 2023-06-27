require 'colorize'
VARIABLES = [
    'PROD_DATABASE_NAME',
    'DEV_DATABASE_NAME',
    'TEST_DATABASE_NAME',
    'DATABASE_USER_NAME',
    'DATABASE_USER_PASSWORD'
]

def check_env_variables
  missing_variables = []
  VARIABLES.each do |key|
    if ENV[key].nil?
      missing_variables << key
    end
  end

  if missing_variables.any?
    puts "These variables are missing in the .env file: \n\n#{missing_variables.join("\n")}".colorize(:red).blink
    exit
  end
  puts "All required variables are defined".colorize(:green)
  String.disable_colorization = true
end

check_env_variables