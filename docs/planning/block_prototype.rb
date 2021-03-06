#!/usr/bin/env ruby

# Tetris Planning

# Namespace container for the seven standard Tetrominoes.
module Tetrominoes

  # Keep track of an X and Y value for a relative cartesian plane.
  class Position < Struct.new(:x, :y)
  end
  
  # A single orientation for a BlockPrototype, contains four blocks.
  class Orientation
    attr_accessor :blocks
  
    def initialize(a_x, a_y, b_x, b_y, c_x, c_y, d_x, d_y)
      @blocks = {
        :block_a => Position.new(a_x, a_y),
        :block_b => Position.new(b_x, b_y),
        :block_c => Position.new(c_x, c_y),
        :block_d => Position.new(d_x, d_y)
      } 
    end
  end

  # Holds a single Tetromino with four orientations.
  class BlockPrototype
    attr_accessor :orientations
    
    def initialize(up, right, down, left)
      @orientations = { :up => up, :right => right, :down => down, :left => left }
    end
    
    def ascii_render(orientation)
      raise ArgumentError, "Invalid orientation." unless @orientations.include? orientation
      orientation = @orientations[orientation]
      
      grid = Array.new(4).map { |x| x = Array.new(4, " ") }
      orientation.blocks.each_value do |block|
        grid[block.x][block.y] = "-"
      end
      
      render = ""
      
      0.upto(3) do |y|
        0.upto(3) do |x|
          render += grid[x][y]
        end
        render += "\n"
      end
      
      render
    end
  end

  def self.get_tetromino(tetromino_symbol)
    return case tetromino_symbol
      when :i then MinoI
      when :j then MinoJ
      when :l then MinoL
      when :o then MinoO
      when :s then MinoS
      when :z then MinoZ
      when :t then MinoT
    end
  end

  # Define the Tetrominoes...
  
  # ----
  MinoI = BlockPrototype.new(
    Orientation.new(0, 0, 1, 0, 2, 0, 3, 0),
    Orientation.new(1, 0, 1, 1, 1, 2, 1, 3),
    Orientation.new(0, 0, 1, 0, 2, 0, 3, 0),
    Orientation.new(1, 0, 1, 1, 1, 2, 1, 3)
  )
  
  # - 
  # --- 
  MinoJ = BlockPrototype.new(
    Orientation.new(0, 0, 0, 1, 1, 1, 2, 1),
    Orientation.new(1, 0, 0, 0, 0, 1, 0, 2),
    Orientation.new(2, 1, 2, 0, 1, 0, 0, 0),
    Orientation.new(0, 2, 1, 2, 1, 1, 1, 0)
  )
  
  #   -
  # ---
  MinoL = BlockPrototype.new(
    Orientation.new(2, 0, 2, 1, 1, 1, 0, 1),
    Orientation.new(1, 2, 0, 2, 0, 1, 0, 0),
    Orientation.new(0, 1, 0, 0, 1, 0, 2, 0),
    Orientation.new(0, 0, 1, 0, 1, 1, 1, 2)
  )
  
  # --
  # --
  MinoO = BlockPrototype.new(
    Orientation.new(0, 0, 0, 1, 1, 0, 1, 1),
    Orientation.new(0, 0, 0, 1, 1, 0, 1, 1),
    Orientation.new(0, 0, 0, 1, 1, 0, 1, 1),
    Orientation.new(0, 0, 0, 1, 1, 0, 1, 1)
  )
  
  #  --
  # --
  MinoS = BlockPrototype.new(
    Orientation.new(2, 0, 1, 0, 1, 1, 0, 1),
    Orientation.new(1, 2, 1, 1, 0, 1, 0, 0),
    Orientation.new(0, 1, 1, 1, 1, 0, 2, 0),
    Orientation.new(0, 0, 0, 1, 1, 1, 1, 2)
  )
  
  # --
  #  --
  MinoZ = BlockPrototype.new(
    Orientation.new(0, 0, 1, 0, 1, 1, 2, 1),
    Orientation.new(1, 0, 1, 1, 0, 1, 0, 2),
    Orientation.new(2, 1, 1, 1, 1, 0, 0, 0),
    Orientation.new(0, 2, 0, 1, 1, 1, 1, 0)
  )
  
  #  - 
  # ---
  MinoT = BlockPrototype.new(
    Orientation.new(0, 1, 1, 1, 2, 1, 1, 0),
    Orientation.new(0, 0, 0, 1, 0, 2, 1, 1),
    Orientation.new(2, 0, 1, 0, 0, 0, 1, 1),
    Orientation.new(1, 2, 1, 1, 1, 0, 0, 1)
  )
  
end
