#!/usr/bin/env ruby

# Andrew Horsman

# Tetris Planning
# Draw BlockPrototype

require 'gosu'
require 'set'
require File.expand_path(File.dirname(__FILE__) + '/block_prototype')
require File.expand_path(File.dirname(__FILE__) + '/game_config')
require File.expand_path(File.dirname(__FILE__) + '/state_machine')

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
    @cur_tetromino  = Tetromino.new(self, :t)
    @keyboard_cycle = 1
    @press_queue    = Set.new
  end
  
  def draw
    @cur_tetromino.draw
  end
  
  def update
    if button_down? Gosu::Button::KbEscape
      close
    end
    
    if button_down? Gosu::Button::KbLeft
      @cur_tetromino.state_machine.execute_if_clear(:shift_left)
    end
    
    if button_down? Gosu::Button::KbRight
      @cur_tetromino.state_machine.execute_if_clear(:shift_right)
    end
    
    if button_down? Gosu::Button::KbUp
      @cur_tetromino.state_machine.execute_if_clear(:rotate)
    end
    
    if button_down? Gosu::Button::KbDown
      @cur_tetromino.state_machine.execute_if_clear(:move_down)
    end
  end
  
end

class Tetromino
  
  attr_accessor :state_machine
  
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
    @order           = GameConfig::ORIENTATION_ORDER
    @state_machine   = GameStateMachine.new
    @state_machine.define_action(:shift_left)  { move_left }
    @state_machine.define_action(:shift_right) { move_right }
    @state_machine.define_action(:move_down)   { move_down }
    @state_machine.define_action(:rotate)      { rotate }
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
