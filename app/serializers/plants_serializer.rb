class PlantsSerializer < ActiveModel::Serializer
  attributes :id,
             :kingdom,
             :scientific_name,
             :common_name,
             :photo_url,
             :lat,
             :lng
end
