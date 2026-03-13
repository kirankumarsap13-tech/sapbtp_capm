using { kiran.cds } from '../db/CDSViews';
service MyService1 @(path: 'MyService1') {
    function pokemon(name: String(20)) returns String;
    entity ProductOrdersSet as projection on cds.CDSViews.ProductOrders{
        *,
        ProductOrders
    };
}