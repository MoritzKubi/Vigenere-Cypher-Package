module UserInput

    export userInput, mkString

    """
        userInput()

    Gather nescecary user input (message, encryption/decryption key, methode).

    Only allow accepted user input:
        Key must contain alphabetic characters only (no spaces)
        Methode can only be e...encode, d...decode
        Message can contain any character
    
    #Arguments
    -io::IO Input stream defaults to stdin (standard console input). 
            Can be replaced with IOBuffer for testing.
    
    #Returns
    -output::Vector{input::Vector{Char}, key::Vector{Char}, mthd::Char}
    """
    function userInput(io=stdin)
        input = []
        key = []

        mthd::Char = 't'
        read_input::String = ""
        read_key::String = ""

        while true
            println("\n\nChose a methode: \n encode: [e]\n decode: [d]\n")
            
            inp = readline(io)

            if length(inp) == 1
                mthd = only(inp)
            end

            if mthd in ['e', 'd']        #check if mode is correct
                break
            else
                println("VALUE ERROR: Input must be Char: [e], [d]")
            end
            
        end

        while true
            println("Enter a message: ")
            read_input = readline(io)
            break
        end

        while true
            println("Enter an encryption key: ")
            read_key = readline(io)
            
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

    #Arguments
    -message::Vector{Char}

    #Returns
    -messageString::String
    """
    function mkString(message)
        messageString = join(message)

        return messageString
    end

end