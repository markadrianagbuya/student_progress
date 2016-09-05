require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it { is_expected.to have_many(:classrooms) }
  it { is_expected.to have_many(:students).through(:classrooms) }
end
