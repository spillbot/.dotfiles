console.log("String reverser");
const x = process.argv [2]; // gets the first user input after the filename



// loop over the String
function reverseString(x) {
    const y = []; // this will hold the characters
    for (let i = 0; i < x.length; i++) {
        y.push(x[i]); // add each character to an array y 
        // console.log(y[i]); // optional deubg - log the character just added
    }
    const z = y.reverse();
    console.log(z.join(""));
}

reverseString(x); // call the function with terminal input



 