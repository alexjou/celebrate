class Trip < ActiveRecord::Base

  # Callbacks
  before_save :md_to_html

  # Associations
  belongs_to :category
  belongs_to :admin

  # Validates
  validates :title, :description_md, :description_short, :category, :price, :picture, presence: true
  validates :price, numericality: { greater_than: 0 }
  
  # gem money-rails
  monetize :price_cents

  # paperclip
  has_attached_file :picture, styles: { large: "850x300#", medium: "320x150#", thumb: "100x100#" }, default_url: "images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # Scope
  scope :descending_order, ->(page) { order(created_at: :desc).page(page).per(6) }
  scope :by_category, ->(id) {where(category: id)}

  scope :search, ->(term, page) {where("lower(title) LIKE ?", "%#{term.downcase}%").page(page).per(6)}


  private
    def md_to_html
      options = {
        filter_html: true,
        link_attributes: {
          rel: "nofollow",
          target: "_blank"
        }
    }
    
    extensions = {
      space_after_headers: true,
      autolink: true
    }
    
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    self.description = markdown.render(self.description_md)
  
  end
  

end
