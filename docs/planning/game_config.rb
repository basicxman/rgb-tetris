#!/usr/bin/env ruby

# Andrew Horsman

# Tetris Planning
# Configuration Module File

module GameConfig

  BOX_WIDTH_PIXELS    = 30
  BOX_HEIGHT_PIXELS   = 30
  WINDOW_WIDTH_BOXES  = 14
  WINDOW_HEIGHT_BOXES = 20
  
  ORIENTATION_ORDER   = [:up, :right, :down, :left]
  ROTATION_DIRECTION  = :left
  
  KEYBOARD_CYCLE_LENGTH = 6
  
  def self.window_width
    WINDOW_WIDTH_BOXES * BOX_WIDTH_PIXELS
  end
  
  def self.window_height
    WINDOW_HEIGHT_BOXES * BOX_HEIGHT_PIXELS
  end
  
  
  module ZIndex
    Tetromino = 0
  end
  
end
