class Tin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"

end
