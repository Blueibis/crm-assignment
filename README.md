# Customer Relationship Manager (CRM) Assignment

[See assignment in Alexa.](https://alexa.bitmaker.co/cohorts/67/assignments/2027/latest)

Test log:
originally 1 failure 1 error
fixed by 

def self.find(id)
@@contacts.each do |contact|
contact if contact.id == id
end
end

into(added return)

def self.find(id)
@@contacts.each do |contact|
return contact if contact.id == id
end
end

fixed by 

def self.find_by(attribute, value)
@@contacts.each do |contact|
contact.send(attribute) == value
end
end

into(added return if)

def self.find_by(attribute, value)
@@contacts.each do |contact|
return contact if contact.send(attribute) == value
end
end
