; David Archer
; CS/IS 165 
; Lab1
; Online Fall Class

 br                    main


input:            .ascii "\nInput number: \x00"
num:              .block 2
num2:             .block 2 
result:           .block 2
ans:              .ascii "\nAns = \x00"    


menu:             .ascii "\nMENU\n-------\n"
                  .ascii "\nCalculator"
                  .ascii "\n A - ADD"
                  .ascii "\n S - SUB"
                  .ascii "\n N - NEG"
                  .ascii "\n Q - Quit\n\x00"
choice:           .ascii "\n\nInput Option: \x00"
quit:             .ascii "\nYou have chosen to quit the program. Thank you and please come back again.\x00"
invalid:          .ascii "\nNot a valid input. Please try again.\x00"


ch:               .block 1
chari:            .equate 0xfc15


main:             stro menu,d


loop:             stro choice,d
                  ldba chari,d
                  stba ch, d
                  ldba chari,d
                  ldba ch,d
                  cpba 'a', i
                  brne endif1
                  stro input, d 
                  deci num2, d
                  ldwa result, d
                  adda num2, d
                  stwa result, d
                  stro ans, d
                  deco result, d
                  br loop


         
endif1:          cpba 's', i
                 brne endif2
                 stro input, d
                 ldba '\n', d
                 deci num2, d
                 ldba '\n', d
                 stbx num2, d
                 ldba '\n', i
                 ldwa result, d
                 suba num2, d
                 stwa result, d
                 stro ans, d
                 deco result, d
                 br loop
     

endif2:          cpba 'n', i
                 brne endif3 
                 ldwa result, d
                 nega
                 stwa result, d
                 stro ans, d
                 deco result, d
                 br loop

endif3:          cpba 'q', i
                 brne endifin
                 stro quit,d
                 stop

endifin:         stro invalid, d 
                 br loop
                 
                 .end       