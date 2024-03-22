class Comment < ApplicationRecord
  # include "visible" concern as a module
  include Visible

  # belongs_to sets up an Active Record Association -> One comment belongs to one article (1 to 1 relationship)
  belongs_to :article
end
