using { kiran.db.master, kiran.db.transaction } from '../db/data-model';

service CatalogService @(path: 'CatalogService') {
   @capabilities: {Insertable,Updatable,Deletable}
   entity BusinessPartnerSet as projection on master.businesspartner;
   entity AddressSet as projection on master.address;
   
   entity EmployeesSet as projection on master.employees;
   entity ProductSet as projection on master.product;   
   entity POs as projection on transaction.purchaseorder
   actions{
      action boost() returns POs;
      function largestOrder() returns POs;
   };   
   entity POItems as projection on transaction.poitems;

}