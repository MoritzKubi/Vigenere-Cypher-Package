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
        @test_throws ArgumentError VigCyFuncs.fitKey(['a','b','c'],['k','!','y'])
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


@testset "VigCyFuncs test decode" begin
    
    @testset "decode basic" begin
        @test VigCyFuncs.decode(['k','f','a','n','i'],['k','e','y','k','e']) == ['a','b','c','d','e']
    end

    @testset "decode uppercase handling" begin
        @test VigCyFuncs.decode(['K','f','A','n','I'],['k','e','y','k','e']) == ['A','b','C','d','E']
    end

    @testset "decode spaces and symbols handling" begin
        @test VigCyFuncs.decode(['k',' ','a','!','i'],['k','e','y','k','e']) == ['a',' ','c','!','e']
    end
end