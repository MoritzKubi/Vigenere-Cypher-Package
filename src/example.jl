using VigenereCypher.UserInput, VigenereCypher.VigCyFuncs

function main()
    inputs = userInput()
    message = inputs[1]
    key = inputs[2]
    methode = inputs[3]

    newKEy = fitKey(message, key)

    if methode == 'e'
        output = encode(message, newKEy)
        print(mkString(output))

    elseif methode == 'd'
        output = decode(message, newKEy)
        print(mkString(output))
    end
end

main()