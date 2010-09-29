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
  end
  
  def draw
  end

end

class TestGameWindow < GameWindow

  def initialize
    super
    @tetromino_set = [Tetromino.new(self, :t)]
  end
  
  def draw
    @tetromino_set.each do |mino|
      mino.draw
    end
  end
  
  def update
  end
  
  def button_up(button)
    if button == Gosu::Button::KbLeft
      @tetromino_set.each { |mino| mino.move_left }
    elsif button == Gosu::Button::KbRight
      @tetromino_set.each { |mino| mino.move_right }
    elsif button == Gosu::Button::KbDown
      @tetromino_set.each { |mino| mino.move_down }
    elsif button == Gosu::Button::KbUp
      @tetromino_set.each { |mino| mino.rotate }
    elsif button == Gosu::Button::KbEscape
      close
    end
  end
  
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
    @order = GameConfig::ORIENTATION_ORDER
  end
  
  def draw
    grab_blocks do |x, y|
      @box_image.draw(x, y, GameConfig::ZIndex::Tetromino)
    end
  end
  
  def rotate
    current = @order.index(@cur_orientation)
    current = GameConfig::ROTATION_DIRECTION == :left ? current - 1 : current + 1
    current %= @order.length
    @cur_orientation = @order[current]
  end

  def move_down
    @cur_y += 1 unless @cur_y == GameConfig::WINDOW_HEIGHT_BOXES
  end 
  
  def move_left
    @cur_x -= 1 unless @cur_x == 0
  end 
  
  def move_right
    @cur_x += 1 unless @cur_x == GameConfig::WINDOW_WIDTH_BOXES
  end 
  
  private 
  
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

window = TestGameWindow.new
window.show
