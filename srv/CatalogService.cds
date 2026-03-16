using { kiran.db.master, kiran.db.transaction } from '../db/data-model';

service CatalogService @(path: 'CatalogService', requires: 'authenticated-user') {
   @capabilities: {Insertable,Updatable,Deletable}
   entity BusinessPartnerSet as projection on master.businesspartner;
   entity AddressSet as projection on master.address;
   
   entity EmployeesSet @(restrict: [
    { grant: 'READ', to: 'Viewer', where: 'bankName = $user.BankName' },
    { grant: 'WRITE', to: 'Admin' }
  ])
  as projection on master.employees;
   entity ProductSet as projection on master.product;   
   entity POs as projection on transaction.purchaseorder
   actions{
      action boost() returns POs;
      function largestOrder() returns POs;
   };   
   entity POItems as projection on transaction.poitems;

}