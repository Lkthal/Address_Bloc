require_relative '../models/address_book'

RSpec.describe AddressBook do
    
    let(:book) { AddressBook.new}
    
    def check_entry(entry, expected_name, expected_number, expected_email)
        expect(entry.name).to eq expected_name
        expect(entry.phone_number).to eq expected_number
        expect(entry.email).to eq expected_email
    end
    
    
    describe "attributes" do
        it "responds to entries" do
            expect(book).to respond_to(:entries)
        end
        
        it "initializes entries as an array" do
            expect(book.entries).to be_an(Array)
        end
        
        it "initializes entries as empty" do
            expect(book.entries.size).to eq(0)
        end
    end
    
    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            
            expect(book.entries.size).to eq(1)
        end
        
        it "adds the correct information to entries" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]
            
            expect(new_entry.name).to eq('Ada Lovelace')
            expect(new_entry.phone_number).to eq('010.012.1815')
            expect(new_entry.email).to eq('augusta.king@lovelace.com')
        end
    end
    
    describe "#remove_entry" do
        it "remove only one entry to the address book" do
            book.add_entry('Luna Lovegood', '010.012.1225', 'Luna.Lovegood@Hogwart.edu')
            
            name = 'Ada Lovelace'
            phone_number =  '010.012.1815'
            email ='augusta.king@lovelace.com'
            book.add_entry(name, phone_number,email)
            
            expect(book.entries.size).to eq(2)
            
            book.remove_entry(name, phone_number, email)
            expect(book.entries.size).to eq(1)
            expect(book.entries.first.name).to eq("Luna Lovegood")
        end
    end
    
    #Test that AddressBook's .import_from_csv() Method is working
    describe "#import_from_csv" do
        it "imports the correct number of entries" do
            # #3
            book.import_from_csv("entries.csv")
            book.import_from_csv("entries_2.csv")
            book_size = book.entries.size
            
            # expect(book_size).to eq 5
        end
        
        it "imports the 1st entry" do
            book.import_from_csv("entries.csv")

            #check the first entry
            
            entry_one = book.entries[0]
            check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")

        end
        
        it "imports the 2nd entry" do
            book.import_from_csv("entries.csv")
            #check the 2nd entry
            
            entry_two = book.entries[1]
            check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
            
        end


        it "imports the 3rd entry" do
            book.import_from_csv("entries.csv")
            #check the 3rd entry
    
            entry_three = book.entries[2]
            check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
        end
        
        it "imports the 4th entry" do
            book.import_from_csv("entries.csv")
            #check the 4th entry
            
            entry_four = book.entries[3]
            check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")

        end
        
        
        it "imports the 5th entry" do
            book.import_from_csv("entries.csv")
            #check the 5th entry
            
            entry_five = book.entries[4]
            check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")

        end
        
        it "imports the 6th entry" do
            book.import_from_csv("entries_2.csv")
            #check the 6th entry
            
            entry_six = book.entries[0]
            check_entry(entry_six, "A-Chan", "555-555-5115", "achan@blocmail.com")
        end
        it "imports the 7th entry" do
            book.import_from_csv("entries_2.csv")
            #check the 7th entry
            
            entry_seven = book.entries[1]
            check_entry(entry_seven, "Chris", "555-555-8533", "chris@blocmail.com")
        end
        it "imports the 8th entry" do
            book.import_from_csv("entries_2.csv")
            #check the 8th entry
            
            entry_eight = book.entries[2]
            check_entry(entry_eight, "Jake", "555-555-3911", "jake@blocmail.com")
        end

    end

    #Test the binary_search method
    describe "#binary_search" do
        it "searches AddressBook for non-existent entry" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Dan")
            expect(entry).to be_nil
        end
        it "searches AddressBook for Bob" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Bob")
            expect(entry).to be_a Entry
            check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
        end
        
        it "searches AddressBook for Joe" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Joe")
            expect(entry).to be_a Entry
            check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
        end
        
        it "searches AddressBook for Sally" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Sally")
            expect(entry).to be_a Entry
            check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
        end
        
        it "searches AddressBook for Sussie" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Sussie")
            expect(entry).to be_a Entry
            check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
        end
        
        it "search AddressBook for Billy" do
            book.import_from_csv("entries.csv")
            entry=book.binary_search("Billy")
            expect(entry).to be_nil
        end

    end

    #Test the binary_search method
    describe "#binary_search" do
        it "searches AddressBook for non-existent entry" do
            book.import_from_csv("entries.csv")
            entry = book.iterative_search("Dan")
            expect(entry).to be_nil
        end
        it "searches AddressBook for Bob" do
            book.import_from_csv("entries.csv")
            entry = book.iterative_search("Bob")
            expect(entry).to be_a Entry
            check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
        end
    
        it "searches AddressBook for Joe" do
            book.import_from_csv("entries.csv")
            entry = book.iterative_search("Joe")
            expect(entry).to be_a Entry
            check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
        end
    
        it "searches AddressBook for Sally" do
            book.import_from_csv("entries.csv")
            entry = book.iterative_search("Sally")
            expect(entry).to be_a Entry
            check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
        end
    
        it "searches AddressBook for Sussie" do
            book.import_from_csv("entries.csv")
            entry = book.iterative_search("Sussie")
            expect(entry).to be_a Entry
            check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
        end
    
        it "search AddressBook for Billy" do
            book.import_from_csv("entries.csv")
            entry=book.iterative_search("Billy")
            expect(entry).to be_nil
        end
    
    end

    describe "#explosion" do
        it "should delete all entries" do
        book.add_entry("Sussie", "555-555-2036", "sussie@blocmail.com")
        book.add_entry("Sally", "555-555-4646", "sally@blocmail.com")
        book.add_entry("Joe", "555-555-3660", "joe@blocmail.com")
        
        book.explosion
        expect(book.entries.size).to eq 0
        
        end
    end


end















