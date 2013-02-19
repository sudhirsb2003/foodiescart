class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  has_attached_file :photo,
     :styles => {
       :thumb=> "100x100",
       :small  => "400x400",
       :medium => "600x600",
       :profile => "800x600" }



end



