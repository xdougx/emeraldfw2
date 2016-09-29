require 'zip'

module EmeraldFW
  class Project < EmeraldFW::EntityBase

  	def initialize(args,opts)
      @valid_options = [ :archetype, :database, :language, :test ]
      @arguments = args
      @options = purified_options(opts)
      @project_name = @arguments.shift
    end

    def create
      EmeraldFW.exit_error(201) if project_exists?
      FileUtils.mkdir_p(project_full_path)
      Zip::File.open(project_structure_zip) do |zip_file|
        zip_file.each do |entry|
          entry_arr = entry.name.split('/')
          base_dir = entry_arr.shift
          dest_file_name = entry_arr.join('/')
          dest_file = "#{project_full_path}/#{dest_file_name}".gsub('-ef-master','')
          puts dest_file
          FileUtils.rm_f(dest_file) if File.exist?(dest_file)
          entry.extract(dest_file)
        end
      end
      register_project
      integrations
    end

    def delete
      EmeraldFW.exit_error(202) if not project_exists?
      FileUtils.rm_rf(project_full_path)
      unregister_project
    end

    def info
      config = EmeraldFW.config_file
      if config['projects'].include?(@project_name) then
        print 'Project:       '
        puts @project_name.colorize(:light_green).bold
        print 'Current:       '
        is_current = (@project_name == config['current']) ? "yes".colorize(:light_green) : "no".colorize(:light_red)
        puts is_current.bold
        print 'Creation date: '
        puts config[@project_name]['creation_date'].colorize(:light_green).bold
        print 'Creation time: '
        puts config[@project_name]['creation_time'].colorize(:light_green).bold
      else
        EmeraldFW.exit_error(202)
      end
      # TODO: Project path
      # TODO: Templates
      # TODO: Pages
      # TODO: Libraries
    end

    def register_project
      config = EmeraldFW.config_file 
      config['projects'].push(@project_name)
      config['current'] = @project_name
      date, time = Time.new.to_s.split(' ')
      config[@project_name] = { :creation_date => date, :creation_time => time }
      EmeraldFW.config_file_save(config)
    end
    private :register_project

    def unregister_project
      config = EmeraldFW.config_file
      config['projects'].delete(@project_name)
      config['current'] = "" if config['current'] == @project_name
      config.delete(@project_name)
      EmeraldFW.config_file_save(config)
    end
    private :unregister_project

    def integrations
      # TODO: Initialize git repo inside of project_full_path
      # TODO: If Github integrated, create Githup repo for the project
      # TODO: If Github integrated, set remote repo for the project      
    end
    private :integrations

    def project_exists?
      Dir.entries(EmeraldFW.emerald_projects_dir).include?(@project_name)
    end
    private :project_exists?

    def project_full_path
      "#{EmeraldFW.emerald_projects_dir}/#{@project_name}"
    end
    private :project_full_path

    def project_structure_zip
      "files/appstructure-ef.zip"
    end
    private :project_structure_zip

  end
end