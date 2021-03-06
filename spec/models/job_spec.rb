require 'spec_helper'

describe Job do
  let(:job) { create(:job) }

  subject { job }

  it { should have_db_column(:title) }
  it { should have_db_column(:description) }
  it { should have_db_column(:company_name) }
  it { should have_db_column(:company_website) }
  it { should have_db_column(:how_to_apply) }
  it { should have_db_column(:approved) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:company_name) }
  it { should validate_presence_of(:how_to_apply) }

  specify { Job.should respond_to(:alive) }
  specify { Job.should respond_to(:approved) }
  specify { Job.should respond_to(:reversed) }

  describe "#approved!" do
    it "should mark the job as approved" do
      subject.update_attributes(:approved => false)
      subject.approved!
      subject.approved?.should == true
    end
  end
end
