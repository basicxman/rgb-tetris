#!/usr/bin/env ruby

# Andrew Horsman

# Tetris Planning
# Configuration Module File

module GameConfig

  BOX_WIDTH_PIXELS    = 30
  BOX_HEIGHT_PIXELS   = 30
  WINDOW_WIDTH_BOXES  = 14
  WINDOW_HEIGHT_BOXES = 20
  
  def self.window_width
    WINDOW_WIDTH_BOXES * BOX_WIDTH_PIXELS
  end
  
  def self.window_height
    WINDOW_HEIGHT_BOXES * BOX_HEIGHT_PIXELS
  end

end