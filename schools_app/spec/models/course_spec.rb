describe Course, type: :model do
  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:school) }

  it { should validate_presence_of(:description) }

  it { should validate_presence_of(:content) }
end
