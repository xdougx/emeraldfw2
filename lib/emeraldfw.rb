require 'json'

require 'emeraldfw/common'
require 'emeraldfw/errormsgs'
require 'emeraldfw/utils'
require 'emeraldfw/version'

require 'commands/commandbase'
require 'commands/add'
require 'commands/create'
require 'commands/delete'
require 'commands/info'
require 'commands/remove'

require 'entities/entitybase'
require 'entities/component'
require 'entities/email'
require 'entities/form'
require 'entities/library'
require 'entities/page'
require 'entities/project'
require 'entities/resource'
require 'entities/template'

module EmeraldFW

  @commands = [ :add, :create, :delete, :remove, :info ].sort
  @entities = [ :component, :email, :form, :library, :page, :project, :resource, :template ].sort

  def self.emeraldfw_init
    FileUtils.mkdir_p(EmeraldFW.emerald_projects_dir) if not File.exist?(EmeraldFW.emerald_projects_dir)
    config_file_generate if not File.exist?(EmeraldFW.emerald_config_file)
  end

  def self.start(args,opts)
    # Initializes the framework workspace
    emeraldfw_init
    # Captures command line arguments and check if they are enough
  	@arguments = args
    exit_error(101) if (@arguments.length < 3)
    # Captures options hash
    @options = opts    
    # Isolates the command issued and check if it is valid
    @command = @arguments.shift.to_sym
  	exit_error(102,@commands) if not command_exists?
    # Isolates the entity to apply the command to and chack if it is valid
    @entity = @arguments.shift.to_sym
    exit_error(103,@entities) if not entity_exists?
    # Creates a reference to the command class
  	command_class = "EmeraldFW::#{@command.capitalize}".split('::').inject(Object) {|o,c| o.const_get c}.new(@entity,@arguments,@options)
    command_class.execute
  end



end
