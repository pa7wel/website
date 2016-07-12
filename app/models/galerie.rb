class Galerie < ApplicationRecord
	has_many :zdjecies, class_name: "Zdjecie"

    has_attached_file :zdjecie, 
		    styles: { medium: "600x600>", thumb: "200x200>" }

  	validates_attachment_content_type :zdjecie, 
  			:content_type =>  /^image\/(png|git|jpeg)/,
  			:message => '--- akceptuje tylko pliki PNG GIF i JPEG ---'

  	validates_attachment_size :zdjecie,
  						:in => 0..1500.kilobytes,
  						:message => '--- za duzy plik, max rozmiar to 850 kB ---'

  	validates :nazwa,
  				:presence => true,
  				:length => {:maximum => 120, :message => "Za dlugi tytul galerii."}


	scope :sortuj, lambda{order("galeries.pozycja ASC")}
	scope :widoczna, lambda{where(:widoczna => true)}
	scope :niewidoczna, lambda{where(:widoczna => false)}
	scope :najnowszy, lambda{order("galeries.created_at DESC")}

end
