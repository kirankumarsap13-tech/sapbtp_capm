module.exports = cds.service.impl(async function(){
    const {POs} = this.entities;
    this.on('boost', async(req) => { 
        console.log("Boost");
        try {
            const ID = req.params[0];
        // Start a DB Transaction
        const tx = cds.tx(req);
        //CDS Query Language - Communicate DB in agnostic manner
        await tx.update(POs).with({
            GROSS_AMOUNT: { '+=' : 20000 }
        }).where(ID);            
        } catch (error) {
            return "Error " + error.toString();  
        }

    });
this.on('largestOrder', async(req) => { 
        console.log("Boost");
        try {
            const ID = req.params[0];
        // Start a DB Transaction
        const tx = cds.tx(req);
        //Read PO with highest Gross Amount
        //Sort PO in descending Order by GROSS AMOUNT and read the 1st record
        const recordData =tx.read(POs).orderBy({
            GROSS_AMOUNT: 'desc'
        }).limit(1);          
        } catch (error) {
            return "Error " + error.toString();  
        }

    });

});