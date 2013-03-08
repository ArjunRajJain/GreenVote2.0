module RoomsHelper
	def getName(name)
    return Building.find(name).name
  end
end
