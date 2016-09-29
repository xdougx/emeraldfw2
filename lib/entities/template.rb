module EmeraldFW

  class Template < EmeraldFW::EntityBase

    def initialize(args,opts)
      @valid_options = [ :jslibs ]
      @arguments = args
      @options = purified_options(opts)
      @template_name = @arguments.shift
      @project_name = EmeraldFW.config_file['current']
    end

    def create
      puts "Template.create"
    end

    def delete
      puts "Template.delete"
    end

    def info
      puts "Template.info"      
    end

    def template_full_name
      "#{templates_full_path}/#{@template_name}.html"
    end
    private :template_full_name

    def templates_dir
      "#{current_project_full_path}/web/views/templates"
    end
    private :templates_full_path

  end

end