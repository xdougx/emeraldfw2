module EmeraldFW

  class Resource < EmeraldFW::EntityBase

  	def initialize
  	  @valid_options = [ ]
  	  @command = EmeraldFW.arguments[0].to_sym
  	  super
    end
    
    def accepted_commands
      resource_accepted_commands
    end

    def add
    end

    def remove
    end

    def info
    end 

  end

end