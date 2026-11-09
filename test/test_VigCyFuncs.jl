using VigenereCypher.VigCyFuncs
using Test

@testset "VigCyFuncs test fitKey" begin
    
    @testset "fitKey basic" begin
        @test VigCyFuncs.fitKey(['h','a','l','l','o'], ['k','e','y']) == ['k','e','y','k','e']
    end

    @testset "fitKey spaces and symbols in msg" begin
        @test VigCyFuncs.fitKey(['a','b',' ','c','d',' ','e','!','f'], ['k','e','y']) == ['k','e',' ','y','k',' ','e',' ','y']
    end
    
    @testset "fitKey uppercase and symbols handling in key" begin
        @test VigCyFuncs.fitKey(['a','b','c','d'],['K','e','Y']) == ['k','e','y','k']
        @test_throws VigCyFuncs.fitKey(['a','b','c'],['k','!','y'])
    end
end

@testset "VigCyFuncs test keepCaps" begin
    
    @test VigCyFuncs.keepCaps(13, true) == 'M'
    @test VigCyFuncs.keepCaps(15, false) == 'o'

end

@testset "VigCyFuncs test encode" begin
    
    @testset "encode basic" begin
        @test VigCyFuncs.encode(['a','a','a','a','a'],['a','b','c','d','e']) == ['a','b','c','d','e']
    end

    @testset "encode uppercase handling" begin
        @test VigCyFuncs.encode(['A','a','B','b'],['a','b','c','d']) == ['A','b','D','e']
    end

    @testset "encode spaces and symbols handling" begin
        @test VigCyFuncs.encode(['a',' ','b','!','c'],['k',' ','e',' ','y']) == ['k',' ','f','!','a']
    end
end

"""
@testset "VigCyFuncs test decode" begin
    
    @testset "decode basic" begin
        @test VigCyFuncs.decode() == []
    end

    @testset "decode uppercase handling" begin
        @test VigCyFuncs.decode() == []
    end

    @testset "decode spaces and symbols handling" begin
        @test VigCyFuncs.decode() == []
    end
end"""