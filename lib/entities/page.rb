module EmeraldFW

  class Page < EmeraldFW::EntityBase

    def initialize(args,opts)
      @valid_options = [ :jslibs ]
      @arguments = args
      @options = purified_options(opts)
      @project_name = @arguments.shift
    end

    def create
      puts "Page.create"
    end

    def delete
      puts "Page.delete"
    end

    def info
      puts "Page.info"      
    end

  end

end