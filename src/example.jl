using VigenereCypher.UserInput, VigenereCypher.VigCyFuncs

"""
    main_example()

Run userinput in REPL allowing to encrypt/decrypt a custom message for a custom key
"""
function main_example()
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

main_example()