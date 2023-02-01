// app.js 
const express = require('express');
const app = express();
const con = require('./config');
const bp = require('body-parser');
const path=require('path');
const alert = require('alert');
const confirm = require('confirm');
const url = require('url');
// const query = require('query')
// const popup = require('popups');
const { response } = require('express');
const session = require('express-session');
const flash = require('connect-flash');

const router = express.Router();
var obj = {};

app.set('views',path.join(__dirname,'views'));
app.set('view engine','ejs');



app.use(bp.json());
app.use(bp.urlencoded({ extended:true }));
app.use(express.json());
app.use(express.urlencoded( {extended:true}));

app.use(express.static(path.join(__dirname, 'public')));

app.use(session({
    secret : 'rentallink',
    cookie : {maxAge : 60000},
    saveUninitialized : false,
    resave : false
}))
app.use(flash());





app.get('/signup',(req,res)=>{
    res.render('signup.ejs');
    
});

app.get('/login.html',(req,res)=>{
    res.render('login.ejs');
    
});

app.get('/tenant',(req,res)=>{
    res.render('tenant.ejs');
    
});

app.get('/home',(req,res)=>{
    res.render('home.ejs');
    
});

app.get('/tenantsignup',(req,res)=>{
    res.render('tenantsignup.ejs');
})

app.get('/ownersignup',(req,res)=>{
    res.render('ownersignup.ejs');
})

app.get('/tenantlogin',(req,res)=>{
    res.render('tenantlogin');
})

app.get('/ownerlogin',(req,res)=>{
    res.render('ownerlogin.ejs');
})

app.get('/tenant',(req,res)=>{
    res.render('tenant.ejs');
})

app.get('/',(req,res)=>{
    res.render('home');
})

app.get('/contact',(req,res)=>{
    res.render('contact');
})

// app.get('/ownerprofile',(req,res)=>{
//     res.render('ownerprofile');
// })




app.post('/tenantsignup',(req,res)=>{
    console.log(req.body);
    const name = req.body.name;
    const username = req.body.username;
    const email_ID = req.body.emailid;
    const contact = req.body.ph;
    const pwd = req.body.pass;
    var sqlee = "SELECT * FROM signup where username = '"+username+"' ";
    con.query(sqlee,function(error,result2){
        if(name == ''||username == ''||email_ID == ''||contact == ''||pwd == ''){
            alert("Please enter all the details");
        }
        else if(result2.length>0){
            alert("Username not available")
        }
       else{
       var sql = "INSERT INTO signup(name,username,email_ID,contact,pwd)VALUES('"+name+"','"+username+"','"+email_ID+"','"+contact+"','"+pwd+"')";
            con.query(sql,function(err,result){
                if(err) {console.log("ayyo");}
                alert("registration successfull");
                res.redirect('/tenantlogin');
            })
        }
    })
   
        // res.send("Registration successful");
    //    res.send("ok registered");
    })
    
app.post('/tenantlogin',(req,res)=>{
    var username = req.body.username;
    var pwd = req.body.password;
    if(username && pwd){
        con.query('select * from signup where username = ? and pwd = ?',[username,pwd],(err,result,fields)=>{
            if(result.length>0){
                // req.flash('message', 'Login Successful');
                res.redirect('/listofrooms');
                // console.log(username,pwd);
            }
            else{
                alert("Incorrect Username and Password");
            }
        });
    }
    else{
        alert("Please enter Username and Password");
    }
})


// router.get("/tenant",(req,res,next)=>{
//     var query = "select Name,landmark,Address from pg ";
//     con.query(query,(err,data)=>{
//         if(err){throw error;}
//         else{
//             obj = {print:res};
//             // res.render('listofrooms',{action:"list",sampleData:data});
//             res.render('print',obj);
//         }
//     });
// })

app.get("/roomlist",function(req,res){
    var sql = "select Name,landmark,Address from pg";
    con.query(sql,function(err,result){
        if(err){console.log(err)};
        res.render("./roomlist",{Room:result});
    })
})

app.get("/listofrooms",function(req,res){
    var sql = "select Name,landmark,Address from pg";
    con.query(sql,function(err,result){
        if(err){console.log(err)};
        res.render("./listofrooms",{Room:result});
    })
})

app.get('/search',function(req,res){
    var landmark = req.query.landmark;
    var sql = "select * from pg where landmark like '%"+landmark+"'";
    con.query(sql,function(err,result){
        if(err) {console.log(err)}
        res.render('./listofrooms',{Room:result});
    })
})

