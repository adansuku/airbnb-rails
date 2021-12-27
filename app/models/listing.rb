# == Schema Information
#
# Table name: listings
#
#  id            :bigint           not null, primary key
#  host_id       :bigint           not null
#  title         :string(255)      not null
#  about         :text(65535)
#  max_guest     :integer          default(1)
#  address_line1 :string(255)
#  address_line2 :string(255)
#  city          :string(255)
#  state         :string(255)
#  postal_code   :string(255)
#  country       :string(255)
#  lat           :decimal(10, 6)
#  lng           :decimal(10, 6)
#  status        :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Listing < ApplicationRecord
    #validaciones
    validates :title, presence: true
    enum status: [:draft, :publish, :archived]
    validates_numericality_of :max_guest, :only_integer => true, :greater_than => 0, :less_than_or_equal_to => 101 
    #asociamos el campo host a la clase usuario
    belongs_to :host, class_name: 'User'
    
end
