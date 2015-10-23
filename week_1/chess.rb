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
		# @position_board=position_board
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
 attr_accessor :x,:y, :new_x ,:new_y
 include HorizontalMove
 include VerticalMove
   def move(new_x,new_y)

 	if is_horizontal?(x,y,new_x,new_y)|| is_vertical?(x,y,new_x,new_y)
 		puts "Rooks moves from (#{x},#{y}) to (#{new_x},#{new_y}) is a legal move"
 	else
 		puts "Rooks moves from (#{x},#{y}) to (#{new_x},#{new_y}) is an ilegal move"
 	end
 end

#bR1=Rook.new(1,8,"black")  #a8
#br2=Rook.new(8,8,"black")  #h8
#wR1=Rook.new(1,1,"white")  #a1
#wr!=Rook.new(8,1,"white")  #h1
#puts bR1.move (1,5) move to a5 should be good
#puts bR1.move(4,6)  move to d6 should be bad 
#return some value
     
end

class Pawn < Piece
  attr_accessor :x,:y,:new_x ,:new_y
  include VerticalMove
  include HorizontalMove

end


class King < Piece
	attr_accessor :x,:y, :new_x ,:new_y
	include VerticalMove
	include HorizontalMove
	include DiagonalMove
	
	
	def move(new_x,new_y)
		
		if is_vertical?(x,y,new_x,new_y) || is_horizontal?(x,y,new_x,new_y) || is_diagonal?(x,y,new_x,new_y)
			Puts "moves to (#{new_x},#{new_y}) should be good."
		else
			Puts "moves to (#{new_x},#{new_y}) is an illegal move."
		end
    end
end


class Queen < Piece
	attr_accessor :x,:y, :new_x ,:new_y
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
	attr_accessor :x,:y, :new_x ,:new_y 
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
    attr_accessor :x,:y, :new_x ,:new_y 
	include VerticalMove
	include HorizontalMove
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


    end
end

chest_game=ListExecutions.new
chest_game.check_movements

