const cds = require('@sap/cds');
const { employees } = cds.entities("kiran.db.master");
module.exports = (srv) => {

    srv.on('pokemon', req => `Hello ${req.data.name}`);
    srv.on('READ', 'ReadEmployeeSrv',async(req) => {
        return{
            "ID": "222-222",
            "nameFirst": "Pikachu"

        }
    });
}
