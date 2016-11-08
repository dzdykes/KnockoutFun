// Set up data that will populate the table initially
var InitialContacts = [
    {
        name: "Santa Claus",
        emails: [
            { type: "Personal", address: "JollyFella@gmail.com" },
            { type: "Business", address: "sclaus@scworkshop.com" }
        ],
        phones: [
            { type: "Mobile", number: "(123) 456 7890" },
            { type: "Home", number: "(908) 765 4321" }
        ]
    },
    {
        name: "Easter Bunny",
        emails: [
            { type: "Personal", address: "LovenHippityHop@gmail.com" },
            { type: "Business", address: "ebunny@ebeaster.com" }
        ],
        phones: [
            { type: "Mobile", number: "(555) 444 3333" },
            { type: "Home", number: "(333) 444 5555" }
        ]
    }
];

// Create a view model for a contacts application
var ContactsModel = function (contacts) {
    var self = this;

    //Create an observable array that will store contact information
    self.contacts = ko.observableArray(ko.utils.arrayMap(contacts, function (contact) {
        return {
            name: contact.name,
            emails: ko.observableArray(contact.emails),
            phones: ko.observableArray(contact.phones)
        };
    }));

    // Create a function that will add a contact to the table
    self.addContact = function () {
        self.contacts.push({
            name: "",
            emails: ko.observableArray(),
            phones: ko.observableArray()
        });
    };

    // Create a function for removing contacts from the table
    self.removeContact = function (contact) {
        self.contacts.remove(contact);
    };

    // Create a function for adding an email to a contact 
    self.addEmail = function (contact) {
        contact.emails.push({
            type: "",
            address: ""
        });
    };

    // Create a function for adding a phone number to a contact
    self.addPhone = function (contact) {
        contact.phones.push({
            type: "",
            number: ""
        });
    };

    // Create a function for removing an email from a contact
    /*******
        There is a problem with this function. It will not remove the email.
    ********/
    self.removeEmail = function (contact, email) {
        $.each(self.contacts(), function () { contact.emails.remove(email) })
    };

    // Creae a function for removing a phone number from a contact
    /******
        There is a problem with this function. It will not remove the phone numbers.
    *******/
    self.removePhone = function (phone) {
        $.each(self.contacts(), function () { this.phones.remove(phone) })
    };
};

ko.applyBindings(new ContactsModel(InitialContacts));