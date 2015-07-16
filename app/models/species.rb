class Species < ActiveRecord::Base
  belongs_to :trail

  scope :has_clip, -> {
    where.not(clip_url: ["not found", "not available"])
  }

  scope :not_bird_animal, -> {
    where(clip_url: ["not found", "not available"], kingdom: "Animalia")
  }
end
