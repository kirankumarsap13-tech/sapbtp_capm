using { kirandb.master as master, 
        kirandb.trans as transaction } from '../db/demo';

service MyService {
entity StudentSet  as projection on master.student;
entity StandardsSet as projection on master.standards; 
entity BooksSet as projection on master.books;
entity BookRentalsSet as projection on transaction.rentals;
    

}
