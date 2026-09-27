class Task < ApplicationRecord
  # validates :name, presence: true

  # Association - Also a validation
  belongs_to :user
end

# Method 1
# turn off all validations - able to create the object without any attributes

# Method 2
# Use the || (pipes) to add a default value, if there's no params for that attirbute/s

# Method 3
# Use the faker gem to have faker create real-ish values for your attribute/s