require 'rails_helper'

RSpec.describe Classroom, type: :model do
  it { is_expected.to have_many(:students) }
end
