class TrailSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :city,
             :state,
             :country,
             :lat,
             :lng,
             :description,
             :directions,
             :length
  has_many :activities

  def length
    if object.activities.any?
      "#{object.activities.first.length} miles"
    else
      "unavailable"
    end
  end
end
