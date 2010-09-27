#!/usr/bin/env ruby

# Andrew Horsman

# Tetris Planning
# Draw BlockPrototype

require 'gosu'
require 'block_prototype'

class GameWindow < Gosu::Window

  def initialize
    super(800, 420, false)
    
    self.caption = "Block Drawing Prototype | rgb-tetris"
  end

end

class Block
  
  def initialize(window, block_prototype)
    @window    = window
    @cur_x     = 1
    @cur_y     = 1
    @cur_r     = :up
    @box_image = Gosu::Image(@window, "box.png", false) 
    @block     = case block_prototype
      when :i then Tetrominoes::MinoI
      when :j then Tetrominoes::MinoJ
      when :l then Tetrominoes::MinoL
      when :o then Tetrominoes::MinoO
      when :s then Tetrominoes::MinoS
      when :z then Tetrominoes::MinoZ
      when :t then Tetrominoes::MinoT
    end
  end
  
  def draw
    x, y = @cur_x * 30, @cur_y * 30
  end
  
end
