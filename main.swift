/*TWO DIFFERENT STRING TYPES FOR OUR ENGLISH TEXT MESSAGE
UNCOMMENT ONLY ONE TO KEEP CODE FROM BREAKING*/

/*Asks user for input for a statement to encode in morse*/
print("Please enter a word/statement(without punctuation) to decypher into morse code: ")
var encryptThis = readLine()!

// Defined string to encode into morse
// var encryptThis = "Hello World"

// morse code to decrypt to english text
var decryptThis = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-."

// Dictionary of letters and their corresponding translation in morse
// kept all key letters lowercased, so we have to force lowercase letters
// when iterating through our strings(Line 58)
var morseCode = [
  "a": ".-",
  "b": "-...",
  "c": "-.-.",
  "d": "-..",
  "e": ".",
  "f": "..-.",
  "g": "--.",
  "h": "....",
  "i": "..",
  "j": ".---",
  "k": "-.-",
  "l": ".-..",
  "m": "--",
  "n": "-.",
  "o": "---",
  "p": ".--.",
  "r": ".-.",
  "s": "...",
  "t": "-",
  "u": "..-",
  "v": "...-",
  "w": ".--",
  "x": "-..-",
  "y": "-.--",
  "z": "--..",
  "0": "-----",
  "1": ".----",
  "2": "..---",
  "3": "...--",
  "4": "....-",
  "5": ".....",
  "6": "-....",
  "7": "--...",
  "8": "---..",
  "9": "----.",
]

// Encrypting a message
var temp = ""
// Since my dictionary's key's are all lower case, we have to set our original string to 
// lowercased() so it knows to check the capital letter still
var setLower = encryptThis.lowercased()
// instead of using the "encryptThis" variable to run our loop, we'll use our forced 
// lowercased "setLower" string to run the loop
for letter in setLower {
  // checking to see if letter is in the dictionary
  if let tempChar = morseCode["\(letter)"] {
    // if found, append the letter to the temp string, and one space for next letter
    temp += tempChar + " "
  } else {
    // otherwise " / " for next word
    temp += " / "
  }
}
print(temp)

var secretMessage = [String]()
var decodeMe = ""
var mTracker = ""
for letter in decryptThis {
 //  print(letter)
  if letter != " " {
    mTracker.append(letter)
    //print(mTracker)
  } else {
    switch mTracker {
      case "":
        mTracker += " "
        // print(mTracker)

      case " ":
        secretMessage.append(" ")
        mTracker = ""
        //print(mTracker)
      default:
        secretMessage.append(mTracker)
        //print(mTracker)
        mTracker = ""
    }
  }
  
}
secretMessage.append(mTracker)

var dotsToWords: [String: String] = [:]
for(dots, letters) in morseCode {
  dotsToWords[letters.lowercased()] = dots.lowercased()
  // print(dotsToWords)
}
for value in secretMessage {
  if let mLetter = dotsToWords[value] {
   // mLetter.lowercased()
    decodeMe += mLetter
    //print(decodeMe)
  } else {
    decodeMe += " "
    // print(decodeMe)
  }
  // print(decodeMe)
}
print(decodeMe)
// print(dotsToWords)