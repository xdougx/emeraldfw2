module EmeraldFW
  class Add < EmeraldFW::CommandBase

  	def initialize
  	  @valid_entities = [ :library, :resource ].sort
  	end

    def execute(entity,args,opts)
      EmeraldFW.exit_error(103,generated_commands('add')) if not @valid_entities.include?(entity)
    end

  end
end