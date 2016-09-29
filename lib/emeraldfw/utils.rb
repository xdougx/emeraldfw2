require 'colorize'

module EmeraldFW

  #
  # Validating the command line
  # 

  def self.command_exists?
  	@commands.include?(@command)
  end  

  def self.entity_exists?
  	@entities.include?(@entity)
  end

  #
  # Directory
  # 

  def self.emerald_projects_dir
    "#{ENV['HOME']}/emeraldfw"
  end

  #
  # projects.json configuration file
  #   

  def self.config_file_generate
    config_file_save({ :current => "", :projects => [] })
  end

  def self.config_file_save(content)
    File.open(emerald_config_file,"w") do |f|
      f.write(JSON.pretty_generate(content))
    end
  end

  def self.config_file
    JSON.load(File.read(emerald_config_file))
  end

  def self.emerald_config_file
    "#{emerald_projects_dir}/projects.json"
  end  

  # 
  # Messages
  # 

  def self.usage
    print 'Usage: '.colorize(:light_green)
    puts  'emeraldfw (command) (entity) (name) options'
    puts
    puts  'Where: '.colorize(:light_green)
    print '  (command) = '
    @commands.each do |comm|
      print comm
      print comm != @commands.last ? ' | ' : ' '
    end
    puts 
    print '  (entity)  = '
    @entities.each do |ent|
      print ent
      print ent != @entities.last ? ' | ' : ' '
    end
    puts
    puts  '  (name)    = the name of the entity'
    puts
    puts  'And options include: '.colorize(:light_green)
    puts  '  --database  | -d [postgresql|mysql], which defaults to postgresql if ommited'
    puts  '  --test      | -t [test|rspec],       which defaults to rspec if ommited'
    puts  '  --language  | -l [ruby|python|php],  which defaults to ruby if ommited'
    puts  '  --archetype | -a [generic|blog|...], visit http://emeraldframework.net/archetypes for a full list of available archetypes'
    exit
  end  

  def self.emerald_name
    puts  EmeraldFW.full_version.colorize(:light_green)
    puts
    puts  '  Many programming languages'.colorize(:light_yellow)
    puts  '  One Framework to rule them all'.colorize(:light_yellow)
    puts  '  One Framework to find them'.colorize(:light_yellow)
    puts  '  One Framework to bring them all'.colorize(:light_yellow)
    puts  '  And in the Web bind them'.colorize(:light_yellow)
    puts
    print 'Copyright 2016 by '
    puts  'Ed de Almeida'.colorize(:light_blue)
    print 'Suggestions, bugs & congratulations: '
    puts  'emerald.framework@gmail.com'.colorize(:light_green)
  end  

end