module EmeraldFW
  class EntityBase < EmeraldFW::Common

    def purified_options(opts)
      opts.reject { |k,v| { k => v } if not @valid_options.include?(k) }
    end

    def config_file_name
      (class_base_name_last_char == 'y') ? "#{base_name[0..(base_name.length-2)]}ies.json" : "#{base_name}s.json"
    end

    def class_base_name
      self.class.to_s.split('::').last.downcase
    end

    def class_base_name_last_char
      class_base_name[-1]
    end

    # 
    # Absolute directories
    # 
    
    def current_project_full_path
      "#{EmeraldFW.emerald_projects_dir}/#{@project_name}"
    end

  end
end