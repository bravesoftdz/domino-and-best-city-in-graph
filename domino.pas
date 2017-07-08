{  -----UNIVERSIDADE FEDERAL DE S�O JO�O DEL-REI-----
		  Isabella Vieira Ferreira
		    M�nica Neli de Resende
	  Ci�ncia da Computa��o - 1� per�odo
			   03/06/2011                           }

{-------------------------------------------------------------------
Este programa verifica se h� uma combina��o de domin�s v�lida ou n�o
--------------------------------------------------------------------}

Program domino;

uses crt;

var 
	arquivo: text;                                            //nome interno do arquivo
    n: integer;                                               //variavel de controle
	j: integer;                                               //variavel de controle
	x: integer;                                               //variavel de controle
	y: integer;                                               //variavel de controle
	i: integer;                                               //variavel de controle
	l: integer;                                               //variavel de controle para o vetor sobrou
	c: integer;                                               //variavel que armazena a posi��o da segunda extremidade do domino
	z: integer;                                               //armazena a extremidade1 da forma��o
	k: integer;	                                            //armazena a extremidade2 da forma��o 
	cont: integer;                                            //variavel contadora
	cont1: integer;                                           //variavel contadora
	teste: integer;                                           //variavel contadora 
	e1,e2: integer;                                           //extremidades principais
	diferente,flag,entrou, flag1: boolean;                    //variaveis de verifica��o
	sobrou: array [1..100] of integer;                        //vetor para armazenar os dominos que nao encaixam
	vetor: array [1..100] of integer;                         //vetor principal que armazena os dominos da forma que for lido do arquivo
	
 Begin
 	clrscr;
 	
 	assign(arquivo,'domino.txt');                             //assinalamento entre o nome interno e o externo do arquivo
 	reset(arquivo);                                           //abre o arquivo existente em posi��o de leitura 
 	readln(arquivo,n);                                        //le o numero de dominos
 	
 	cont:= 0; 
 	teste:= 1;
	
 	//Inicializando o vetor 
 	for i:= 1 to 100 do
 	begin
 	   vetor[i]:= -3;
  	end;
  		
  	//Inicializando  o vetor sobrou
  	for i:= 1 to 100 do 
  	begin
  		sobrou[i]:= -3;
  	end;
 	
 	//Enquanto nao chegar o final de arquivo
 	while (n <> 0) do
 	begin
 		j:= 1;
 		l:= 1;
 		e1:= -3;
  		e2:= -3;
  		diferente:= false;
  		flag1:= false;
 		flag:= false;
 		entrou:= false;
 		
 		//Atribui��o dos dominos lidos do arquivo ao vetor principal
		for i:= 1 to n do
 		begin
 			readln (arquivo,x,y);
 			vetor[j]:= x;
 			vetor[j+1]:= y;
 			j:= j+2;	
 		end;
 		
 		//Compara��o no vetor 
 		for i:= 1 to 2*n do 
 		begin
 		    entrou:= false;
 		    flag:= false;
 		    if (vetor[i] <> -1) then
 		    begin
 		      
 		      //Verificando se a partir do 2� domino ele encaixa com as extremidades principais ou com o vetor sobrou
			 if (cont >= 2) then 
			 begin
			      //Pegando a segunda extremidade(parceiro) do domino analisado
				 if (i mod 2 = 0) then
 		           begin
 		          	z:= vetor[i-1];
  		           end
 		           else
 		           begin
 		               z:= vetor[i+1];
  		           end;
  		           
  		           //Comparando com as extremidades principais
			      if (vetor[i] = e1)  then
			      begin
			        e1:= z;
			        flag1:= true;
                       
                    //Cortando os dominos ja utilizados
				   if (i mod 2 = 0) then
 		             begin
 		          	vetor[i-1]:= -1;
 		          	vetor[i]:= -1;
  		             end
 		             else
 		             begin
 		               vetor[i+1]:= -1;
 		               vetor[i]:= -1;
  		             end;
				   			        
			      end
			     else			      
				 if (vetor[i] = e2) then
			      begin
			        e2:= z;
				   flag1:= true;
                       
				   //Cortando os dominos j� utilizados
				   if (i mod 2 = 0) then
 		             begin
 		          	vetor[i-1]:= -1;
 		          	vetor[i]:= -1;
  		             end
 		             else
 		             begin
 		               vetor[i+1]:= -1;
 		               vetor[i]:= -1;
  		             end;				   
				    
			      end   
			     
			     else 			
				 if (z = e1) then
			      begin
			        e1:= vetor[i];
			        flag1:= true;
                       
				   //Cortando os dominos ja utilizados
				   if (i mod 2 = 0) then
 		             begin
 		          	vetor[i-1]:= -1;
 		          	vetor[i]:= -1;
  		             end
 		             else
 		             begin
 		               vetor[i+1]:= -1;
 		               vetor[i]:= -1;
  		             end;			        
			        
			      end			     
			     
			     else
			     
			      if (z = e2) then
			      begin
			        e2:= vetor[i];
			        flag1:= true;
                       
				   //Cortando
				   if (i mod 2 = 0) then
 		             begin
 		          	vetor[i-1]:= -1;
 		          	vetor[i]:= -1;
  		             end
 		             else
 		             begin
 		               vetor[i+1]:= -1;
 		               vetor[i]:= -1;
  		             end;			        
			        
			      end			     
			     
			     else
			
			       //Se nao entrar nas condicoes acima verifica se encaixa com o vetor sobrou
			       for j:= 1 to 100 do
			       begin
			           If (sobrou[j] <> -3) or (sobrou[i] <> -1) then
			           begin
			               If (vetor[i] = sobrou[j]) then
			               begin 	                         
						   sobrou[j]:= z; 
						   flag1:= true;
                                 
                            //Cortando os dominos ja utilizados
						   if (i mod 2 = 0) then
 		                       begin
 		          	           vetor[i-1]:= -1;
 		          	           vetor[i]:= -1;
  		                       end
 		                       else
 		                       begin
 		                          vetor[i+1]:= -1;
 		                          vetor[i]:= -1;
  		                       end;   
						   
						   //Assim que achar sai
						   break;					   			               
			               end
			               else
			                   If (z = sobrou[j]) then
			                   begin
			                       sobrou[j]:= vetor[i];	
							   flag1:= true;
                                     
							  //Cortando o vetor analisado e o sua outra extremidade(parceiro)
						   	   if (i mod 2 = 0) then
 		                        	   begin
 		          	                 vetor[i-1]:= -1;
 		          	                 vetor[i]:= -1;
  		                             end
 		                             else
 		                             begin
 		                                 vetor[i+1]:= -1;
 		                                 vetor[i]:= -1;
  		                              end;  							   
							   
							     break;		                   
			                   end; 			               
			           end;
			       
			       end;
			    end; 
			     
			  end;
			 
			 //Se nao entrou nas condi�oes acima, verifica com os outros dominos do vetor principal
 		      If (flag1 <> true) then
 		      begin
			   //Verifica��o com o vetor 
			   for j:= 1 to 2*n do
 		        begin   
 		        	
				//Atribuindo a posi��o da segunda extremidade(parceiro) do domino analisado
				if (i mod 2 = 0) then
 		        	begin
 		        	    c:= i-1;
 		        	end
 		        	else
 		        	begin
 		        		c:= i +1;
 		        	end;
 		        	
 		        	//Condi��o para que nao seja comparado o domino com ele mesmo
 		          if (i<>j) then
 		          begin
 		          	if (vetor[i] = vetor[j]) and (c <> j) then
 		          	begin
 		          		entrou := true;
 		          		cont1:= 0;
 		          	
					 	//Pegando a primeira extremidade da forma��o e cortando os ja utilizados
 		          		if (i mod 2 = 0) then
 		          		begin
 		          		    z:= vetor[i-1];
 		          		    vetor[i]:= -1;
 		          		    vetor[i-1]:= -1;
 		          		end
 		          		else
 		          		begin
 		          		    z:= vetor[i+1];
 		          		    vetor[i]:= -1;
 		          		    vetor[i+1]:= -1;
 		          		end;
 		          		
						 //pegando a segunda extremidade da forma��o
 		          		if (j mod 2 = 0 ) then
 		          		begin
 		          		    k:= vetor[j-1];
 		          		    vetor[j]:= -1;
 		          		    vetor[j-1]:= -1; 
						end
						else
						begin
							k:= vetor[j+1];
							vetor[j]:= -1;
							vetor[j+1]:= -1;
						end;  
						
						//Condi��o para verificar se as extremidades est�o vazias 
						if (e1 = -3) and (e2= -3) then
						begin
						   e1:=z;
						   e2:=k;
						   flag:= true;
						end
						
						//verificacao se encaixa com as extremidades
						else
						
						    if (z = e1) then
						    begin
						        e1:=k;
						        flag:= true;
						    end
						    else
						    if (z=e2) then
						    begin
						    		e2:=k;
								flag:= true;
							end
							else
							if (k  = e1) then
							begin
								e1:= z;
								flag:= true;
							end
							else
							if (k=e2) then
							begin
								e2:=z;
								flag:= true;
							end;
							break;    	
						
					end;	
 		         end;
 		        end; 
 		     
 		    //Condi�ao se houve forma��o mas n�o se encaixou com as extremidades principais 
 		    if (entrou = true) and(flag = false) then
 		    begin
 		    	sobrou[l]:= z;
 		    	sobrou[l +1]:= y;
 		    	l:= l + 2;
 		    end;
 		    
 		    //Condi��o se nao houve forma��o o domin� 
		    if (entrou = false) and (flag = false) then
 		    begin
 		    
 		       //Contadora para verificar se as duas extremidades do domino foram testadas
 		    	  cont1:= cont1 + 1;
 		    	  
 		    	  //Se as duas extremidades formam testadas mas n�o houve forma��o
		       if (cont1 = 2) then
 		    	  begin
 		    	     
				//Atribuindo as extremidades a variaveis 	      
 		    	  	if (i mod 2 = 0) then
 		          begin
 		          	 z:= vetor[i-1];
 		          	 vetor[i]:= -1;
 		          	 vetor[i-1]:= -1;
 		         	end
 		   		else
 	        		begin	          		 
				       z:= vetor[i+1];
 		        		  vetor[i]:= -1;
 		         		  vetor[i+1]:= -1;
 		    		end;
 		    		
 		    		//Atribui��o ao vetor sobrou
 		    		sobrou[l]:= z;
 		    		sobrou[l +1]:= y;
 		    		l:= l + 2;
 		    	  
 		    	  end;
 		    end;
 		   end;
 		    
 		  //Verfica��o se o vetor sobrou encaixa com as extremidades principais
 		  for j:= 1 to 100 do
 		  begin
 		     
			//Se o vetor sobrou for diferente de 'vazio' ou diferente de 'usado' 
			if (sobrou[j] <> -3) and (sobrou[j] <> -1) then
 		     begin
 		     
 		        //Verifica��o se encaixa com as extremidades principais
 		        If (e1 = sobrou[j]) then
 		        begin
 		          if (j mod 2 = 0 ) then
 		          begin
 		            e1:= sobrou[j-1];
 		            sobrou[j]:= -3;
 		            sobrou[j -1]:= -3; 
 		          
 		          end
 		          else
 		          begin
 		            e1:= sobrou[j + 1];
 		            sobrou[j]:= -3;
 		            sobrou[j+1]:= -3;	          
 		          end;
 		          
 		        end
 		        else
 		           If (e2 = sobrou[j]) then
 		           begin
                       if (j mod 2 = 0 ) then
 		              begin
 		                 e2:= sobrou[j-1];
 		                 sobrou[j]:= -3;
 		                 sobrou[j -1]:= -3; 
 		          
 		              end
 		              else
 		              begin
 		               e2:= sobrou[j + 1];
 		               sobrou[j]:= -3;
 		               sobrou[j+1]:= -3;	          
 		              end;         
 		           
 		           end;   
		     end;		  
 		  end;
		    
		  //Incrementa��o ao acabar de verificar cada extremidade do domino   
 		  cont:= cont + 1;
 		  
 		end;		
 		
 	     //Verifica��o se sobrou algum domino sem encaixar
          for i:= 1 to l-2 do
 		begin
 		    if (sobrou[i] <> -1) and (sobrou[i] <> -3) then                //se o vetor sobrou for '-3' significa que ele esta vazio
 		    begin                                                          //se o vetor sobrou for '-1' significa que ele ja foi usado
 		        diferente := true;
 		    end;
 		end;
 		
 		//Se existe algum numero no vetor sobrou
 		if (diferente = true) then
 		begin
 		    writeln ('TESTE ',teste);
 		    writeln ('nao');
 		end
 		else
 		begin
 		     //se o vetor estiver vazio ou usado
 			 writeln ('TESTE ',teste);
 		     writeln ('sim');
 		end;

 		
 		//Inicializando o vetor 
 		for i:= 1 to 100 do
 		begin
 			vetor[i]:= -3;
  		end;
  		
  		//Inicializando  o vetor sobrou
  		for i:= 1 to 100 do 
  		begin
  			sobrou[i]:= -3;
  		end;
  		

 		teste:= teste + 1;
 		
 		//Lendo o novo numero de dominos, teste seguinte
 		readln (arquivo,n); 	
 	
 	end;
 	
 	//Fechando o arquivo
 	close (arquivo);
 	
 	readkey;
 	
 End.
