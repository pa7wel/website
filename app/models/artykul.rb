class Artykul < ApplicationRecord
	belongs_to :strona


	has_attached_file :zdjecie, 
		styles: { medium: "600x600>", thumb: "200x200>" }

  	validates_attachment_content_type :zdjecie, 
  			:content_type =>  /^image\/(png|git|jpeg)/,
  			:message => '--- akceptuje tylko pliki PNG GIF i JPEG ---'

  	validates_attachment_size :zdjecie,
  						:in => 0..850.kilobytes,
  						:message => '--- za duzy plik, max rozmiar to 850 kB ---'

  	validates :nazwa,
  				:presence => true,
  				:length => {:maximum => 120, :message => "Za dlugi tytul artyk."}


	scope :widoczny, lambda{where(:widoczny => true)}
	scope :niewidoczny, lambda{where(:widoczny => false)}
	scope :sortuj, lambda{order("artykuls.pozycja ASC")}
	scope :najnowszy, lambda{order("artykuls.created_at DESC")}
end
