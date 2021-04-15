
set labelCount 4                                             
set uniqueLabel 64281600
#################################################################################


##Editing for Signal sim:/pratica1_parte3/bits
# "Repeater Pattern" Repeat Never
# Start Time = 0 ps, End Time = 800 ps, Period = 100 ps
#################################################################################

        noforce sim:/pratica1_parte3/bits
        force -freeze sim:/pratica1_parte3/bits  zzz 0 ps, 011 100 ps, 100 200 ps, 000 300 ps, 100 400 ps, 001 500 ps, 000 600 ps, 101 700 ps

when -label 64281600_1 {$now = @800 ps} {
        set whenArray(64281600_1) 64281600_1
        noforce sim:/pratica1_parte3/bits
        force -freeze sim:/pratica1_parte3/bits 101 0 ps
}


##Editing for Signal sim:/pratica1_parte3/conjunto
# "Repeater Pattern" Repeat Never
# Start Time = 0 ps, End Time = 800 ps, Period = 100 ps
#################################################################################

        noforce sim:/pratica1_parte3/conjunto
        force -freeze sim:/pratica1_parte3/conjunto  zzz 0 ps, 001 100 ps, 011 200 ps, 001 300 ps, 011 600 ps, 001 700 ps

when -label 64281600_2 {$now = @800 ps} {
        set whenArray(64281600_2) 64281600_2
        noforce sim:/pratica1_parte3/conjunto
        force -freeze sim:/pratica1_parte3/conjunto 001 0 ps
}


##Editing for Signal sim:/pratica1_parte3/dataToWrite
# "Repeater Pattern" Repeat Never
# Start Time = 0 ps, End Time = 800 ps, Period = 100 ps
#################################################################################

        noforce sim:/pratica1_parte3/dataToWrite
        force -freeze sim:/pratica1_parte3/dataToWrite  zzz 0 ps, 111 300 ps, zzz 400 ps

when -label 64281600_3 {$now = @800 ps} {
        set whenArray(64281600_3) 64281600_3
        noforce sim:/pratica1_parte3/dataToWrite
        force -freeze sim:/pratica1_parte3/dataToWrite zzz 0 ps
}


##Editing for Signal sim:/pratica1_parte3/write
# "Repeater Pattern" Repeat Never
# Start Time = 0 ps, End Time = 800 ps, Period = 100 ps
#################################################################################

        noforce sim:/pratica1_parte3/write
        force -freeze sim:/pratica1_parte3/write  St0 0 ps, St1 300 ps, St0 400 ps

when -label 64281600_4 {$now = @800 ps} {
        set whenArray(64281600_4) 64281600_4
        noforce sim:/pratica1_parte3/write
        force -freeze sim:/pratica1_parte3/write 0 0 ps
}
