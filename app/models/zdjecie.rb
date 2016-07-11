class Zdjecie < ApplicationRecord
	belongs_to :galerie


has_attached_file :zdjecie, 
		styles: { medium: "600x600>", thumb: "200x200>" }

  	validates_attachment_content_type :zdjecie, 
  			:content_type =>  /^image\/(png|git|jpeg)/,
  			:message => '--- akceptuje tylko pliki PNG GIF i JPEG ---'

  	validates_attachment_size :zdjecie,
  						:in => 0..5500.kilobytes,
  						:message => '--- za duzy plik, max rozmiar to 850 kB ---'

  	validates :nazwa,
  				:presence => true,
  				:length => {:maximum => 120, :message => "Za dlugi tytul galerii."}


	scope :sortuj, lambda{order("zdjecies.pozycja ASC")}
	scope :widoczne, lambda{where(:widoczne => true)}
	scope :niewidoczna, lambda{where(:widoczne => false)}
	scope :najnowszy, lambda{order("zdjecies.created_at DESC")}


end
