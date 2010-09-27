#!/usr/bin/env ruby

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Tetrominoes do
  
  it "should draw I up correctly" do
    test_render = Tetrominoes::MinoI.ascii_render(:up)
    test_render.should == "----\n    \n    \n    \n"
  end
  
  it "should draw I right correctly" do
    test_render = Tetrominoes::MinoI.ascii_render(:right)
    test_render.should == " -  \n -  \n -  \n -  \n"
  end
  
  it "should draw I down correctly" do
    test_render = Tetrominoes::MinoI.ascii_render(:down)
    test_render.should == "----\n    \n    \n    \n"
  end
  
  it "should draw I left correctly" do
    test_render = Tetrominoes::MinoI.ascii_render(:left)
    test_render.should == " -  \n -  \n -  \n -  \n"
  end

end
