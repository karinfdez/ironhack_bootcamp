class ChessValidator   #Class for a chest board

	def initialize (pieces,size)
		@pieces=pieces
		@size=size
	end

	def remove_piece
	end

	def valid_move?
	end

end


class Piece
	
	def initialize(x,y,color)
		@x=x
		@y=y
		@color=color
	end
end

#modules:
module HorizontalMove

	def is_horizontal?(x,y,new_x,new_y)
		(new_x>x ||  new_x < x)  && (new_y==y)
	end
end


module VerticalMove
	
	def is_vertical?(x,y,new_x,new_y)
		(new_y>y || new_y < y)  && (new_x==x)
	end
end

module  DiagonalMove
	include VerticalMove
	include HorizontalMove

	def is_diagonal?(x,y,new_x,new_y)
		
		range_x=new_x-x
		
		range_x<0
			range_x=range_x.abs

		range_y=new_y-y
		
		range_y<0
			range_y=range_y.abs
		
		range_x==range_y
		
    end
end


#Pieces classes

class Rook < Piece
 attr_accessor :x,:y
 include HorizontalMove
 include VerticalMove
   def move(new_x,new_y)

 	if is_horizontal?(x,y,new_x,new_y)|| is_vertical?(x,y,new_x,new_y)
 		puts "Rooks moves from (#{x},#{y}) to (#{new_x},#{new_y}) is a legal move"
 	else
 		puts "Rooks moves from (#{x},#{y}) to (#{new_x},#{new_y}) is an ilegal move"
 	end
 end

end

class Pawn < Piece
  attr_accessor :x,:y,:color
  include VerticalMove
  include HorizontalMove
 
  def move(new_x,new_y)

  	neg_y=false
	range_y=new_y-y
		
	if range_y<0
		range_y=range_y.abs
		neg_y=true
	end

	valid_move="Paws moves from (#{x},#{y}) to (#{new_x},#{new_y}) is a legal move"
	invalid_move="Paws moves from (#{x},#{y}) to (#{new_x},#{new_y}) is an ilegal move"

		if is_vertical?(x,y,new_x,new_y) 
			if (y==2 && color=="white")
				if neg_y==false
					if (range_y==2 || range_y==1)
						puts valid_move
					else 
						puts invalid_move
					end
			    else
			    	#puts "POR AQUI TAMBIEN"
			    	puts invalid_move
			    end
			elsif (y>2 && color=="white")
				if neg_y==false
					if (range_y==1)
						puts valid_move
					end
				else
					invalid_move
			    end
			elsif y<2 && color=="white"
				puts invalid_move
			end

	    else
	    	invalid_move
	    end

		
	    if is_vertical?(x,y,new_x,new_y) 
			if (y==7 && color=="black")  #Pawn pice is on initial position   4,5
				if neg_y==true                #Moving on the right direction.
					if (range_y==2 || range_y==1)
						puts valid_move
					else 
						puts invalid_move
					end
				else
				    puts invalid_move
				end
			elsif (y<7 && color=="black")
				if neg_y==true 
					if (range_y==1)
						puts valid_move
					else
						puts invalid_move
					end
				else
					puts invalid_move
				end

			elsif (y>7 && color=="black")
				puts invalid_move
			end
		else
			puts invalid_move
		end
    end
end

class King < Piece
    attr_accessor :x,:y
	include VerticalMove
	include HorizontalMove
	include DiagonalMove
	
	def move(new_x,new_y)
		
		range_x=new_x-x
		range_y=new_y-y
		diagonal=false
		horizontal=false
	    vertical=false
		
		range_x<0
			range_x=range_x.abs
		
		range_y<0
			range_y=range_y.abs
		
		if (range_x==1) && is_horizontal?(x,y,new_x,new_y)
			horizontal=true
		end
		if (range_y==1) && is_vertical?(x,y,new_x,new_y)
			vertical=true
		end
		if (range_x==range_y) && is_diagonal?(x,y,new_x,new_y)
 			diagonal=true
 		end
		
		boolean_movement= horizontal || vertical || diagonal
    	print_message(boolean_movement,new_x,new_y)
	end

	def print_message(boolean_movement,new_x,new_y)

		if boolean_movement
			puts "King moves from (#{x},#{y}) to (#{new_x},#{new_y}) is a legalmove."
		else
			puts "King moves from (#{x},#{y}) to (#{new_x},#{new_y}) is an ilegal move."
		end

	end
