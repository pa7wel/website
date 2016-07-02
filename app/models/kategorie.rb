class Kategorie < ApplicationRecord
	has_many :stronas

	scope :widoczna, lambda{where(:widoczna => true)}
	scope :niewidoczna, lambda{where(:widoczna => false)}

	scope :sortuj, lambda{order("kategories.pozycja ASC")}

	scope :sortuj, lambda{order("kategories.created_at DESC")]}

end
