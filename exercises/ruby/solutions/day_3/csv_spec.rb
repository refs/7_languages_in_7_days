require_relative 'acts_as_csv_module'

RSpec.describe RubyCsv do
  it "implements the proposed api" do
      csv = RubyCsv.new
      csv.each do |row|
          expect(row.firstname).to eq("alex")
          expect(row.lastname).to eq("unger")
          expect(row.age).to eq("26")
      end
  end
end
