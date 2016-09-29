module EmeraldFW

  class Email < EmeraldFW::EntityBase

    def initialize(args,opts)
      @valid_options = [ :jslibs ]
      @arguments = args
      @options = purified_options(opts)
      @project_name = @arguments.shift
    end

    def create
      puts "Email.create"
    end

    def delete
      puts "Email.delete"
    end

    def info
      puts "Email.info"      
    end

  end

end