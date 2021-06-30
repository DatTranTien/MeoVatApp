const connection = require("../config/dbConfig");

connection.connect()
function getAllVideo() {
    return new Promise((resolve, reject) => {
        connection.query('select * from Video', (error, result, fields) => {
            if (error) {
                reject(error)
            }
            resolve(result)
        })
    })
}
function getAllHealthy() {
    return new Promise((resolve, reject) => {
        connection.query('select * from content where topic_id=1', (error, result, fields) => {
            if (error) {
                reject(error)
            }
            resolve(result)
        })
    })
}

function getAllLaboratory() {
    return new Promise((resolve, reject) => {
        connection.query('select * from content where topic_id=2', (error, result, fields) => {
            if (error) {
                reject(error)
            }
            resolve(result)
        })
    })
}

function getAllMagic() {
    return new Promise((resolve, reject) => {
        connection.query('select * from content where topic_id=3', (error, result, fields) => {
            if (error) {
                reject(error)
            }
            resolve(result)
        })
    })
}
function getAllChildren() {
    return new Promise((resolve, reject) => {
        connection.query('select * from content where topic_id=4', (error, result, fields) => {
            if (error) {
                reject(error)
            }
            resolve(result)
        })
    })
}
function getAllSchool() {
    return new Promise((resolve, reject) => {
        connection.query('select * from content where topic_id=5', (error, result, fields) => {
            if (error) {
                reject(error)
            }
            resolve(result)
        })
    })
}
function getDataById(id) {
    return new Promise((resolve, reject) => {
        connection.query(`select * from app where id=${id}`, (error, result, fields) => {
            if (error) {
                reject(error)
            }
            resolve(result)
        })
    })
}

function searchByName(name) {
    console.log(name)
    return new Promise((resolve, reject) => {
        connection.query(`select * from healthy  where title like '%${name}%' `, (error, result, fields) => {
            if (error) {
                reject(error)
            }
            resolve(result)
        })
    })
}



module.exports = {
    getAllHealthy: getAllHealthy,
    getAllLaboratory: getAllLaboratory,
    getAllMagic: getAllMagic,
    getAllChildren: getAllChildren,
    getAllSchool: getAllSchool,
    getAllVideo: getAllVideo,
    searchByName: searchByName

}