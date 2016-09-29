module EmeraldFW
  class CommandBase < EmeraldFW::Common

    def initialize(entity,args,opts)
      @entity = entity.to_sym
      @arguments = args
      @options = opts
    end

  	def execute
  	  EmeraldFW.exit_error(103,generated_commands) if not @valid_entities.include?(@entity)
  	  entity_class = "EmeraldFW::#{@entity.capitalize}".split('::').inject(Object) {|o,c| o.const_get c}.new(@arguments,@options)
  	  entity_class.method(self.class.to_s.split('::').last.downcase).call
  	end

  	def creatable_and_deletable_entities
  	  [ :component, :email, :form, :page, :project, :template ].sort
  	end

  end
end