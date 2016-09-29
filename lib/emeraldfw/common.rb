module EmeraldFW
  class Common

  	def generated_commands
  	  @valid_entities.map{ |e| "emeraldfw #{self.class.to_s.downcase.split('::').last} #{e} <#{e}_name>" }
  	end

  end
end