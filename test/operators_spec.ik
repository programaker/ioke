
use("ispec")

parse = method(str,
  Message fromText(str) code)

describe("operator",
  describe("parsing", 
    describe("@", 
      it("should be parsed correctly empty", 
        m = parse("@")
        m should == "@"
      )

      it("should be parsed correctly with arguments", 
        m = parse("@(foo)")
        m should == "@(foo)"
      )
      
      it("should be parsed correctly directly in front of another identifier", 
        m = parse("@abc")
        m should == "@ abc"
      )

      it("should be parsed correctly directly in front of another identifier with space", 
        m = parse("@ abc")
        m should == "@ abc"
      )
    )

    describe("@@", 
      it("should be parsed correctly empty", 
        m = parse("@@")
        m should == "@@"
      )

      it("should be parsed correctly with arguments", 
        m = parse("@@(foo)")
        m should == "@@(foo)"
      )
      
      it("should be parsed correctly directly in front of another identifier", 
        m = parse("@@abc")
        m should == "@@ abc"
      )

      it("should be parsed correctly directly in front of another identifier with space", 
        m = parse("@@ abc")
        m should == "@@ abc"
      )
    )
    
    describe("<=>", 
      it("should be translated correctly inside a method definition", 
        m = parse("method(1<=>2)")
        m should == "method(1 <=>(2))"
      )

      it("should be translated correctly inside a nested method definition", 
        m = parse("method(method(1<=>2))")
        m should == "method(method(1 <=>(2)))"
      )

      it("should be translated correctly inside a method definition with something else", 
        m = parse("method(n, if(1<=>2, n, n))")
        m should == "method(n, if(1 <=>(2), n, n))"
      )
      
      it("should be translated correctly in infix", 
        m = parse("1<=>2")
        m should == "1 <=>(2)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("1<=>(2)")
        m should == "1 <=>(2)"

        m = parse("1 <=>(2)")
        m should == "1 <=>(2)"
      )

      it("should be translated correctly with spaces", 
        m = parse("1 <=> 2")
        m should == "1 <=>(2)"
      )
    )

    describe("<", 
      it("should be translated correctly inside a method definition", 
        m = parse("method(1<2)")
        m should == "method(1 <(2))"
      )

      it("should be translated correctly inside a nested method definition", 
        m = parse("method(method(1<2))")
        m should == "method(method(1 <(2)))"
      )

      it("should be translated correctly inside a method definition with something else", 
        m = parse("method(n, if(1<2, n, n))")
        m should == "method(n, if(1 <(2), n, n))"
      )
      
      it("should be translated correctly in infix", 
        m = parse("1<2")
        m should == "1 <(2)"
      )

      it("should be translated correctly in infix, starting with letter", 
        m = parse("a<2")
        m should == "a <(2)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("1<(2)")
        m should == "1 <(2)"

        m = parse("1 <(2)")
        m should == "1 <(2)"
      )

      it("should be translated correctly with spaces", 
        m = parse("1 < 2")
        m should == "1 <(2)"
      )
    )

    describe(">", 
      it("should be translated correctly inside a method definition", 
        m = parse("method(1>2)")
        m should == "method(1 >(2))"
      )

      it("should be translated correctly inside a nested method definition", 
        m = parse("method(method(1>2))")
        m should == "method(method(1 >(2)))"
      )

      it("should be translated correctly inside a method definition with something else", 
        m = parse("method(n, if(1>2, n, n))")
        m should == "method(n, if(1 >(2), n, n))"
      )
      
      it("should be translated correctly in infix", 
        m = parse("1>2")
        m should == "1 >(2)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("1>(2)")
        m should == "1 >(2)"

        m = parse("1 >(2)")
        m should == "1 >(2)"
      )

      it("should be translated correctly with spaces", 
        m = parse("1 > 2")
        m should == "1 >(2)"
      )
    )

    describe("<=", 
      it("should be translated correctly inside a method definition", 
        m = parse("method(1<=2)")
        m should == "method(1 <=(2))"
      )

      it("should be translated correctly inside a nested method definition", 
        m = parse("method(method(1<=2))")
        m should == "method(method(1 <=(2)))"
      )

      it("should be translated correctly inside a method definition with something else", 
        m = parse("method(n, if(1<=2, n, n))")
        m should == "method(n, if(1 <=(2), n, n))"
      )
      
      it("should be translated correctly in infix", 
        m = parse("1<=2")
        m should == "1 <=(2)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("1<=(2)")
        m should == "1 <=(2)"

        m = parse("1 <=(2)")
        m should == "1 <=(2)"
      )

      it("should be translated correctly with spaces", 
        m = parse("1 <= 2")
        m should == "1 <=(2)"
      )
    )
    
    describe(">=", 
      it("should be translated correctly inside a method definition", 
        m = parse("method(1>=2)")
        m should == "method(1 >=(2))"
      )

      it("should be translated correctly inside a nested method definition", 
        m = parse("method(method(1>=2))")
        m should == "method(method(1 >=(2)))"
      )

      it("should be translated correctly inside a method definition with something else", 
        m = parse("method(n, if(1>=2, n, n))")
        m should == "method(n, if(1 >=(2), n, n))"
      )
      
      it("should be translated correctly in infix", 
        m = parse("1>=2")
        m should == "1 >=(2)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("1>=(2)")
        m should == "1 >=(2)"

        m = parse("1 >=(2)")
        m should == "1 >=(2)"
      )

      it("should be translated correctly with spaces", 
        m = parse("1 >= 2")
        m should == "1 >=(2)"
      )
    )

    describe("!=", 
      it("should be translated correctly inside a method definition", 
        m = parse("method(1!=2)")
        m should == "method(1 !=(2))"
      )

      it("should be translated correctly inside a nested method definition", 
        m = parse("method(method(1!=2))")
        m should == "method(method(1 !=(2)))"
      )

      it("should be translated correctly inside a method definition with something else", 
        m = parse("method(n, if(1!=2, n, n))")
        m should == "method(n, if(1 !=(2), n, n))"
      )
      
      it("should be translated correctly in infix", 
        m = parse("1!=2")
        m should == "1 !=(2)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("1!=(2)")
        m should == "1 !=(2)"

        m = parse("1 !=(2)")
        m should == "1 !=(2)"
      )

      it("should be translated correctly with spaces", 
        m = parse("1 != 2")
        m should == "1 !=(2)"
      )
    )


    describe("==", 
      it("should be translated correctly inside a method definition", 
        m = parse("method(1==2)")
        m should == "method(1 ==(2))"
      )

      it("should be translated correctly inside a nested method definition", 
        m = parse("method(method(1==2))")
        m should == "method(method(1 ==(2)))"
      )

      it("should be translated correctly inside a method definition with something else", 
        m = parse("method(n, if(1==2, n, n))")
        m should == "method(n, if(1 ==(2), n, n))"
      )
      
      it("should be translated correctly in infix", 
        m = parse("1==2")
        m should == "1 ==(2)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("1==(2)")
        m should == "1 ==(2)"

        m = parse("1 ==(2)")
        m should == "1 ==(2)"
      )

      it("should be translated correctly with spaces", 
        m = parse("1 == 2")
        m should == "1 ==(2)"
      )
    )

    describe("===", 
      it("should be translated correctly inside a method definition", 
        m = parse("method(1===2)")
        m should == "method(1 ===(2))"
      )

      it("should be translated correctly inside a nested method definition", 
        m = parse("method(method(1===2))")
        m should == "method(method(1 ===(2)))"
      )

      it("should be translated correctly inside a method definition with something else", 
        m = parse("method(n, if(1===2, n, n))")
        m should == "method(n, if(1 ===(2), n, n))"
      )
      
      it("should be translated correctly in infix", 
        m = parse("1===2")
        m should == "1 ===(2)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("1===(2)")
        m should == "1 ===(2)"

        m = parse("1 ===(2)")
        m should == "1 ===(2)"
      )

      it("should be translated correctly with spaces", 
        m = parse("1 === 2")
        m should == "1 ===(2)"
      )
    )

    describe("=~", 
      it("should be translated correctly inside a method definition", 
        m = parse("method(1=~2)")
        m should == "method(1 =~(2))"
      )

      it("should be translated correctly inside a nested method definition", 
        m = parse("method(method(1=~2))")
        m should == "method(method(1 =~(2)))"
      )

      it("should be translated correctly inside a method definition with something else", 
        m = parse("method(n, if(1=~2, n, n))")
        m should == "method(n, if(1 =~(2), n, n))"
      )
      
      it("should be translated correctly in infix", 
        m = parse("1=~2")
        m should == "1 =~(2)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("1=~(2)")
        m should == "1 =~(2)"

        m = parse("1 =~(2)")
        m should == "1 =~(2)"
      )

      it("should be translated correctly with spaces", 
        m = parse("1 =~ 2")
        m should == "1 =~(2)"
      )
    )

    describe("!~", 
      it("should be translated correctly inside a method definition", 
        m = parse("method(1!~2)")
        m should == "method(1 !~(2))"
      )

      it("should be translated correctly inside a nested method definition", 
        m = parse("method(method(1!~2))")
        m should == "method(method(1 !~(2)))"
      )

      it("should be translated correctly inside a method definition with something else", 
        m = parse("method(n, if(1!~2, n, n))")
        m should == "method(n, if(1 !~(2), n, n))"
      )
      
      it("should be translated correctly in infix", 
        m = parse("1!~2")
        m should == "1 !~(2)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("1!~(2)")
        m should == "1 !~(2)"

        m = parse("1 !~(2)")
        m should == "1 !~(2)"
      )

      it("should be translated correctly with spaces", 
        m = parse("1 !~ 2")
        m should == "1 !~(2)"
      )
    )
    
    
    describe("unary -", 
      it("should parse correctly for a simple case", 
        m = parse("-1")
        m should == "-(1)"
      )

      it("should parse correctly for a simple case with message s) after", 
        m = parse("-1 println")
        m should == "-(1) println"
      )

      it("should parse correctly for a simple case with message s) after and parenthesis", 
        m = parse("-(1) println")
        m should == "-(1) println"
      )
      
      it("should parse correctly for a larger number", 
        m = parse("-12342353453")
        m should == "-(12342353453)"
      )

      it("should parse correctly several times over", 
        m = parse("- -(1)")
        m should == "-(-(1))"
      )
    )
    
    describe("unary binary operators", 
      it("should work for a simple expression", 
        m = parse("map(*2)")
        m should == "map(*(2))"
      )

      it("should work for a more complicated expression", 
        m = parse("map(*4+5-13/3)")
        m should == "map(*(4) +(5) -(13 /(3)))"
      )
    )
    
    describe("-", 
      it("should be translated correctly in infix", 
        m = parse("2-1")
        m should == "2 -(1)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2-(1)")
        m should == "2 -(1)"

        m = parse("2 -(1)")
        m should == "2 -(1)"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 - 1")
        m should == "2 -(1)"
      )
    )

    describe("+", 
      it("should be translated correctly in infix", 
        m = parse("2+1")
        m should == "2 +(1)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2+(1)")
        m should == "2 +(1)"

        m = parse("2 +(1)")
        m should == "2 +(1)"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 + 1")
        m should == "2 +(1)"
      )
    )

    describe("*", 
      it("should be translated correctly in infix", 
        m = parse("2*1")
        m should == "2 *(1)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2*(1)")
        m should == "2 *(1)"

        m = parse("2 *(1)")
        m should == "2 *(1)"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 * 1")
        m should == "2 *(1)"
      )
    )

    describe("**", 
      it("should be translated correctly in infix", 
        m = parse("2**1")
        m should == "2 **(1)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2**(1)")
        m should == "2 **(1)"

        m = parse("2 **(1)")
        m should == "2 **(1)"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 ** 1")
        m should == "2 **(1)"
      )
    )

    describe("/", 
      it("should be translated correctly in infix", 
        m = parse("2/1")
        m should == "2 /(1)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2/(1)")
        m should == "2 /(1)"

        m = parse("2 /(1)")
        m should == "2 /(1)"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 / 1")
        m should == "2 /(1)"
      )
    )
    
    describe("%", 
      it("should be translated correctly in infix", 
        m = parse("2%1")
        m should == "2 %(1)"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2%(1)")
        m should == "2 %(1)"

        m = parse("2 %(1)")
        m should == "2 %(1)"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 % 1")
        m should == "2 %(1)"
      )
    )

    
    describe("=>", 
      it("should be correctly translated in infix", 
        m = parse("2=>1")
        m should == "2 =>(1)"

        m = parse("\"foo\"=>\"bar\"")
        m should == "\"foo\" =>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2=>(1)")
        m should == "2 =>(1)"

        m = parse("2 =>(1)")
        m should == "2 =>(1)"

        m = parse("\"foo\"=>(\"bar\")")
        m should == "\"foo\" =>(\"bar\")"

        m = parse("\"foo\" =>(\"bar\")")
        m should == "\"foo\" =>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 => 1")
        m should == "2 =>(1)"

        m = parse("\"foo\" => \"bar\"")
        m should == "\"foo\" =>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 => 1 => 0")
        m should == "2 =>(1) =>(0)"

        m = parse("\"foo\" => \"bar\" => \"quux\"")
        m should == "\"foo\" =>(\"bar\") =>(\"quux\")"
      )
    )

    describe("..", 
      it("should be correctly translated in infix", 
        m = parse("2..1")
        m should == "2 ..(1)"

        m = parse("\"foo\"..\"bar\"")
        m should == "\"foo\" ..(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2..(1)")
        m should == "2 ..(1)"

        m = parse("2 ..(1)")
        m should == "2 ..(1)"

        m = parse("\"foo\"..(\"bar\")")
        m should == "\"foo\" ..(\"bar\")"

        m = parse("\"foo\" ..(\"bar\")")
        m should == "\"foo\" ..(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 .. 1")
        m should == "2 ..(1)"

        m = parse("\"foo\" .. \"bar\"")
        m should == "\"foo\" ..(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 .. 1 .. 0")
        m should == "2 ..(1) ..(0)"

        m = parse("\"foo\" .. \"bar\" .. \"quux\"")
        m should == "\"foo\" ..(\"bar\") ..(\"quux\")"
      )
    )

    describe("...", 
      it("should be correctly translated in infix", 
        m = parse("2...1")
        m should == "2 ...(1)"

        m = parse("\"foo\"...\"bar\"")
        m should == "\"foo\" ...(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2...(1)")
        m should == "2 ...(1)"

        m = parse("2 ...(1)")
        m should == "2 ...(1)"

        m = parse("\"foo\"...(\"bar\")")
        m should == "\"foo\" ...(\"bar\")"

        m = parse("\"foo\" ...(\"bar\")")
        m should == "\"foo\" ...(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 ... 1")
        m should == "2 ...(1)"

        m = parse("\"foo\" ... \"bar\"")
        m should == "\"foo\" ...(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 ... 1 ... 0")
        m should == "2 ...(1) ...(0)"

        m = parse("\"foo\" ... \"bar\" ... \"quux\"")
        m should == "\"foo\" ...(\"bar\") ...(\"quux\")"
      )
    )

    describe("<<", 
      it("should be correctly translated in infix", 
        m = parse("2<<1")
        m should == "2 <<(1)"

        m = parse("\"foo\"<<\"bar\"")
        m should == "\"foo\" <<(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2<<(1)")
        m should == "2 <<(1)"

        m = parse("2 <<(1)")
        m should == "2 <<(1)"

        m = parse("\"foo\"<<(\"bar\")")
        m should == "\"foo\" <<(\"bar\")"

        m = parse("\"foo\" <<(\"bar\")")
        m should == "\"foo\" <<(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 << 1")
        m should == "2 <<(1)"

        m = parse("\"foo\" << \"bar\"")
        m should == "\"foo\" <<(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 << 1 << 0")
        m should == "2 <<(1) <<(0)"

        m = parse("\"foo\" << \"bar\" << \"quux\"")
        m should == "\"foo\" <<(\"bar\") <<(\"quux\")"
      )
    )

    
    describe(">>", 
      it("should be correctly translated in infix", 
        m = parse("2>>1")
        m should == "2 >>(1)"

        m = parse("\"foo\">>\"bar\"")
        m should == "\"foo\" >>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2>>(1)")
        m should == "2 >>(1)"

        m = parse("2 >>(1)")
        m should == "2 >>(1)"

        m = parse("\"foo\">>(\"bar\")")
        m should == "\"foo\" >>(\"bar\")"

        m = parse("\"foo\" >>(\"bar\")")
        m should == "\"foo\" >>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 >> 1")
        m should == "2 >>(1)"

        m = parse("\"foo\" >> \"bar\"")
        m should == "\"foo\" >>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 >> 1 >> 0")
        m should == "2 >>(1) >>(0)"

        m = parse("\"foo\" >> \"bar\" >> \"quux\"")
        m should == "\"foo\" >>(\"bar\") >>(\"quux\")"
      )
    )
    
    describe("&", 
      it("should be correctly translated in infix", 
        m = parse("2&1")
        m should == "2 &(1)"

        m = parse("\"foo\"&\"bar\"")
        m should == "\"foo\" &(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2&(1)")
        m should == "2 &(1)"

        m = parse("2 &(1)")
        m should == "2 &(1)"

        m = parse("\"foo\"&(\"bar\")")
        m should == "\"foo\" &(\"bar\")"

        m = parse("\"foo\" &(\"bar\")")
        m should == "\"foo\" &(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 & 1")
        m should == "2 &(1)"

        m = parse("\"foo\" & \"bar\"")
        m should == "\"foo\" &(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 & 1 & 0")
        m should == "2 &(1) &(0)"

        m = parse("\"foo\" & \"bar\" & \"quux\"")
        m should == "\"foo\" &(\"bar\") &(\"quux\")"
      )
    )

    describe("|", 
      it("should be correctly translated in infix", 
        m = parse("2|1")
        m should == "2 |(1)"

        m = parse("\"foo\"|\"bar\"")
        m should == "\"foo\" |(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2|(1)")
        m should == "2 |(1)"

        m = parse("2 |(1)")
        m should == "2 |(1)"

        m = parse("\"foo\"|(\"bar\")")
        m should == "\"foo\" |(\"bar\")"

        m = parse("\"foo\" |(\"bar\")")
        m should == "\"foo\" |(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 | 1")
        m should == "2 |(1)"

        m = parse("\"foo\" | \"bar\"")
        m should == "\"foo\" |(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 | 1 | 0")
        m should == "2 |(1) |(0)"

        m = parse("\"foo\" | \"bar\" | \"quux\"")
        m should == "\"foo\" |(\"bar\") |(\"quux\")"
      )
    )

    describe("^", 
      it("should be correctly translated in infix", 
        m = parse("2^1")
        m should == "2 ^(1)"

        m = parse("\"foo\"^\"bar\"")
        m should == "\"foo\" ^(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2^(1)")
        m should == "2 ^(1)"

        m = parse("2 ^(1)")
        m should == "2 ^(1)"

        m = parse("\"foo\"^(\"bar\")")
        m should == "\"foo\" ^(\"bar\")"

        m = parse("\"foo\" ^(\"bar\")")
        m should == "\"foo\" ^(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 ^ 1")
        m should == "2 ^(1)"

        m = parse("\"foo\" ^ \"bar\"")
        m should == "\"foo\" ^(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 ^ 1 ^ 0")
        m should == "2 ^(1) ^(0)"

        m = parse("\"foo\" ^ \"bar\" ^ \"quux\"")
        m should == "\"foo\" ^(\"bar\") ^(\"quux\")"
      )
    )

    describe("&&", 
      it("should be correctly translated in infix", 
        m = parse("2&&1")
        m should == "2 &&(1)"

        m = parse("\"foo\"&&\"bar\"")
        m should == "\"foo\" &&(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2&&(1)")
        m should == "2 &&(1)"

        m = parse("2 &&(1)")
        m should == "2 &&(1)"

        m = parse("\"foo\"&&(\"bar\")")
        m should == "\"foo\" &&(\"bar\")"

        m = parse("\"foo\" &&(\"bar\")")
        m should == "\"foo\" &&(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 && 1")
        m should == "2 &&(1)"

        m = parse("\"foo\" && \"bar\"")
        m should == "\"foo\" &&(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 && 1 && 0")
        m should == "2 &&(1) &&(0)"

        m = parse("\"foo\" && \"bar\" && \"quux\"")
        m should == "\"foo\" &&(\"bar\") &&(\"quux\")"
      )
    )

    describe("||", 
      it("should be correctly translated in infix", 
        m = parse("2||1")
        m should == "2 ||(1)"

        m = parse("\"foo\"||\"bar\"")
        m should == "\"foo\" ||(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2||(1)")
        m should == "2 ||(1)"

        m = parse("2 ||(1)")
        m should == "2 ||(1)"

        m = parse("\"foo\"||(\"bar\")")
        m should == "\"foo\" ||(\"bar\")"

        m = parse("\"foo\" ||(\"bar\")")
        m should == "\"foo\" ||(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 || 1")
        m should == "2 ||(1)"

        m = parse("\"foo\" || \"bar\"")
        m should == "\"foo\" ||(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 || 1 || 0")
        m should == "2 ||(1) ||(0)"

        m = parse("\"foo\" || \"bar\" || \"quux\"")
        m should == "\"foo\" ||(\"bar\") ||(\"quux\")"
      )
    )

    describe("or", 
      it("should be translated correctly with parenthesis", 
        m = parse("2 or(1)")
        m should == "2 or(1)"

        m = parse("\"foo\" or(\"bar\")")
        m should == "\"foo\" or(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 or 1")
        m should == "2 or(1)"

        m = parse("\"foo\" or \"bar\"")
        m should == "\"foo\" or(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 or 1 or 0")
        m should == "2 or(1) or(0)"

        m = parse("\"foo\" or \"bar\" or \"quux\"")
        m should == "\"foo\" or(\"bar\") or(\"quux\")"
      )
    )

    describe("and", 
      it("should be translated correctly with parenthesis", 
        m = parse("2 and(1)")
        m should == "2 and(1)"

        m = parse("\"foo\" and(\"bar\")")
        m should == "\"foo\" and(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 and 1")
        m should == "2 and(1)"

        m = parse("\"foo\" and \"bar\"")
        m should == "\"foo\" and(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 and 1 and 0")
        m should == "2 and(1) and(0)"

        m = parse("\"foo\" and \"bar\" and \"quux\"")
        m should == "\"foo\" and(\"bar\") and(\"quux\")"
      )
    )

    describe("!", 
      it("should work in a simple unary position", 
        m = parse("!false")
        m should == "!(false)"
      )

      it("should work in a simple unary position with space", 
        m = parse("! false")
        m should == "!(false)"
      )

      it("should work with parenthesis", 
        m = parse("!(false)")
        m should == "!(false)"
      )

      it("should work in an expression", 
        m = parse("true && !false")
        m should == "true &&(!(false))"
      )
    )

    describe("~", 
      it("should work in a simple unary position", 
        m = parse("~false")
        m should == "~(false)"
      )

      it("should work in a simple unary position with space", 
        m = parse("~ false")
        m should == "~(false)"
      )

      it("should work with parenthesis", 
        m = parse("~(false)")
        m should == "~(false)"
      )

      it("should work in an expression", 
        m = parse("true && ~false")
        m should == "true &&(~(false))"
      )

      it("should work as a binary operator", 
        m = parse("true ~ false")
        m should == "true ~(false)"
      )
    )

    describe("$", 
      it("should work in a simple unary position", 
        m = parse("$false")
        m should == "$(false)"
      )

      it("should work in a simple unary position with space", 
        m = parse("$ false")
        m should == "$(false)"
      )

      it("should work with parenthesis", 
        m = parse("$(false)")
        m should == "$(false)"
      )

      it("should work in an expression", 
        m = parse("true && $false")
        m should == "true &&($(false))"
      )

      it("should work as a binary operator", 
        m = parse("true $ false")
        m should == "true $(false)"
      )
    )

    describe("->", 
      it("should be correctly translated in infix", 
        m = parse("2->1")
        m should == "2 ->(1)"

        m = parse("\"foo\"->\"bar\"")
        m should == "\"foo\" ->(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2->(1)")
        m should == "2 ->(1)"

        m = parse("2 ->(1)")
        m should == "2 ->(1)"

        m = parse("\"foo\"->(\"bar\")")
        m should == "\"foo\" ->(\"bar\")"

        m = parse("\"foo\" ->(\"bar\")")
        m should == "\"foo\" ->(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 -> 1")
        m should == "2 ->(1)"

        m = parse("\"foo\" -> \"bar\"")
        m should == "\"foo\" ->(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 -> 1 -> 0")
        m should == "2 ->(1) ->(0)"

        m = parse("\"foo\" -> \"bar\" -> \"quux\"")
        m should == "\"foo\" ->(\"bar\") ->(\"quux\")"
      )
    )

    describe("+>", 
      it("should be correctly translated in infix", 
        m = parse("2+>1")
        m should == "2 +>(1)"

        m = parse("\"foo\"+>\"bar\"")
        m should == "\"foo\" +>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2+>(1)")
        m should == "2 +>(1)"

        m = parse("2 +>(1)")
        m should == "2 +>(1)"

        m = parse("\"foo\"+>(\"bar\")")
        m should == "\"foo\" +>(\"bar\")"

        m = parse("\"foo\" +>(\"bar\")")
        m should == "\"foo\" +>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 +> 1")
        m should == "2 +>(1)"

        m = parse("\"foo\" +> \"bar\"")
        m should == "\"foo\" +>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 +> 1 +> 0")
        m should == "2 +>(1) +>(0)"

        m = parse("\"foo\" +> \"bar\" +> \"quux\"")
        m should == "\"foo\" +>(\"bar\") +>(\"quux\")"
      )
    )
    
    describe("!>", 
      it("should be correctly translated in infix", 
        m = parse("2!>1")
        m should == "2 !>(1)"

        m = parse("\"foo\"!>\"bar\"")
        m should == "\"foo\" !>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2!>(1)")
        m should == "2 !>(1)"

        m = parse("2 !>(1)")
        m should == "2 !>(1)"

        m = parse("\"foo\"!>(\"bar\")")
        m should == "\"foo\" !>(\"bar\")"

        m = parse("\"foo\" !>(\"bar\")")
        m should == "\"foo\" !>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 !> 1")
        m should == "2 !>(1)"

        m = parse("\"foo\" !> \"bar\"")
        m should == "\"foo\" !>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 !> 1 !> 0")
        m should == "2 !>(1) !>(0)"

        m = parse("\"foo\" !> \"bar\" !> \"quux\"")
        m should == "\"foo\" !>(\"bar\") !>(\"quux\")"
      )
    )

    describe("<>", 
      it("should be correctly translated in infix", 
        m = parse("2<>1")
        m should == "2 <>(1)"

        m = parse("\"foo\"<>\"bar\"")
        m should == "\"foo\" <>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2<>(1)")
        m should == "2 <>(1)"

        m = parse("2 <>(1)")
        m should == "2 <>(1)"

        m = parse("\"foo\"<>(\"bar\")")
        m should == "\"foo\" <>(\"bar\")"

        m = parse("\"foo\" <>(\"bar\")")
        m should == "\"foo\" <>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 <> 1")
        m should == "2 <>(1)"

        m = parse("\"foo\" <> \"bar\"")
        m should == "\"foo\" <>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 <> 1 <> 0")
        m should == "2 <>(1) <>(0)"

        m = parse("\"foo\" <> \"bar\" <> \"quux\"")
        m should == "\"foo\" <>(\"bar\") <>(\"quux\")"
      )
    )
    
    describe("&>", 
      it("should be correctly translated in infix", 
        m = parse("2&>1")
        m should == "2 &>(1)"

        m = parse("\"foo\"&>\"bar\"")
        m should == "\"foo\" &>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2&>(1)")
        m should == "2 &>(1)"

        m = parse("2 &>(1)")
        m should == "2 &>(1)"

        m = parse("\"foo\"&>(\"bar\")")
        m should == "\"foo\" &>(\"bar\")"

        m = parse("\"foo\" &>(\"bar\")")
        m should == "\"foo\" &>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 &> 1")
        m should == "2 &>(1)"

        m = parse("\"foo\" &> \"bar\"")
        m should == "\"foo\" &>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 &> 1 &> 0")
        m should == "2 &>(1) &>(0)"

        m = parse("\"foo\" &> \"bar\" &> \"quux\"")
        m should == "\"foo\" &>(\"bar\") &>(\"quux\")"
      )
    )
    

    describe("%>", 
      it("should be correctly translated in infix", 
        m = parse("2%>1")
        m should == "2 %>(1)"

        m = parse("\"foo\"%>\"bar\"")
        m should == "\"foo\" %>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2%>(1)")
        m should == "2 %>(1)"

        m = parse("2 %>(1)")
        m should == "2 %>(1)"

        m = parse("\"foo\"%>(\"bar\")")
        m should == "\"foo\" %>(\"bar\")"

        m = parse("\"foo\" %>(\"bar\")")
        m should == "\"foo\" %>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 %> 1")
        m should == "2 %>(1)"

        m = parse("\"foo\" %> \"bar\"")
        m should == "\"foo\" %>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 %> 1 %> 0")
        m should == "2 %>(1) %>(0)"

        m = parse("\"foo\" %> \"bar\" %> \"quux\"")
        m should == "\"foo\" %>(\"bar\") %>(\"quux\")"
      )
    )
    
    describe("#>", 
      it("should be correctly translated in infix", 
        m = parse("2#>1")
        m should == "2 #>(1)"

        m = parse("\"foo\"#>\"bar\"")
        m should == "\"foo\" #>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2#>(1)")
        m should == "2 #>(1)"

        m = parse("2 #>(1)")
        m should == "2 #>(1)"

        m = parse("\"foo\"#>(\"bar\")")
        m should == "\"foo\" #>(\"bar\")"

        m = parse("\"foo\" #>(\"bar\")")
        m should == "\"foo\" #>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 #> 1")
        m should == "2 #>(1)"

        m = parse("\"foo\" #> \"bar\"")
        m should == "\"foo\" #>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 #> 1 #> 0")
        m should == "2 #>(1) #>(0)"

        m = parse("\"foo\" #> \"bar\" #> \"quux\"")
        m should == "\"foo\" #>(\"bar\") #>(\"quux\")"
      )
    )

    describe("@>", 
      it("should be correctly translated in infix", 
        m = parse("2@>1")
        m should == "2 @>(1)"

        m = parse("\"foo\"@>\"bar\"")
        m should == "\"foo\" @>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2@>(1)")
        m should == "2 @>(1)"

        m = parse("2 @>(1)")
        m should == "2 @>(1)"

        m = parse("\"foo\"@>(\"bar\")")
        m should == "\"foo\" @>(\"bar\")"

        m = parse("\"foo\" @>(\"bar\")")
        m should == "\"foo\" @>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 @> 1")
        m should == "2 @>(1)"

        m = parse("\"foo\" @> \"bar\"")
        m should == "\"foo\" @>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 @> 1 @> 0")
        m should == "2 @>(1) @>(0)"

        m = parse("\"foo\" @> \"bar\" @> \"quux\"")
        m should == "\"foo\" @>(\"bar\") @>(\"quux\")"
      )
    )
    
    describe("/>", 
      it("should be correctly translated in infix", 
        m = parse("2/>1")
        m should == "2 />(1)"

        m = parse("\"foo\"/>\"bar\"")
        m should == "\"foo\" />(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2/>(1)")
        m should == "2 />(1)"

        m = parse("2 />(1)")
        m should == "2 />(1)"

        m = parse("\"foo\"/>(\"bar\")")
        m should == "\"foo\" />(\"bar\")"

        m = parse("\"foo\" />(\"bar\")")
        m should == "\"foo\" />(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 /> 1")
        m should == "2 />(1)"

        m = parse("\"foo\" /> \"bar\"")
        m should == "\"foo\" />(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 /> 1 /> 0")
        m should == "2 />(1) />(0)"

        m = parse("\"foo\" /> \"bar\" /> \"quux\"")
        m should == "\"foo\" />(\"bar\") />(\"quux\")"
      )
    )

    describe("*>", 
      it("should be correctly translated in infix", 
        m = parse("2*>1")
        m should == "2 *>(1)"

        m = parse("\"foo\"*>\"bar\"")
        m should == "\"foo\" *>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2*>(1)")
        m should == "2 *>(1)"

        m = parse("2 *>(1)")
        m should == "2 *>(1)"

        m = parse("\"foo\"*>(\"bar\")")
        m should == "\"foo\" *>(\"bar\")"

        m = parse("\"foo\" *>(\"bar\")")
        m should == "\"foo\" *>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 *> 1")
        m should == "2 *>(1)"

        m = parse("\"foo\" *> \"bar\"")
        m should == "\"foo\" *>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 *> 1 *> 0")
        m should == "2 *>(1) *>(0)"

        m = parse("\"foo\" *> \"bar\" *> \"quux\"")
        m should == "\"foo\" *>(\"bar\") *>(\"quux\")"
      )
    )

    
    describe("?>", 
      it("should be correctly translated in infix", 
        m = parse("2?>1")
        m should == "2 ?>(1)"

        m = parse("\"foo\"?>\"bar\"")
        m should == "\"foo\" ?>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2?>(1)")
        m should == "2 ?>(1)"

        m = parse("2 ?>(1)")
        m should == "2 ?>(1)"

        m = parse("\"foo\"?>(\"bar\")")
        m should == "\"foo\" ?>(\"bar\")"

        m = parse("\"foo\" ?>(\"bar\")")
        m should == "\"foo\" ?>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 ?> 1")
        m should == "2 ?>(1)"

        m = parse("\"foo\" ?> \"bar\"")
        m should == "\"foo\" ?>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 ?> 1 ?> 0")
        m should == "2 ?>(1) ?>(0)"

        m = parse("\"foo\" ?> \"bar\" ?> \"quux\"")
        m should == "\"foo\" ?>(\"bar\") ?>(\"quux\")"
      )
    )

    describe("|>", 
      it("should be correctly translated in infix", 
        m = parse("2|>1")
        m should == "2 |>(1)"

        m = parse("\"foo\"|>\"bar\"")
        m should == "\"foo\" |>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2|>(1)")
        m should == "2 |>(1)"

        m = parse("2 |>(1)")
        m should == "2 |>(1)"

        m = parse("\"foo\"|>(\"bar\")")
        m should == "\"foo\" |>(\"bar\")"

        m = parse("\"foo\" |>(\"bar\")")
        m should == "\"foo\" |>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 |> 1")
        m should == "2 |>(1)"

        m = parse("\"foo\" |> \"bar\"")
        m should == "\"foo\" |>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 |> 1 |> 0")
        m should == "2 |>(1) |>(0)"

        m = parse("\"foo\" |> \"bar\" |> \"quux\"")
        m should == "\"foo\" |>(\"bar\") |>(\"quux\")"
      )
    )

    describe("^>", 
      it("should be correctly translated in infix", 
        m = parse("2^>1")
        m should == "2 ^>(1)"

        m = parse("\"foo\"^>\"bar\"")
        m should == "\"foo\" ^>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2^>(1)")
        m should == "2 ^>(1)"

        m = parse("2 ^>(1)")
        m should == "2 ^>(1)"

        m = parse("\"foo\"^>(\"bar\")")
        m should == "\"foo\" ^>(\"bar\")"

        m = parse("\"foo\" ^>(\"bar\")")
        m should == "\"foo\" ^>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 ^> 1")
        m should == "2 ^>(1)"

        m = parse("\"foo\" ^> \"bar\"")
        m should == "\"foo\" ^>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 ^> 1 ^> 0")
        m should == "2 ^>(1) ^>(0)"

        m = parse("\"foo\" ^> \"bar\" ^> \"quux\"")
        m should == "\"foo\" ^>(\"bar\") ^>(\"quux\")"
      )
    )

    describe("~>", 
      it("should be correctly translated in infix", 
        m = parse("2~>1")
        m should == "2 ~>(1)"

        m = parse("\"foo\"~>\"bar\"")
        m should == "\"foo\" ~>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2~>(1)")
        m should == "2 ~>(1)"

        m = parse("2 ~>(1)")
        m should == "2 ~>(1)"

        m = parse("\"foo\"~>(\"bar\")")
        m should == "\"foo\" ~>(\"bar\")"

        m = parse("\"foo\" ~>(\"bar\")")
        m should == "\"foo\" ~>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 ~> 1")
        m should == "2 ~>(1)"

        m = parse("\"foo\" ~> \"bar\"")
        m should == "\"foo\" ~>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 ~> 1 ~> 0")
        m should == "2 ~>(1) ~>(0)"

        m = parse("\"foo\" ~> \"bar\" ~> \"quux\"")
        m should == "\"foo\" ~>(\"bar\") ~>(\"quux\")"
      )
    )

    describe("->>", 
      it("should be correctly translated in infix", 
        m = parse("2->>1")
        m should == "2 ->>(1)"

        m = parse("\"foo\"->>\"bar\"")
        m should == "\"foo\" ->>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2->>(1)")
        m should == "2 ->>(1)"

        m = parse("2 ->>(1)")
        m should == "2 ->>(1)"

        m = parse("\"foo\"->>(\"bar\")")
        m should == "\"foo\" ->>(\"bar\")"

        m = parse("\"foo\" ->>(\"bar\")")
        m should == "\"foo\" ->>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 ->> 1")
        m should == "2 ->>(1)"

        m = parse("\"foo\" ->> \"bar\"")
        m should == "\"foo\" ->>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 ->> 1 ->> 0")
        m should == "2 ->>(1) ->>(0)"

        m = parse("\"foo\" ->> \"bar\" ->> \"quux\"")
        m should == "\"foo\" ->>(\"bar\") ->>(\"quux\")"
      )
    )

    describe("+>>", 
      it("should be correctly translated in infix", 
        m = parse("2+>>1")
        m should == "2 +>>(1)"

        m = parse("\"foo\"+>>\"bar\"")
        m should == "\"foo\" +>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2+>>(1)")
        m should == "2 +>>(1)"

        m = parse("2 +>>(1)")
        m should == "2 +>>(1)"

        m = parse("\"foo\"+>>(\"bar\")")
        m should == "\"foo\" +>>(\"bar\")"

        m = parse("\"foo\" +>>(\"bar\")")
        m should == "\"foo\" +>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 +>> 1")
        m should == "2 +>>(1)"

        m = parse("\"foo\" +>> \"bar\"")
        m should == "\"foo\" +>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 +>> 1 +>> 0")
        m should == "2 +>>(1) +>>(0)"

        m = parse("\"foo\" +>> \"bar\" +>> \"quux\"")
        m should == "\"foo\" +>>(\"bar\") +>>(\"quux\")"
      )
    )
    
    describe("!>>", 
      it("should be correctly translated in infix", 
        m = parse("2!>>1")
        m should == "2 !>>(1)"

        m = parse("\"foo\"!>>\"bar\"")
        m should == "\"foo\" !>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2!>>(1)")
        m should == "2 !>>(1)"

        m = parse("2 !>>(1)")
        m should == "2 !>>(1)"

        m = parse("\"foo\"!>>(\"bar\")")
        m should == "\"foo\" !>>(\"bar\")"

        m = parse("\"foo\" !>>(\"bar\")")
        m should == "\"foo\" !>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 !>> 1")
        m should == "2 !>>(1)"

        m = parse("\"foo\" !>> \"bar\"")
        m should == "\"foo\" !>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 !>> 1 !>> 0")
        m should == "2 !>>(1) !>>(0)"

        m = parse("\"foo\" !>> \"bar\" !>> \"quux\"")
        m should == "\"foo\" !>>(\"bar\") !>>(\"quux\")"
      )
    )

    describe("<>>", 
      it("should be correctly translated in infix", 
        m = parse("2<>>1")
        m should == "2 <>>(1)"

        m = parse("\"foo\"<>>\"bar\"")
        m should == "\"foo\" <>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2<>>(1)")
        m should == "2 <>>(1)"

        m = parse("2 <>>(1)")
        m should == "2 <>>(1)"

        m = parse("\"foo\"<>>(\"bar\")")
        m should == "\"foo\" <>>(\"bar\")"

        m = parse("\"foo\" <>>(\"bar\")")
        m should == "\"foo\" <>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 <>> 1")
        m should == "2 <>>(1)"

        m = parse("\"foo\" <>> \"bar\"")
        m should == "\"foo\" <>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 <>> 1 <>> 0")
        m should == "2 <>>(1) <>>(0)"

        m = parse("\"foo\" <>> \"bar\" <>> \"quux\"")
        m should == "\"foo\" <>>(\"bar\") <>>(\"quux\")"
      )
    )
    
    describe("&>>", 
      it("should be correctly translated in infix", 
        m = parse("2&>>1")
        m should == "2 &>>(1)"

        m = parse("\"foo\"&>>\"bar\"")
        m should == "\"foo\" &>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2&>>(1)")
        m should == "2 &>>(1)"

        m = parse("2 &>>(1)")
        m should == "2 &>>(1)"

        m = parse("\"foo\"&>>(\"bar\")")
        m should == "\"foo\" &>>(\"bar\")"

        m = parse("\"foo\" &>>(\"bar\")")
        m should == "\"foo\" &>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 &>> 1")
        m should == "2 &>>(1)"

        m = parse("\"foo\" &>> \"bar\"")
        m should == "\"foo\" &>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 &>> 1 &>> 0")
        m should == "2 &>>(1) &>>(0)"

        m = parse("\"foo\" &>> \"bar\" &>> \"quux\"")
        m should == "\"foo\" &>>(\"bar\") &>>(\"quux\")"
      )
    )
    

    describe("%>>", 
      it("should be correctly translated in infix", 
        m = parse("2%>>1")
        m should == "2 %>>(1)"

        m = parse("\"foo\"%>>\"bar\"")
        m should == "\"foo\" %>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2%>>(1)")
        m should == "2 %>>(1)"

        m = parse("2 %>>(1)")
        m should == "2 %>>(1)"

        m = parse("\"foo\"%>>(\"bar\")")
        m should == "\"foo\" %>>(\"bar\")"

        m = parse("\"foo\" %>>(\"bar\")")
        m should == "\"foo\" %>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 %>> 1")
        m should == "2 %>>(1)"

        m = parse("\"foo\" %>> \"bar\"")
        m should == "\"foo\" %>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 %>> 1 %>> 0")
        m should == "2 %>>(1) %>>(0)"

        m = parse("\"foo\" %>> \"bar\" %>> \"quux\"")
        m should == "\"foo\" %>>(\"bar\") %>>(\"quux\")"
      )
    )
    
    describe("#>>", 
      it("should be correctly translated in infix", 
        m = parse("2#>>1")
        m should == "2 #>>(1)"

        m = parse("\"foo\"#>>\"bar\"")
        m should == "\"foo\" #>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2#>>(1)")
        m should == "2 #>>(1)"

        m = parse("2 #>>(1)")
        m should == "2 #>>(1)"

        m = parse("\"foo\"#>>(\"bar\")")
        m should == "\"foo\" #>>(\"bar\")"

        m = parse("\"foo\" #>>(\"bar\")")
        m should == "\"foo\" #>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 #>> 1")
        m should == "2 #>>(1)"

        m = parse("\"foo\" #>> \"bar\"")
        m should == "\"foo\" #>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 #>> 1 #>> 0")
        m should == "2 #>>(1) #>>(0)"

        m = parse("\"foo\" #>> \"bar\" #>> \"quux\"")
        m should == "\"foo\" #>>(\"bar\") #>>(\"quux\")"
      )
    )

    describe("@>>", 
      it("should be correctly translated in infix", 
        m = parse("2@>>1")
        m should == "2 @>>(1)"

        m = parse("\"foo\"@>>\"bar\"")
        m should == "\"foo\" @>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2@>>(1)")
        m should == "2 @>>(1)"

        m = parse("2 @>>(1)")
        m should == "2 @>>(1)"

        m = parse("\"foo\"@>>(\"bar\")")
        m should == "\"foo\" @>>(\"bar\")"

        m = parse("\"foo\" @>>(\"bar\")")
        m should == "\"foo\" @>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 @>> 1")
        m should == "2 @>>(1)"

        m = parse("\"foo\" @>> \"bar\"")
        m should == "\"foo\" @>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 @>> 1 @>> 0")
        m should == "2 @>>(1) @>>(0)"

        m = parse("\"foo\" @>> \"bar\" @>> \"quux\"")
        m should == "\"foo\" @>>(\"bar\") @>>(\"quux\")"
      )
    )
    
    describe("/>>", 
      it("should be correctly translated in infix", 
        m = parse("2/>>1")
        m should == "2 />>(1)"

        m = parse("\"foo\"/>>\"bar\"")
        m should == "\"foo\" />>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2/>>(1)")
        m should == "2 />>(1)"

        m = parse("2 />>(1)")
        m should == "2 />>(1)"

        m = parse("\"foo\"/>>(\"bar\")")
        m should == "\"foo\" />>(\"bar\")"

        m = parse("\"foo\" />>(\"bar\")")
        m should == "\"foo\" />>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 />> 1")
        m should == "2 />>(1)"

        m = parse("\"foo\" />> \"bar\"")
        m should == "\"foo\" />>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 />> 1 />> 0")
        m should == "2 />>(1) />>(0)"

        m = parse("\"foo\" />> \"bar\" />> \"quux\"")
        m should == "\"foo\" />>(\"bar\") />>(\"quux\")"
      )
    )

    describe("*>>", 
      it("should be correctly translated in infix", 
        m = parse("2*>>1")
        m should == "2 *>>(1)"

        m = parse("\"foo\"*>>\"bar\"")
        m should == "\"foo\" *>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2*>>(1)")
        m should == "2 *>>(1)"

        m = parse("2 *>>(1)")
        m should == "2 *>>(1)"

        m = parse("\"foo\"*>>(\"bar\")")
        m should == "\"foo\" *>>(\"bar\")"

        m = parse("\"foo\" *>>(\"bar\")")
        m should == "\"foo\" *>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 *>> 1")
        m should == "2 *>>(1)"

        m = parse("\"foo\" *>> \"bar\"")
        m should == "\"foo\" *>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 *>> 1 *>> 0")
        m should == "2 *>>(1) *>>(0)"

        m = parse("\"foo\" *>> \"bar\" *>> \"quux\"")
        m should == "\"foo\" *>>(\"bar\") *>>(\"quux\")"
      )
    )

    
    describe("?>>", 
      it("should be correctly translated in infix", 
        m = parse("2?>>1")
        m should == "2 ?>>(1)"

        m = parse("\"foo\"?>>\"bar\"")
        m should == "\"foo\" ?>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2?>>(1)")
        m should == "2 ?>>(1)"

        m = parse("2 ?>>(1)")
        m should == "2 ?>>(1)"

        m = parse("\"foo\"?>>(\"bar\")")
        m should == "\"foo\" ?>>(\"bar\")"

        m = parse("\"foo\" ?>>(\"bar\")")
        m should == "\"foo\" ?>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 ?>> 1")
        m should == "2 ?>>(1)"

        m = parse("\"foo\" ?>> \"bar\"")
        m should == "\"foo\" ?>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 ?>> 1 ?>> 0")
        m should == "2 ?>>(1) ?>>(0)"

        m = parse("\"foo\" ?>> \"bar\" ?>> \"quux\"")
        m should == "\"foo\" ?>>(\"bar\") ?>>(\"quux\")"
      )
    )

    describe("|>>", 
      it("should be correctly translated in infix", 
        m = parse("2|>>1")
        m should == "2 |>>(1)"

        m = parse("\"foo\"|>>\"bar\"")
        m should == "\"foo\" |>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2|>>(1)")
        m should == "2 |>>(1)"

        m = parse("2 |>>(1)")
        m should == "2 |>>(1)"

        m = parse("\"foo\"|>>(\"bar\")")
        m should == "\"foo\" |>>(\"bar\")"

        m = parse("\"foo\" |>>(\"bar\")")
        m should == "\"foo\" |>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 |>> 1")
        m should == "2 |>>(1)"

        m = parse("\"foo\" |>> \"bar\"")
        m should == "\"foo\" |>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 |>> 1 |>> 0")
        m should == "2 |>>(1) |>>(0)"

        m = parse("\"foo\" |>> \"bar\" |>> \"quux\"")
        m should == "\"foo\" |>>(\"bar\") |>>(\"quux\")"
      )
    )

    describe("^>>", 
      it("should be correctly translated in infix", 
        m = parse("2^>>1")
        m should == "2 ^>>(1)"

        m = parse("\"foo\"^>>\"bar\"")
        m should == "\"foo\" ^>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2^>>(1)")
        m should == "2 ^>>(1)"

        m = parse("2 ^>>(1)")
        m should == "2 ^>>(1)"

        m = parse("\"foo\"^>>(\"bar\")")
        m should == "\"foo\" ^>>(\"bar\")"

        m = parse("\"foo\" ^>>(\"bar\")")
        m should == "\"foo\" ^>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 ^>> 1")
        m should == "2 ^>>(1)"

        m = parse("\"foo\" ^>> \"bar\"")
        m should == "\"foo\" ^>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 ^>> 1 ^>> 0")
        m should == "2 ^>>(1) ^>>(0)"

        m = parse("\"foo\" ^>> \"bar\" ^>> \"quux\"")
        m should == "\"foo\" ^>>(\"bar\") ^>>(\"quux\")"
      )
    )

    describe("~>>", 
      it("should be correctly translated in infix", 
        m = parse("2~>>1")
        m should == "2 ~>>(1)"

        m = parse("\"foo\"~>>\"bar\"")
        m should == "\"foo\" ~>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2~>>(1)")
        m should == "2 ~>>(1)"

        m = parse("2 ~>>(1)")
        m should == "2 ~>>(1)"

        m = parse("\"foo\"~>>(\"bar\")")
        m should == "\"foo\" ~>>(\"bar\")"

        m = parse("\"foo\" ~>>(\"bar\")")
        m should == "\"foo\" ~>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 ~>> 1")
        m should == "2 ~>>(1)"

        m = parse("\"foo\" ~>> \"bar\"")
        m should == "\"foo\" ~>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 ~>> 1 ~>> 0")
        m should == "2 ~>>(1) ~>>(0)"

        m = parse("\"foo\" ~>> \"bar\" ~>> \"quux\"")
        m should == "\"foo\" ~>>(\"bar\") ~>>(\"quux\")"
      )
    )

    describe("=>>", 
      it("should be correctly translated in infix", 
        m = parse("2=>>1")
        m should == "2 =>>(1)"

        m = parse("\"foo\"=>>\"bar\"")
        m should == "\"foo\" =>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2=>>(1)")
        m should == "2 =>>(1)"

        m = parse("2 =>>(1)")
        m should == "2 =>>(1)"

        m = parse("\"foo\"=>>(\"bar\")")
        m should == "\"foo\" =>>(\"bar\")"

        m = parse("\"foo\" =>>(\"bar\")")
        m should == "\"foo\" =>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 =>> 1")
        m should == "2 =>>(1)"

        m = parse("\"foo\" =>> \"bar\"")
        m should == "\"foo\" =>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 =>> 1 =>> 0")
        m should == "2 =>>(1) =>>(0)"

        m = parse("\"foo\" =>> \"bar\" =>> \"quux\"")
        m should == "\"foo\" =>>(\"bar\") =>>(\"quux\")"
      )
    )

    describe("**>", 
      it("should be correctly translated in infix", 
        m = parse("2**>1")
        m should == "2 **>(1)"

        m = parse("\"foo\"**>\"bar\"")
        m should == "\"foo\" **>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2**>(1)")
        m should == "2 **>(1)"

        m = parse("2 **>(1)")
        m should == "2 **>(1)"

        m = parse("\"foo\"**>(\"bar\")")
        m should == "\"foo\" **>(\"bar\")"

        m = parse("\"foo\" **>(\"bar\")")
        m should == "\"foo\" **>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 **> 1")
        m should == "2 **>(1)"

        m = parse("\"foo\" **> \"bar\"")
        m should == "\"foo\" **>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 **> 1 **> 0")
        m should == "2 **>(1) **>(0)"

        m = parse("\"foo\" **> \"bar\" **> \"quux\"")
        m should == "\"foo\" **>(\"bar\") **>(\"quux\")"
      )
    )

    describe("**>>", 
      it("should be correctly translated in infix", 
        m = parse("2**>>1")
        m should == "2 **>>(1)"

        m = parse("\"foo\"**>>\"bar\"")
        m should == "\"foo\" **>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2**>>(1)")
        m should == "2 **>>(1)"

        m = parse("2 **>>(1)")
        m should == "2 **>>(1)"

        m = parse("\"foo\"**>>(\"bar\")")
        m should == "\"foo\" **>>(\"bar\")"

        m = parse("\"foo\" **>>(\"bar\")")
        m should == "\"foo\" **>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 **>> 1")
        m should == "2 **>>(1)"

        m = parse("\"foo\" **>> \"bar\"")
        m should == "\"foo\" **>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 **>> 1 **>> 0")
        m should == "2 **>>(1) **>>(0)"

        m = parse("\"foo\" **>> \"bar\" **>> \"quux\"")
        m should == "\"foo\" **>>(\"bar\") **>>(\"quux\")"
      )
    )

    describe("&&>", 
      it("should be correctly translated in infix", 
        m = parse("2&&>1")
        m should == "2 &&>(1)"

        m = parse("\"foo\"&&>\"bar\"")
        m should == "\"foo\" &&>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2&&>(1)")
        m should == "2 &&>(1)"

        m = parse("2 &&>(1)")
        m should == "2 &&>(1)"

        m = parse("\"foo\"&&>(\"bar\")")
        m should == "\"foo\" &&>(\"bar\")"

        m = parse("\"foo\" &&>(\"bar\")")
        m should == "\"foo\" &&>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 &&> 1")
        m should == "2 &&>(1)"

        m = parse("\"foo\" &&> \"bar\"")
        m should == "\"foo\" &&>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 &&> 1 &&> 0")
        m should == "2 &&>(1) &&>(0)"

        m = parse("\"foo\" &&> \"bar\" &&> \"quux\"")
        m should == "\"foo\" &&>(\"bar\") &&>(\"quux\")"
      )
    )

    describe("&&>>", 
      it("should be correctly translated in infix", 
        m = parse("2&&>>1")
        m should == "2 &&>>(1)"

        m = parse("\"foo\"&&>>\"bar\"")
        m should == "\"foo\" &&>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2&&>>(1)")
        m should == "2 &&>>(1)"

        m = parse("2 &&>>(1)")
        m should == "2 &&>>(1)"

        m = parse("\"foo\"&&>>(\"bar\")")
        m should == "\"foo\" &&>>(\"bar\")"

        m = parse("\"foo\" &&>>(\"bar\")")
        m should == "\"foo\" &&>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 &&>> 1")
        m should == "2 &&>>(1)"

        m = parse("\"foo\" &&>> \"bar\"")
        m should == "\"foo\" &&>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 &&>> 1 &&>> 0")
        m should == "2 &&>>(1) &&>>(0)"

        m = parse("\"foo\" &&>> \"bar\" &&>> \"quux\"")
        m should == "\"foo\" &&>>(\"bar\") &&>>(\"quux\")"
      )
    )

    describe("||>", 
      it("should be correctly translated in infix", 
        m = parse("2||>1")
        m should == "2 ||>(1)"

        m = parse("\"foo\"||>\"bar\"")
        m should == "\"foo\" ||>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2||>(1)")
        m should == "2 ||>(1)"

        m = parse("2 ||>(1)")
        m should == "2 ||>(1)"

        m = parse("\"foo\"||>(\"bar\")")
        m should == "\"foo\" ||>(\"bar\")"

        m = parse("\"foo\" ||>(\"bar\")")
        m should == "\"foo\" ||>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 ||> 1")
        m should == "2 ||>(1)"

        m = parse("\"foo\" ||> \"bar\"")
        m should == "\"foo\" ||>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 ||> 1 ||> 0")
        m should == "2 ||>(1) ||>(0)"

        m = parse("\"foo\" ||> \"bar\" ||> \"quux\"")
        m should == "\"foo\" ||>(\"bar\") ||>(\"quux\")"
      )
    )

    describe("||>>", 
      it("should be correctly translated in infix", 
        m = parse("2||>>1")
        m should == "2 ||>>(1)"

        m = parse("\"foo\"||>>\"bar\"")
        m should == "\"foo\" ||>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2||>>(1)")
        m should == "2 ||>>(1)"

        m = parse("2 ||>>(1)")
        m should == "2 ||>>(1)"

        m = parse("\"foo\"||>>(\"bar\")")
        m should == "\"foo\" ||>>(\"bar\")"

        m = parse("\"foo\" ||>>(\"bar\")")
        m should == "\"foo\" ||>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 ||>> 1")
        m should == "2 ||>>(1)"

        m = parse("\"foo\" ||>> \"bar\"")
        m should == "\"foo\" ||>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 ||>> 1 ||>> 0")
        m should == "2 ||>>(1) ||>>(0)"

        m = parse("\"foo\" ||>> \"bar\" ||>> \"quux\"")
        m should == "\"foo\" ||>>(\"bar\") ||>>(\"quux\")"
      )
    )

    describe("$>", 
      it("should be correctly translated in infix", 
        m = parse("2$>1")
        m should == "2 $>(1)"

        m = parse("\"foo\"$>\"bar\"")
        m should == "\"foo\" $>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2$>(1)")
        m should == "2 $>(1)"

        m = parse("2 $>(1)")
        m should == "2 $>(1)"

        m = parse("\"foo\"$>(\"bar\")")
        m should == "\"foo\" $>(\"bar\")"

        m = parse("\"foo\" $>(\"bar\")")
        m should == "\"foo\" $>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 $> 1")
        m should == "2 $>(1)"

        m = parse("\"foo\" $> \"bar\"")
        m should == "\"foo\" $>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 $> 1 $> 0")
        m should == "2 $>(1) $>(0)"

        m = parse("\"foo\" $> \"bar\" $> \"quux\"")
        m should == "\"foo\" $>(\"bar\") $>(\"quux\")"
      )
    )

    describe("$>>", 
      it("should be correctly translated in infix", 
        m = parse("2$>>1")
        m should == "2 $>>(1)"

        m = parse("\"foo\"$>>\"bar\"")
        m should == "\"foo\" $>>(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2$>>(1)")
        m should == "2 $>>(1)"

        m = parse("2 $>>(1)")
        m should == "2 $>>(1)"

        m = parse("\"foo\"$>>(\"bar\")")
        m should == "\"foo\" $>>(\"bar\")"

        m = parse("\"foo\" $>>(\"bar\")")
        m should == "\"foo\" $>>(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 $>> 1")
        m should == "2 $>>(1)"

        m = parse("\"foo\" $>> \"bar\"")
        m should == "\"foo\" $>>(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 $>> 1 $>> 0")
        m should == "2 $>>(1) $>>(0)"

        m = parse("\"foo\" $>> \"bar\" $>> \"quux\"")
        m should == "\"foo\" $>>(\"bar\") $>>(\"quux\")"
      )
    )
    
    describe("<->", 
      it("should be correctly translated in infix", 
        m = parse("2<->1")
        m should == "2 <->(1)"

        m = parse("\"foo\"<->\"bar\"")
        m should == "\"foo\" <->(\"bar\")"
      )

      it("should be translated correctly with parenthesis", 
        m = parse("2<->(1)")
        m should == "2 <->(1)"

        m = parse("2 <->(1)")
        m should == "2 <->(1)"

        m = parse("\"foo\"<->(\"bar\")")
        m should == "\"foo\" <->(\"bar\")"

        m = parse("\"foo\" <->(\"bar\")")
        m should == "\"foo\" <->(\"bar\")"
      )

      it("should be translated correctly with spaces", 
        m = parse("2 <-> 1")
        m should == "2 <->(1)"

        m = parse("\"foo\" <-> \"bar\"")
        m should == "\"foo\" <->(\"bar\")"
      )

      it("should be translated correctly when chained", 
        m = parse("2 <-> 1 <-> 0")
        m should == "2 <->(1) <->(0)"

        m = parse("\"foo\" <-> \"bar\" <-> \"quux\"")
        m should == "\"foo\" <->(\"bar\") <->(\"quux\")"
      )
    )

    describe("precedence", 
      it("should work correctly for + and *", 
        m = parse("2+3*4")
        m should == "2 +(3 *(4))"
      )

      it("should work correctly for * and +", 
        m = parse("2*3+4")
        m should == "2 *(3) +(4)"
      )

      it("should work correctly for + and * with spaces", 
        m = parse("2 + 3 * 4")
        m should == "2 +(3 *(4))"
      )

      it("should work correctly for * and + with spaces", 
        m = parse("2 * 3 + 4")
        m should == "2 *(3) +(4)"
      )

      it("should work correctly for + and /", 
        m = parse("2+3/4")
        m should == "2 +(3 /(4))"
      )

      it("should work correctly for / and +", 
        m = parse("2/3+4")
        m should == "2 /(3) +(4)"
      )

      it("should work correctly for + and / with spaces", 
        m = parse("2 + 3 / 4")
        m should == "2 +(3 /(4))"
      )

      it("should work correctly for / and + with spaces", 
        m = parse("2 / 3 + 4")
        m should == "2 /(3) +(4)"
      )

      it("should work correctly for - and *", 
        m = parse("2-3*4")
        m should == "2 -(3 *(4))"
      )

      it("should work correctly for * and -", 
        m = parse("2*3-4")
        m should == "2 *(3) -(4)"
      )

      it("should work correctly for - and * with spaces", 
        m = parse("2 - 3 * 4")
        m should == "2 -(3 *(4))"
      )

      it("should work correctly for * and - with spaces", 
        m = parse("2 * 3 - 4")
        m should == "2 *(3) -(4)"
      )

      it("should work correctly for - and /", 
        m = parse("2-3/4")
        m should == "2 -(3 /(4))"
      )

      it("should work correctly for / and -", 
        m = parse("2/3-4")
        m should == "2 /(3) -(4)"
      )

      it("should work correctly for - and / with spaces", 
        m = parse("2 - 3 / 4")
        m should == "2 -(3 /(4))"
      )

      it("should work correctly for / and - with spaces", 
        m = parse("2 / 3 - 4")
        m should == "2 /(3) -(4)"
      )
      
      it("should work correctly for unary minus", 
        m = parse("20 * -10")
        m should == "20 *(-(10))"
      )

      it("should work correctly for unary plus", 
        m = parse("20 * +10")
        m should == "20 *(+(10))"
      )
    )
  )
)
