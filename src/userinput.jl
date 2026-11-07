module UserInput

    export userInput, mkString

    """
        userInput()

    Gather nescecary user input (message, encryption/decryption key, methode).
    """
    function userInput()
        input = []
        key = []

        mthd::Char = 't'
        read_input::String = ""
        read_key::String = ""

        while true
            println("Chose a methode: \n encode: [e]\n decode: [d]\n quit:   [q]")
            
            inp = readline()

            if length(inp) == 1
                mthd = only(inp)
            end

            if mthd in ['e', 'd', 'q']        #check if mode is correct
                break
            else
                println("VALUE ERROR: Input must be Char: [e], [d] or [q]")
            end
            
        end

        while true
            println("Enter a message: ")
            read_input = readline()
            break
        end

        while true
            println("Enter an encryption key: ")
            read_key = readline()
            
            if all(isletter, read_key)
                break
            else
                println("VALUE ERROR: Use letters only! (not allowed: 1, 2, 3, ...; !, §, %, ...; @, +, ><, ...)")
            end
        end

        for char in read_input
            push!(input, char)
        end

        for char in read_key
            push!(key, lowercase(char))
        end

        output = [input, key, mthd]

        return output
    end

    """
        mkString(message)

    Convert list of characters into a single string.
    """
    function mkString(message)
        messageString = join(message)

        return messageString
    end

end