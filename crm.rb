require_relative 'contact.rb'  # => true
class CRM

  def initialize(name)
    @name = name                                 # => "My New App"
    puts "Okay, this CRM has the name #{@name}"  # => nil
  end                                            # => :initialize

  def main_menu
    while true # repeat indefinitely
        print_main_menu
        user_selected = gets.to_i
        call_option(user_selected)
      end
  end                               # => :main_menu

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end                                      # => :print_main_menu

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit
    end
  end                                      # => :call_option


  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp
    print 'Enter Last Name: '
    last_name = gets.chomp
    print 'Enter Email Address: '
    email = gets.chomp
    print 'Enter a Note: '
    note = gets.chomp
    Contact.create(first_name, last_name, email, note)
  end                                                   # => :add_new_contact

  def modify_existing_contact
    puts "Who are you updating?"
    name = gets.chomp
    name.capitalize!
    puts "Which attribute are you changing?"
    attribute = gets.chomp
    attribute.downcase!
    puts "And what are you changing it to?"
    value = gets.chomp
    Contact.update(name, attribute, value)
    puts "Changes made"
  end  # => :modify_existing_contact

  def delete_contact
    puts "Are you removing a contact by their ID or something else?"
    result = gets.chomp
    result.downcase!
    if result == "id"
      puts "Enter the id now"
      eyed = gets.to_i
      Contact.delete_by_id(eyed)
      puts "Deleted #{Contact.find(eyed)}from contact list."
    else
      puts "What attribute do you want to search by?\n[first_name]\n[last_name]\n[email]\n[note]"
      attribute = gets.chomp
      puts "Who are you searching for?"
      value = gets.chomp
      value.capitalize!
      Contact.delete_by_attribute(attribute, value)
      puts "#{Contact.find_by(attribute, value)} has been deleted from contact list."
    end
  end                                                                                              # => :delete_contact

  def display_all_contacts
    puts Contact.all.inspect
  end                       # => :display_all_contacts

  def search_by_attribute
    puts "What attribute do you want to search by?\n[first_name]\n[last_name]\n[email]\n[note]"
    attribute = gets.chomp
    puts "Who are you searching for?"
    value = gets.chomp
    value.capitalize!
    Contact.find_by(attribute, value)
    puts Contact.find_by(attribute, value)
  end                                                                                            # => :search_by_attribute


end                                                        # => :search_by_attribute

                          # => #<CRM:0x005560839ad768 @name="My New App">


# >> Okay, this CRM has the name My New App
