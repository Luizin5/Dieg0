require "discorb"
require_relative "generator/textgen"

class Collect_msg
  include Discorb::Extension

  def initialize v
    @m = Textgen::new(File.read("data/base.txt")) 
  end


  event :message do |msg|
    next if msg::author.bot?

    if [true,false].sample
      save(msg.to_s)
    else
      save(msg.to_s)
      msg.reply @m.generate_sentence
    end
  end


  slash("generate","generate a message",{
    "size" => {
      type: :integer,
      optional: true,
      description: "number of words"
     }
  }) do |i,size|

    if size == nil
      i.post(@m.generate_sentence(rand(0..20)),ephemeral: false)
    else
      i.post(@m.generate_sentence(size),ephemeral: false)
    end

  end

  def save(txt)

    File.open("data/base.txt","a") do |f|
      f.write txt.downcase,"\n"
    end

  end
end
