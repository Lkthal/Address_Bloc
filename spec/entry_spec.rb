require_relative '../models/entry'
# #1
RSpec.describe Entry do
    # #2
    describe "attributes" do
        # #3
        let(:entry) {Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')}
        it "respond to name" do
            expect(entry).to respond_to(:name)
            end
        it "reports to name" do
            # #4
            expect(entry.name).to eq('Ada Lovelace')
        end
        
        it "respond phone number" do
            expect(entry).to respond_to(:phone_number)
            end
        
        it "reports its phone number" do
            expect(entry.phone_number).to eq('010.012.1815')
        end
        
        it "responds its email" do
            expect(entry).to respond_to(:email)
            end
        
        it "report its email" do
            expect(entry.email).to eq('augusta.king@lovelace.com')
        end
    end
    
    # #5
    describe "#to_s" do
        it "prints an entry as a string" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
            # #6
            expect(entry.to_s).to eq(expected_string)
        end
    end
end
