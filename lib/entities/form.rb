module EmeraldFW

  class Form < EmeraldFW::EntityBase

    def initialize(args,opts)
      @valid_options = [ :jslibs ]
      @arguments = args
      @options = purified_options(opts)
      @project_name = @arguments.shift
    end

    def create
      puts "Form.create"
    end

    def delete
      puts "Form.delete"
    end

    def info
      puts "Form.info"      
    end

  end

end