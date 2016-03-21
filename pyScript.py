import math

fw = open('C0_Log_FIFO.txt', 'w')
fd = open('LOG_C0.txt', 'r')

n = ';\n'
b = "13'b"
x = 0
ad = '\t\tLog_C0['
for line in fd:

	data = str(line)
	data = data.strip()
	RHS = str(b + str(data) + n)
	loc = str( x )
	x = x + 1
	LHS = str(ad + loc + '] <= ')	
	fw.write( LHS + RHS )
	
fw.close()
fd.close()

	
