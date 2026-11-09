using Test
using VigenereCypher.UserInput

@testset "test mkString" begin
    @test UserInput.mkString(['h','a','l','l','o']) == "hallo"
end

@testset "test userInput" begin
    
    @testset "userInput basic" begin
        inp = IOBuffer("e\nhallo\nkey\n")
        
        @test UserInput.userInput(inp) == [['h','a','l','l','o'],['k','e','y'],'e']
    end

    @testset "userInput spaces, symbols, capitalization in message" begin
         inp = IOBuffer("e\nHa lo!\nkey\n")
        @test UserInput.userInput(inp) == [['H','a',' ','l','o','!'],['k','e','y'],'e']
    end

    @testset "userInput invalide key" begin
         inp = IOBuffer("e\nhallo\nkey!\nke y\nkey")
        @test UserInput.userInput(inp) == [['h','a','l','l','o'],['k','e','y'],'e']
    end

    @testset "userInput invalide methode" begin
         inp = IOBuffer("q\ne\nhallo\nkey\n")
        @test UserInput.userInput(inp) == [['h','a','l','l','o'],['k','e','y'],'e']
    end
end