app.get("/flatlist",function(req,res){
    var sql = "select Name,landmark,address from flat";
    con.query(sql,function(err,result){
        if(err){console.log(err)};
        res.render("./flatlist",{Room:result});
    })
})

app.get('/searchflat',function(req,res){
    var landmark = req.query.landmark;
    var sql = "select * from flat where landmark like '%"+landmark+"'";
    con.query(sql,function(err,result){
        if(err) {console.log(err)}
        res.render('./flatlist',{Room:result});
    })
})

app.post('/ownersignup',(req,res)=>{
    console.log(req.body);
    const name = req.body.name;
    const username = req.body.username;
    const email_id = req.body.emailid;
    const contact = req.body.ph;
    const pwd = req.body.pass;
    const address = req.body.address;

    var sqle = "SELECT * FROM ownersignup where username = '"+username+"' ";
    con.query(sqle,function(error,result1){
        if(name == ''||username == ''||email_id == ''||contact == ''||pwd == ''||address == ''){
            alert("Please enter all the details");
        }
        else if(result1.length>0){
            alert("Username not available")
        }
        else{
       var sql = "INSERT INTO ownersignup(name,username,email_ID,contact,pwd,address)VALUES('"+name+"','"+username+"','"+email_id+"','"+contact+"','"+pwd+"','"+address+"')";
            con.query(sql,function(err,result){
                if(err) {console.log("error");}
                alert("registration successfull");
                res.redirect('/ownerlogin');
            })
        }
    })
   
        // res.send("Registration successful");
    //    res.send("ok registered");
    })
    var uname;
    var pass;
    app.post('/ownerlogin',(req,res)=>{
         uname = req.body.username;
         pass = req.body.password;
        if(uname && pass){
            con.query('select * from ownersignup where username = ? and pwd = ?',[uname,pass],(err,result,fields)=>{
                if(result.length>0){
                    res.redirect('/ownerprofile');
                    // console.log(res);
               }
                else{
                    alert("Incorrect Username and Password");
                }
            });
        }
        else{
            alert("Please enter Username and Password");
        }
    })
    
    // app.post('/tenantlogin',(req,res)=>{
    //      var uname = req.body.username;
    //      var pass = req.body.password;
    //     if(username && pwd){
    //         con.query('select * from signup where username = ? and pwd = ?',[uname,pass],(err,result,fields)=>{
    //             if(result.length>0){
    //                 res.redirect('/listofrooms');
    //                 // console.log(username,pwd);
    //             }
    //             else{
    //                 alert("Incorrect Username and Password");
    //             }
    //         });
    //     }
    //     else{
    //         alert("Please enter Username and Password");
    //     }
    // })

    // app.get("/ownerprofile",function(req,res){
    //     var sql = "select * from owner where username = '"+uname+"' and pwd = '"+pass+"'; select * from pg";
    //     con.query(sql,function(err,result){
    //         if(err){console.log(err)};
    //         res.render("./ownerprofile",{o:result[0],Room:result[1]});
    //     })
    // })

    app.get("/ownerprofile",function(req,res){
        var sql = "select * from owner where username = '"+uname+"' and pwd = '"+pass+"'; select p.PG_ID,p.Name,p.landmark,p.Address from pg p,owner o where o.username = '"+uname+"' and o.Owner_ID=p.Owner_ID;select f.Flat_ID,f.Name,f.landmark,f.address from flat f,owner o where o.username='"+uname+"' and o.Owner_ID = f.Owner_ID";
        con.query(sql,function(err,result){
            if(err){console.log(err)};
            res.render("./ownerprofile",{o:result[0],Room:result[1],flat:result[2]});
        })
    })


    app.get('/pg:id', function (req, res) {
        var pid = req.params.id;
        console.log(pid);
        con.query(`SELECT * from pg where Name='${req.params.id}'`, function (error, results, fields) {
          if (error) throw error;
          if (results.length > 0) {
             res.render('roomdet',{Room:results});
          } else {
            console.log("Not found");
          }
        });
      })

      app.get('/flat:id', function (req, res) {
        var pid = req.params.id;
        console.log(pid);
        con.query(`SELECT * from flat where Name='${req.params.id}'`, function (error, results, fields) {
          if (error) throw error;
          if (results.length > 0) {
             res.render('flatdet',{Room:results});
          } else {
            console.log("Not found");
          }
        });
      })

      app.get('/deletepg',(req,res)=>{
        var sql = "delete from pg where PG_ID=?";

        var PG_ID = req.query.PG_ID;
        con.query(sql,[PG_ID],(err,result)=>{
            if(err) {console.log(error)}
            res.redirect('/ownerprofile');
        })
      })

      app.get('/deleteflat',(req,res)=>{
        var sql = "delete from flat where Flat_ID=?";

        var Flat_ID = req.query.Flat_ID;
        con.query(sql,[Flat_ID],(err,result)=>{
            if(err) {console.log(error)}
            res.redirect('/ownerprofile');
        })
      })

     
      

    

     

     
      var Owner_ID
      app.get('/addpg',(req,res)=>{

        Owner_ID = req.query.Owner_ID;
        console.log(Owner_ID)
        res.render('addpg')
      })

      app.get('/addflat',(req,res)=>{

        Owner_ID = req.query.Owner_ID;
        console.log(Owner_ID)
        console.log(req.query)
        res.render('addflat')
    })
    var P_ID
    app.get('/updatepg',(req,res)=>{
        P_ID = req.query.PG_ID;
        console.log(P_ID)
        res.render('updatepg')
      })

      

      app.post('/addpg',(req,res)=>{
        console.log(req.body);
        const Name = req.body.Name;
        const landmark = req.body.landmark;
        const No_Rooms = req.body.Noofrooms;
        const Rooms_Filled = req.body.roomsfilled;
        const Rooms_vac = req.body.roomsvac;
        const Address = req.body.address;
        const facilities = req.body.facilities;
        const foods = req.body.food;
        const contact = req.body.contact;
        var sql = "INSERT INTO pg(Name,landmark,No_Rooms,Rooms_Filled,Rooms_vac,Address,facilities,foods,Owner_ID,contact)VALUES('"+Name+"','"+landmark+"','"+No_Rooms+"','"+Rooms_Filled+"','"+Rooms_vac+"','"+Address+"','"+facilities+"','"+foods+"','"+Owner_ID+"','"+contact+"')";
            con.query(sql,function(err,result){
                if(err) throw err;
                alert("pg added");
                res.redirect('/ownerprofile');
            })
            // res.send("Registration successful");
        //    res.send("ok registered");
        })
        
       

        app.post('/addflat',(req,res)=>{
            console.log(req.body);
            const Name = req.body.Name;
            const landmark = req.body.landmark;
            const contact = req.body.contact;
            const address = req.body.address;
            const type = req.body.type;
            console.log(req.query);
            var sql = "Insert into flat(Name,landmark,contact,address,type,Owner_ID)values('"+Name+"','"+landmark+"','"+contact+"','"+address+"','"+type+"','"+Owner_ID+"')";
            con.query(sql,function(err,result){
                if(err) throw err;
                alert("flat added");
                res.redirect('/ownerprofile');
            })
        })

        app.post('/updatepg',(req,res)=>{
            const Name = req.body.Name;
            const landmark = req.body.landmark;
            const Noofrooms = req.body.Noofrooms;
            const roomsfilled = req.body.roomsfilled;
            const roomsvac = req.body.roomsvac;
            const address = req.body.address;
            const facilities = req.body.facilities;
            const food = req.body.food;
            con.query('CALL update_pg(?, ?, ?, ?, ?, ?, ?, ?, ?)',[Name,landmark,Noofrooms,roomsfilled,roomsvac,address,facilities,food,P_ID], (error, results) => {
                if (error) throw error;
                res.redirect('/ownerprofile')
                // console.log(results[0][0].message);
            });
            }) //update
        
        var FID
         app.get('/updateflat',(req,res)=>{

                FID = req.query.Flat_ID;
                console.log(FID)
                res.render('updateflat')
        })
        app.post('/updateflat',(req,res)=>{
            const Name = req.body.Name;
            const landmark = req.body.landmark;
            const contact = req.body.contact;
            const address = req.body.address;
             const type = req.body.type;
             console.log(FID)
             console.log(req.query)
            con.query('CALL updateflat(?, ?, ?, ?, ?,?)',[Name,landmark,contact,address,type,FID], (error, results) => {
                if (error) throw error;
                res.redirect('/ownerprofile')
                // console.log(results[0][0].message);
            });
            }) //update
    
app.listen(3000);

