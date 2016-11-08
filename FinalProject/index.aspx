<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="FinalProject.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contacts Page</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="scripts/knockout-3.4.0.js"></script>
</head>
<body>
    <form id="formIndex" runat="server">
    <div id="DivWrapper">
        <table class="contactsTable">
            <thead>
                <tr>
                    <th colspan="3">           
                        <h1>
                            Contacts
                        </h1>
                    </th>
                </tr>
                <tr>
                    <th>
                        Name
                    </th>
                    <th>
                        Email Addresses
                    </th>
                    <th>
                        Phone Numbers
                    </th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <td>
                        <button data-bind="click: addContact">Add a Contact</button>
                    </td>
                </tr>
            </tfoot>
            <tbody data-bind="foreach: contacts">
                <tr>
                    <td>
                        <input data-bind="value: name" />
                        <button data-bind="click: $root.removeContact">Delete</button>
                    </td>
                    <td>
                        <table>
                            <tbody data-bind="foreach: emails">
                                <tr>
                                    <td>
                                        <input data-bind="value: type" />
                                    </td>
                                    <td>
                                        <input data-bind="value: address" />
                                    </td>
                                    <td>
                                        <!--My issue arises here. This does seem to want to work.-->
                                        <button data-bind = "click: $root.removeEmail">Delete</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <button data-bind="click: $root.addEmail">Add an Email</button>
                    </td>
                    <td>
                        <table>
                            <tbody data-bind="foreach: phones">
                                <tr>
                                    <td>
                                        <input data-bind="value: type" />
                                    </td>
                                    <td>
                                        <input data-bind="value: number" />
                                    </td>
                                    <td>
                                        <!--I am having the same issue as above with this next line. 
                                            For some reason these remove functions are not working.-->
                                        <button data-bind="click: $root.removePhone">Delete</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <button data-bind="click: $root.addPhone">Add a Number</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <script src="scripts/ContactsViewModel.js"></script> 
    </form>
</body>
</html>
