class SupportRequest < ActiveRecord::Base
  validates :name, presence: {message: "Please submit a name!"}, uniqueness: false
  validates :email, presence: {message: "Please submit an email address!"}

  before_save :set_keywords

  scope :search, -> (search_word) {
    if search_word.present?
      where("keywords LIKE ?", "%#{search_word.downcase}%")
    end
  }

  #Makes the search data column
  def set_keywords
    self.keywords = [name, email, message].map(&:downcase).join(" ")
  end

end