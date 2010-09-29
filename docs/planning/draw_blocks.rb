#!/usr/bin/env ruby

# Andrew Horsman

# Tetris Planning
# Draw BlockPrototype

require 'gosu'
require File.expand_path(File.dirname(__FILE__) + '/block_prototype')
require File.expand_path(File.dirname(__FILE__) + '/game_config')

class GameWindow < Gosu::Window

  def initialize
    super(GameConfig::window_width, GameConfig::window_height, false)
    
    self.caption = "Block Drawing Prototype | rgb-tetris"
    
    create_test_tetromino
  end
  
  def create_test_tetromino
    @test_tetromino = Tetromino.new(self, :t)
  end
  
  def draw
    @test_tetromino.draw unless @test_tetromino.nil?
  end

end

module ZIndex
  Tetromino = 0
end

class Tetromino
  
  def initialize(window, block_prototype)
    @window    = window
    @cur_x     = 1
    @cur_y     = 1      
    @box_image = Gosu::Image.new(@window, "box.png", false) 
    @tetromino = case block_prototype
      when :i then Tetrominoes::MinoI
      when :j then Tetrominoes::MinoJ
      when :l then Tetrominoes::MinoL
      when :o then Tetrominoes::MinoO
      when :s then Tetrominoes::MinoS
      when :z then Tetrominoes::MinoZ
      when :t then Tetrominoes::MinoT
    end
    @cur_orientation = :up
  end
  
  def draw
    grab_blocks do |x, y|
      @box_image.draw(x, y, ZIndex::Tetromino)
    end
  end
  
  def grab_blocks
    @tetromino.orientations[@cur_orientation].blocks.each_value do |block|
      yield calculate_absolute_x(block.x), calculate_absolute_y(block.y)
    end
  end
  
  def calculate_absolute_x(relative_x)
    @cur_x * 30 + relative_x * 30
  end
  
  def calculate_absolute_y(relative_y)
    @cur_y * 30 + relative_y * 30
  end
  
end

window = GameWindow.new
window.show
