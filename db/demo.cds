 namespace kirandb;
 using { kirandb.commons as commons } from './commons';
 using { cuid, temporal, managed } from '@sap/cds/common';
 
 context master {
 
    // first table for storing students data
    //.INCLUDE address; // to include the aspect in the entity
    entity student: commons.address {
        key ID : commons.Guid;
        NAME : String(80);
        CLASS : Association to one standards;
        GENDER: String(1);
    }
    entity standards { 
        key ID : Int16;
        CLASSNAME: String(10);
        SECTIONS : Int16;
        CLASSTEACHER : String(80);
    }    
    entity books { 
        key ID : String(32);
        BOOKNAME: String(30);
        AUTHOR : String(80);
    }
 }

 context trans {
    entity rentals : cuid, temporal, managed {
        student: Association to  master.student;
        book: Association to  master.books;
    }
 }