module EmeraldFW
  class Create < EmeraldFW::CommandBase

  	def initialize(entity,args,opts)
  	  @valid_entities = creatable_and_deletable_entities
      super(entity,args,opts)
  	end

  end
end