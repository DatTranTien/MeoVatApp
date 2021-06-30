var express = require("express")

var bodyParser = require('body-parser')
var app = express()
let userService = require("./database/service")
app.use(bodyParser.urlencoded({ extended: false }))

var urlencodedParser = bodyParser.urlencoded({ extended: false })

var bodyParser = require('body-parser')

app.get("/getAllVideo", (req, res, next) => {
    userService.getAllVideo().then((data) => {
        res.json(data)
    }).catch((err) => {
        res.json(err)
    })
})

app.get("/getAllHealthy", (req, res, next) => {
    userService.getAllHealthy().then((data) => {
        res.json(data)
    }).catch((err) => {
        res.json(err)
    })
})
app.get("/getAllLaboratory", (req, res, next) => {
    userService.getAllLaboratory().then((data) => {
        res.json(data)
    }).catch((err) => {
        res.json(err)
    })
})
app.get("/getAllMagic", (req, res, next) => {
    userService.getAllMagic().then((data) => {
        res.json(data)
    }).catch((err) => {
        res.json(err)
    })
})
app.get("/getAllChildren", (req, res, next) => {
    userService.getAllChildren().then((data) => {
        res.json(data)
    }).catch((err) => {
        res.json(err)
    })
})
app.get("/getAllSchool", (req, res, next) => {
    userService.getAllSchool().then((data) => {
        res.json(data)
    }).catch((err) => {
        res.json(err)
    })
})

app.get("/searchValue/:name", (req, res, next) => {
    var name = req.params.name
    userService.searchByName(name).then((data) => {
        res.json(data)
    }).catch((err) => {
        res.json(err)
    })
})

app.get("/:id", (req, res, next) => {
    var id = req.params.id
    userService.getDataById(id).then((data) => {
        res.json(data)
    }).catch((err) => {
        res.json(err)
    })
})

app.post("/post", urlencodedParser, (req, res, next) => {
    var user = req.body.user
    var address = req.body.address
    userService.addNew(user, address).then((data) => {
        res.json(data)

    }).catch((err) => {
        res.json(err)
    })
})

app.put("/updateValue/:id", (req, res, next) => {
    var id = req.params.id
    var user = req.body.user
    var address = req.body.address

    userService.update(id, user, address).then((data) => {
        res.json("update")
    }).catch((err) => {
        res.json(err)
    })
})


app.delete("/deleteValue/:id", (req, res, next) => {
    var id = req.params.id
    userService.delete(id).then((data) => {
        res.json("delete")
    }).catch((err) => {
        res.json(err)
    })
})




app.listen(3000, () => {
    console.log("connect")
})