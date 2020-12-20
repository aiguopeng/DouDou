import { LightningElement, wire } from 'lwc';
import FirstName_FIELD from '@salesforce/schema/Contact.FirstName';
import LastName_FIELD from '@salesforce/schema/Contact.LastName';
import Title_FIELD from '@salesforce/schema/Contact.Title';
import Phone_FIELD from '@salesforce/schema/Contact.Phone';
import Email_FIELD from '@salesforce/schema/Contact.Email';
import getContactList from '@salesforce/apex/ContactController.getContactList';

const columns = [
    { label: 'First Name', fieldName: FirstName_FIELD.fieldApiName, type: 'text' },
    { label: 'Last Name', fieldName: LastName_FIELD.fieldApiName, type: 'text' },
    { label: 'Title',fieldName: Title_FIELD.fieldApiName,type: 'text' },
    { label: 'Phone', fieldName: Phone_FIELD.fieldApiName, type: 'phone' },
    { label: 'Email', fieldName: Email_FIELD.fieldApiName, type: 'Email' }
];
export default class ApexDatatableExample extends LightningElement {

   // error;
    columns = columns;
    @wire(getContactList)
    Contacts;

}
