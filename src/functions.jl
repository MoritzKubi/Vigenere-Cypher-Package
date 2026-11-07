module VigCyFuncs

    export encode, decode, fitKey

    alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
    abc = Dict(alphabet[k] => k for k in 1:26)
    abc_reverse = Dict(k => alphabet[k] for k in 1:26)

    """
        fitKey(message, key)

    Line up the encryption key with the message.
    
    Skipp all spaces and special characters.
    """
    function fitKey(message, key)
        fittedKey = []

        j = 1
        for i in message
            
            if isletter(i)

                push!(fittedKey, key[j])

                if j == length(key)
                    j = 1

                else
                    j += 1

                end
            else
                push!(fittedKey, ' ')
            end
       
        end
        
        return fittedKey
    end

    """
        keepCaps(new_pos, cap_bool)

    Project capitalization from original message onto encrypted/decrypted message.
    """
    function keepCaps(new_pos, cap_bool)
        if cap_bool
            encrypted_char = uppercase(abc_reverse[new_pos])
        else
            encrypted_char = abc_reverse[new_pos]
        end

        return encrypted_char
    end

    
    """
        encode(message, key)

    Encrypt a given message via vigenere cypher with a given encryption key.
    """
    function encode(message, key)
        message_encoded = []

        i = 1
        for char in message

            capitalize = false

            if isletter(char)

                if isuppercase(char)
                    capitalize = true
                    char = lowercase(char)
                end

                new_pos = abc[char] + abc[key[i]] - 1

                if new_pos > 26
                    new_pos -= 26
                end

                push!(message_encoded, keepCaps(new_pos, capitalize))

            else
                push!(message_encoded, char)

            end

            i += 1
        end

        return message_encoded
    end

    """
        decode(message, key)

    Decode a message encrypted via the vigenere cypher with a known key.
    """
    function decode(message, key)
        message_decoded = []

        i = 1
        for char in message

            capitalize = false

            if isletter(char)

                if isuppercase(char)
                    capitalize = true
                    char = lowercase(char)
                end

                new_pos = abc[char] - abc[key[i]] + 1

                if new_pos < 0
                    new_pos += 26
                end

                push!(message_decoded, keepCaps(new_pos, capitalize))

            else
                push!(message_decoded, char)

            end

            i += 1
        end

        return message_decoded
    end

end