using VigenereCypher.UserInput, VigenereCypher.VigCyFuncs


inputs = userInput()
message = inputs[1]
key = inputs[2]
methode = inputs[3]


newKEy = fitKey(message, key)
print(newKEy)

if methode == 'e'
    output = encode(message, newKEy)
    print(mkString(output))
end

if methode == 'd'
    output = decode(message, newKEy)
    print(mkString(output))
end