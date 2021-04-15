
set labelCount 4                                             
set uniqueLabel 207395448
#################################################################################


##Editing for Signal sim:/pratica1_parte3/bits
# "Repeater Pattern" Repeat Never
# Start Time = 0 ps, End Time = 800 ps, Period = 100 ps
#################################################################################

        noforce sim:/pratica1_parte3/bits
        force -freeze sim:/pratica1_parte3/bits  xxx 0 ps, 011 100 ps, 100 200 ps, 000 300 ps, 100 400 ps, 001 500 ps, 000 600 ps, 101 700 ps

when -label 207395448_1 {$now = @800 ps} {
        set whenArray(207395448_1) 207395448_1
        noforce sim:/pratica1_parte3/bits
        force -freeze sim:/pratica1_parte3/bits 101 0 ps
}


##Editing for Signal sim:/pratica1_parte3/conjunto
# "Repeater Pattern" Repeat Never
# Start Time = 0 ps, End Time = 800 ps, Period = 100 ps
#################################################################################

        noforce sim:/pratica1_parte3/conjunto
        force -freeze sim:/pratica1_parte3/conjunto  xxx 0 ps, 001 100 ps, 011 200 ps, 001 300 ps, 011 600 ps, 001 700 ps

when -label 207395448_2 {$now = @800 ps} {
        set whenArray(207395448_2) 207395448_2
        noforce sim:/pratica1_parte3/conjunto
        force -freeze sim:/pratica1_parte3/conjunto 001 0 ps
}


##Editing for Signal sim:/pratica1_parte3/write
# "Repeater Pattern" Repeat Never
# Start Time = 0 ps, End Time = 800 ps, Period = 100 ps
#################################################################################

        noforce sim:/pratica1_parte3/write
        force -freeze sim:/pratica1_parte3/write  StX 0 ps, St0 100 ps, St1 300 ps, St0 400 ps

when -label 207395448_3 {$now = @800 ps} {
        set whenArray(207395448_3) 207395448_3
        noforce sim:/pratica1_parte3/write
        force -freeze sim:/pratica1_parte3/write 0 0 ps
}


##Editing for Signal sim:/pratica1_parte3/dataToWrite
# "Repeater Pattern" Repeat Never
# Start Time = 0 ps, End Time = 800 ps, Period = 100 ps
#################################################################################

        noforce sim:/pratica1_parte3/dataToWrite
        force -freeze sim:/pratica1_parte3/dataToWrite  xxx 0 ps, 111 300 ps, xxx 400 ps

when -label 207395448_4 {$now = @800 ps} {
        set whenArray(207395448_4) 207395448_4
        noforce sim:/pratica1_parte3/dataToWrite
        force -freeze sim:/pratica1_parte3/dataToWrite xxx 0 ps
}