end



class Queen < Piece
	attr_accessor :x,:y
	include HorizontalMove
	include VerticalMove
	include DiagonalMove

	def move(new_x,new_y)
		if is_vertical?(x,y,new_x,new_y) || is_horizontal?(x,y,new_x,new_y) || is_diagonal?(x,y,new_x,new_y)
			puts "Queen moves from (#{x},#{y}) to (#{new_x},#{new_y}) is a valid move"
		else
			puts "Queen moves from (#{x},#{y}) to (#{new_x},#{new_y}) is an ilegal move."
		end
    end
end

class Bishop < Piece
	attr_accessor :x,:y
	include DiagonalMove
	
	def move(new_x,new_y)
		
		if is_diagonal?(x,y,new_x,new_y)
			puts "Bishop's moves from (#{x},#{y}) to (#{new_x},#{new_y}) is a legal move ."
		else
			puts "Bishop's moves from (#{x},#{y}) to (#{new_x},#{new_y}) is an ilegal move."
	    end
    end
end


class Knight < Piece
    attr_accessor :x,:y
	# include VerticalMove
	# include HorizontalMove

	def move(new_x,new_y)
		
		range_x=new_x-x
		range_y=new_y-y
		
		range_x<0
			range_x=range_x.abs
		
		range_y<0
			range_y=range_y.abs
		
		boolean_patern=(range_x==1 && range_y==2) || (range_x==2 && range_y==1)  #Pater of 1,2 or 2,1
		
		valid_movement?(boolean_patern)
	end

	def valid_movement?(boolean_patern)
		
		if boolean_patern
			puts "Knight move is valid."
		else
			puts "Knight move is ilegal."
	    end
	end
end
	
class ListExecutions

	def check_movements
		puts "Rook piece"
		rook = Rook.new(1,1, 'white')
		rook.move(1,4)
		rook.move(1,3)
		rook.move(2,2)  #invalid movement

		puts "Bishop piece"
		bishop=Bishop.new(2,2,"white")
		bishop.move(3,3)
		bishop.move(3,1)
		bishop.move(1,2)  #invalid movement

		puts "Queen piece"
		queen=Queen.new(6,4,"white")
		queen.move(3,4)  #horizontal
		queen.move(6,8)  #vertical
		queen.move(2,4)  #diagonal 
		queen.move(3,5)  #invalid

		puts "Knight piece"
		knight=Knight.new(3,2,"white")
		knight.move(5,3)  
		knight.move(2,1)   #invalid
		knight.move(4,4)  
		knight.move(5,3)  
		knight.move(1,3)  
		knight.move(1,1)  
		knight.move(2,4) 
		knight.move(5,1) 
		knight.move(7,8)   #invalid


		puts "King piece"
		king=King.new(3,2,"white")
		king.move(5,3)   #invalid
		king.move(3,1)  
		king.move(4,2)  
		king.move(1,2)  #invalid
		king.move(2,2)  
		king.move(4,3)
		king.move(4,1)
		king.move(2,1)
		king.move(2,3)

		puts "Pwan piece"
		pawn_white=Pawn.new(3,2,"white")  #Initial position of white pieces
		pawn_white.move(3,3)   
		pawn_white.move(3,4)   
		pawn_white.move(4,4)  #invalid   
		pawn_white.move(3,1)  #invalid    
		pawn_black=Pawn.new(5,7,"black") #Initial position of black pieces  
		pawn_black.move(5,6)   
		pawn_black.move(5,5)   
		pawn_black.move(4,5)  #invalid 
		pawn_black.move(5,8)  #invalid 
		pawn_black=Pawn.new(8,3,"black") #Other position other than initial 
		pawn_black.move(8,4)   #invalid 
		pawn_black.move(8,1)   #invalid
		pawn_black.move(7,2)   #invalid  
		pawn_black.move(8,2)   
    end
end

chest_game=ListExecutions.new
chest_game.check_movements

