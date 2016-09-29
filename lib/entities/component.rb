module EmeraldFW

  class Component < EmeraldFW::EntityBase

    def initialize(args,opts)
      @valid_options = [ :jslibs ]
      @arguments = args
      @options = purified_options(opts)
      @project_name = @arguments.shift
    end

    def create
      puts "Component.create"
    end

    def delete
      puts "Component.delete"
    end

    def info
      puts "Component.info"      
    end

  end

end