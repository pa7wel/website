class Strona < ApplicationRecord
	belongs_to :kategorie
	has_many :artykuls

	scope :sortuj, lambda{order("stronas.pozycja ASC")}
	scope :widoczna, lambda{where(:widoczna => true)}
	scope :niewidoczna, lambda{where(:widoczna => false)}
	scope :najnowsza, lambda{order("stronas.created_at DESC")}

end
