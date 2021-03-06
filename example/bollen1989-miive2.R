# Example 2

bollen1989a_model <- '

    Eta1 =~ y1 + y2  + y3  + y4  
    Eta2 =~ y5 + y6  + y7  + y8    
    Xi1  =~ x1 + x2 + x3 

    Eta1 ~ Xi1  
    Eta2 ~ Xi1 
    Eta2 ~ Eta1 

    y1   ~~ y5
    y2   ~~ y4
    y2   ~~ y6
    y3   ~~ y7
    y4   ~~ y8
    y6   ~~ y8 
'

my_instruments <- ' 
    y1 ~ x2 + x3                            
    y5 ~ y2 + y3 + y4 + x2              
    y2 ~ y3 + y7 + y8 + x2           
    y3 ~ y2 + y4 + y6 + y8        
    y4 ~ y3 + y6           
    y6 ~ y3 + y4 + y7 + x2            
    y7 ~ y2 + y4 + y6 + y8       
    y8 ~ y2 + y3 + y7 + x2          
    x2 ~ y1 + y5 + y2 + y3 + y4 + y6
    x3 ~ y1 + y5 + y2 + y3 + y4 + y6
'

miive(model = bollen1989a_model, 
      data = bollen1989a, 
      instruments = my_instruments)
