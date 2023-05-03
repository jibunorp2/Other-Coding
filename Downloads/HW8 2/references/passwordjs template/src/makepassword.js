'use strict'
const fs = require('fs');
const {readFile, writeFile, hash} = require('./utility')
const {createHash} = require("crypto");

function makepassword(passwordFileName, passwordEncFileName) {
    const data = readFile(passwordFileName) // replace fileName with passwordFileName

    function hash(input){ // replace input with passwordFileName
        try{
            return createHash('sha256').update(input).digest('hex');
        }
        catch (err){
            return err;
        }
    }
    var passes = [];
    var name = [];
        for (let i = 0; i < data.length; i++) {
            var doc = data[i].split(':')
            name.push(doc[0])
            passes.push(doc[1])
        }
        let j = 0;
        while (j < passes.length){
            passes[j] = hash(passes[j])
            j++
        }
     writeFile(passes, passwordEncFileName)


}

if (require.main === module) {
    makepassword('../password.txt', './password.enc.txt')
}

module.exports = {makepassword, hash};