#!/usr/bin/env ruby

# Andrew Horsman

# Tetris Planning
# Configuration Module File

# Namespace module for game configuration settings.
module GameConfig

  # The width in pixels of a single box (a Tetromino is comprised of four 
  # positioned boxes).
  BOX_WIDTH_PIXELS    = 30
  
  # The height in pixels of a single box (a Tetromino is comprised of four 
  # position boxes).
  BOX_HEIGHT_PIXELS   = 30
  
  # The width in boxes of a game window (might not necessarily be the total width).
  WINDOW_WIDTH_BOXES  = 14
  
  # The height in boxes of a game window (might not necessarily be the total height).
  WINDOW_HEIGHT_BOXES = 20
  
  # The proper order of Tetromino orientations.
  ORIENTATION_ORDER   = [:up, :right, :down, :left]
  
  # The direction in which the orientation is advanced.
  #
  # @see GameConfig#ORIENTATION_ORDER
  ROTATION_DIRECTION  = :left

  # Relative keyboard action polling cycle.
  RELATIVE_STATE_CYCLE = 10
  
  # Returns the calculated window width in pixels based on the window width in
  # boxes times the box width in pixels.
  #
  # @example Output the window width.
  #   puts GameConfig::window_width
  #
  # @return [Fixnum] calculated width
  def self.window_width
    WINDOW_WIDTH_BOXES * BOX_WIDTH_PIXELS
  end
  
  # Returns the calculated window height in pixels baesd on the window height in
  # boxes times the box height in pixels.
  #
  # @example Output the window height.
  #   puts GameConfig::window_height
  # 
  # @return [Fixnum] calculated height
  def self.window_height
    WINDOW_HEIGHT_BOXES * BOX_HEIGHT_PIXELS
  end
  
  # A module containing the z-index order of various constants.
  module ZIndex 
    # A Tetromino should be drawn at the 0th z-index.
    Tetromino = 0
  end
  
end
