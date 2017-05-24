class Contact
  attr_reader :id                                                       # => nil
  attr_accessor :first_name, :last_name, :email, :note                  # => nil
  @@contacts = []                                                       # => []
  @@id = 1                                                              # => 1
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note = "I'm a contact")
    @first_name = first_name                                            # => "Jennie",        "mouse"
    @last_name = last_name                                              # => "Li",            "keyboard"
    @email = email                                                      # => "email",         "emaiiemail"
    @note = note                                                        # => "I'm a contact", "I'm a contact"
    @id = @@id                                                          # => 1,               2
    @@id += 1                                                           # => 2,               3
  end                                                                   # => :initialize

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email)
    new_contact = Contact.new(first_name, last_name, email)  # => #<Contact:0x005620c9919408 @first_name="Jennie", @last_name="Li", @email="email", @note="I'm a contact", @id=1>,   #<Contact:0x005620c99137d8 @first_name="mouse", @last_name="keyboard", @email="emaiiemail", @note="I'm a contact", @id=2>
    @@contacts << new_contact                                # => [#<Contact:0x005620c9919408 @first_name="Jennie", @last_name="Li", @email="email", @note="I'm a contact", @id=1>], [#<Contact:0x005620c9919408 @first_name="Jennie", @last_name="Li", @email="email", @note="I'm a contact", @id=1>, #<Contact:0x005620c99137d8 @first_name="mouse", @last_name="keyboard", @email="emaiiemail", @note="I'm a contact", @id=2>]
    new_contact                                              # => #<Contact:0x005620c9919408 @first_name="Jennie", @last_name="Li", @email="email", @note="I'm a contact", @id=1>,   #<Contact:0x005620c99137d8 @first_name="mouse", @last_name="keyboard", @email="emaiiemail", @note="I'm a contact", @id=2>
  end                                                        # => :create

  # This method should return all of the existing contacts
  def self.all
    @@contacts  # => [#<Contact:0x005620c9919408 @first_name="Jennie", @last_name="Li", @email="email", @note="I'm a contact", @id=1>, #<Contact:0x005620c99137d8 @first_name="mouse", @last_name="keyboard", @email="emaiiemail", @note="I'm a contact", @id=2>], [#<Contact:0x005620c9919408 @first_name="Jennie", @last_name="Li", @email="email", @note="I'm a contact", @id=1>, #<Contact:0x005620c99137d8 @first_name="mouse", @last_name="keyboard", @email="emaiiemail", @note="I'm a contact", @id=2>]
  end           # => :all

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    result = nil                            # => nil
    @@contacts.each do |contact|            # => [#<Contact:0x005620c9919408 @first_name="Jennie", @last_name="Li", @email="email", @note="I'm a contact", @id=1>, #<Contact:0x005620c99137d8 @first_name="mouse", @last_name="keyboard", @email="emaiiemail", @note="I'm a contact", @id=2>]
      result = contact if contact.id == id  # => nil, #<Contact:0x005620c99137d8 @first_name="mouse", @last_name="keyboard", @email="emaiiemail", @note="I'm a contact", @id=2>
    end                                     # => [#<Contact:0x005620c9919408 @first_name="Jennie", @last_name="Li", @email="email", @note="I'm a contact", @id=1>, #<Contact:0x005620c99137d8 @first_name="mouse", @last_name="keyboard", @email="emaiiemail", @note="I'm a contact", @id=2>]
    result                                  # => #<Contact:0x005620c99137d8 @first_name="mouse", @last_name="keyboard", @email="emaiiemail", @note="I'm a contact", @id=2>
  end                                       # => :find

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
    case attribute              # => "first_name"
    when "first_name"
      self.first_name = value   # => "JenJen"
    when "last_name"
      self.last_name = value
    when "email"
      self.email = value
    when "note"
      self.note = value
    end                         # => "JenJen"
  end                           # => :update

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    @@contacts.select do |contact|
      contact.send(attribute) == value
    end
  end                                   # => :find_by

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end                  # => :delete_all

  def full_name
    "#{first_name} #{last_name}"  # => "JenJen Li"
  end                             # => :full_name

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end                        # => :delete

  # Feel free to add other methods here, if you need them.

end  # => :delete

jennie = Contact.create("Jennie", "Li", "email")           # => #<Contact:0x005620c9919408 @first_name="Jennie", @last_name="Li", @email="email", @note="I'm a contact", @id=1>
mouse = Contact.create("mouse", "keyboard", "emaiiemail")  # => #<Contact:0x005620c99137d8 @first_name="mouse", @last_name="keyboard", @email="emaiiemail", @note="I'm a contact", @id=2>
Contact.all                                                # => [#<Contact:0x005620c9919408 @first_name="Jennie", @last_name="Li", @email="email", @note="I'm a contact", @id=1>, #<Contact:0x005620c99137d8 @first_name="mouse", @last_name="keyboard", @email="emaiiemail", @note="I'm a contact", @id=2>]
Contact.find(2)                                            # => #<Contact:0x005620c99137d8 @first_name="mouse", @last_name="keyboard", @email="emaiiemail", @note="I'm a contact", @id=2>
Contact.all                                                # => [#<Contact:0x005620c9919408 @first_name="Jennie", @last_name="Li", @email="email", @note="I'm a contact", @id=1>, #<Contact:0x005620c99137d8 @first_name="mouse", @last_name="keyboard", @email="emaiiemail", @note="I'm a contact", @id=2>]
jennie.update("first_name", "JenJen")                      # => "JenJen"
jennie.full_name                                           # => "JenJen Li"
