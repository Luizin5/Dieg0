Dir["cmds/*.rb"].each { |mod| require_relative mod.gsub(".rb","") }
# importando os comandos 

require "discorb"
require "dotenv"

module Diego
  include Dotenv
  Client = Discorb::Client.new

=begin
#### Exemplo de comando global para eu nao esquecer: ##
#
  Client.slash("hello", "Greet for you") do |interaction|
    interaction.post("Hello!", ephemeral: false)
  end
#
#### importante: ####
#  "ephemeral: false" significa que a mensagem enviada
#  pelo bot sera visivel para todos, se estivesse true
#  seria o contrario
######################################################
=end

  Client.once :standby do
    puts "Logado como #{Client.user}"
  end
  
  Client.load_extension(Collect_msg)
  Client.run(Dotenv.parse(".env")["TOKEN"])
end
