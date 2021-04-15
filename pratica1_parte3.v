module multiplex(dado1, dado2, dado3, dado4, sinalControle,out);
	input [2:0] dado1, dado2, dado3, dado4;
	input [3:0] sinalControle; 
	output reg [2:0] out;
	integer i,j;

	always @(dado1, dado2, dado3, dado4, sinalControle) begin
		j = 1;
		
		for(i = 0; i < 4 && j; i  = i + 1) begin
			if(sinalControle[i] == 1)
				j = 0;
		end
		i = i - 1;					
		
		case (i)
			0: out <= dado1;
			1: out <= dado2;
			2: out <= dado3;
			3: out <= dado4;
		endcase
	end
endmodule

module pratica1_parte3(
	input clock,
	input [2:0]bits,
	input [2:0]conjunto,
	input write,
	input [2:0]dataToWrite,
	output reg hit,
	output [2:0]data);
	
	reg [8:0] vias [3:0][3:0]; // 4 vias de 8 espaÃ§os de 9 bits
	reg [3:0] hits;
	reg [2:0] datas [3:0]; // dados de 3 bits vindos de 4 vias
	reg tagEquals [3:0];
	reg validBit [3:0];
	reg [3:0] LRU;
	reg dirty;
	reg [2:0] dataWrite;
	integer i,j, break;
	
	initial begin
		for(i = 0; i < 4; i = i + 1)begin
			for(j = 0; j < 4; j = j + 1) begin
				vias[i][j] = 9'b0;
			end
		end
		
		vias[0][0] = 9'b110001001;
		vias[0][1] = 9'b110000010;
		vias[1][1] = 9'b110010110;
		vias[2][1] = 9'b110001011;
		vias[3][1] = 9'b000011000;
		vias[0][2] = 9'b110000101;
		vias[0][3] = 9'b000100000;
		
		//Teste 1
		//Conjunto = 1
		//Bits = 011
		//Write = 0
		
		//Teste 2
		//Conjunto = 3
		//Bits = 100
		//Write = 0
		
		//Teste 3
		//Conjunto = 1
		//Bits = 000
		//Write = 1
		//dataToWrite = 111
		
		//Teste 4
		//Conjunto = 1
		//Bits = 100
		//Write = 0
		
		//Teste 5
		//Conjunto = 1
		//Bits = 001
		//Write = 0
		
		//Teste 6
		//Conjunto = 3
		//Bits = 000
		//Write = 0
		
		//Teste 7
		//Conjunto = 1
		//Bits = 101
		//Write = 0
		
		
	end	
	
	integer firstHitTagIndex;
	integer encontrou;
	integer lastLRU;
	
	always@(posedge clock) begin
		//Numero arbitrario maior que o indice de hit
		firstHitTagIndex = 4;
		encontrou = 0;
		break = 1;
		for(i = 0; i < 4 && break; i = i + 1) begin
			tagEquals[i] = vias[i][conjunto][5:3] == bits;
			validBit[i] = vias[i][conjunto][8];
			LRU[i] = vias[i][conjunto][7];
			$display("LRU[%d] = %d", i, LRU[i]);
			
			hits[i] = validBit[i] & tagEquals[i];
			datas[i] = vias[i][conjunto][2:0];			
			// Encontrou a primeira correspondÃªncia de TAG
			if (tagEquals[i] && encontrou == 0) begin
				firstHitTagIndex = i;
				lastLRU = i;
				encontrou = 1;
			end
		end
		
		// NÃ£o encontrou correspondÃªncia de TAG
		break = 1;
		if(firstHitTagIndex == 4)
			for(i=0; i<4 && break; i = i + 1)
				if(LRU[i] == 0)begin
					lastLRU = i;
					firstHitTagIndex = i;
					break = 0;
				end	
		
		hit = |hits;
		
		if(hit) dataWrite = datas[firstHitTagIndex];
		else dataWrite = bits;
		
		if(hit && write)begin dirty = 1; dataWrite = dataToWrite; end
		else dirty = 0;
		
		vias[firstHitTagIndex][conjunto] = {1'b1, 1'b1, dirty, bits, dataWrite};
		
		LRU[firstHitTagIndex] = 1;
		
		if(&LRU)begin
			for(i = 0; i < 4; i = i +1)
				if(i != lastLRU) vias[i][conjunto][7] = 0;
		end
	end
	
	multiplex mult(datas[0],datas[1],datas[2],datas[3],hits,data);
	
endmodule

