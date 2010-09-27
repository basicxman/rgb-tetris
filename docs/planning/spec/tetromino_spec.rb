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
  
  it "should draw J up correctly" do
    test_render = Tetrominoes::MinoJ.ascii_render(:up)
    test_render.should == "-   \n--- \n    \n    \n"
  end
  
  it "should draw J right correctly" do
    test_render = Tetrominoes::MinoJ.ascii_render(:right)
    test_render.should == "--  \n-   \n-   \n    \n"
  end
  
  it "should draw J down correctly" do
    test_render = Tetrominoes::MinoJ.ascii_render(:down)
    test_render.should == "--- \n  - \n    \n    \n"
  end
  
  it "should draw J left correctly" do
    test_render = Tetrominoes::MinoJ.ascii_render(:left)
    test_render.should == " -  \n -  \n--  \n    \n"
  end

  it "should draw L up correctly" do
    test_render = Tetrominoes::MinoL.ascii_render(:up)
    test_render.should == "  - \n--- \n    \n    \n"
  end
  
  it "should draw L right correctly" do
    test_render = Tetrominoes::MinoL.ascii_render(:right)
    test_render.should == "-   \n-   \n--  \n    \n"
  end
  
  it "should draw L down correctly" do
    test_render = Tetrominoes::MinoL.ascii_render(:down)
    test_render.should == "--- \n-   \n    \n    \n"
  end
  
  it "should draw L left correctly" do
    test_render = Tetrominoes::MinoL.ascii_render(:left)
    test_render.should == "--  \n -  \n -  \n    \n"
  end

  it "should draw O up correctly" do
    test_render = Tetrominoes::MinoO.ascii_render(:up)
    test_render.should == "--  \n--  \n    \n    \n"
  end
  
  it "should draw O right correctly" do
    test_render = Tetrominoes::MinoO.ascii_render(:right)
    test_render.should == "--  \n--  \n    \n    \n"
  end
  
  it "should draw O down correctly" do
    test_render = Tetrominoes::MinoO.ascii_render(:down)
    test_render.should == "--  \n--  \n    \n    \n"
  end
  
  it "should draw O left correctly" do
    test_render = Tetrominoes::MinoO.ascii_render(:left)
    test_render.should == "--  \n--  \n    \n    \n"
  end
  
  it "should draw S up correctly" do
    test_render = Tetrominoes::MinoS.ascii_render(:up)
    test_render.should == " -- \n--  \n    \n    \n"
  end
  
  it "should draw S right correctly" do
    test_render = Tetrominoes::MinoS.ascii_render(:right)
    test_render.should == "-   \n--  \n -  \n    \n"
  end
  
  it "should draw S down correctly" do
    test_render = Tetrominoes::MinoS.ascii_render(:down)
    test_render.should == " -- \n--  \n    \n    \n"
  end
  
  it "should draw S left correctly" do
    test_render = Tetrominoes::MinoS.ascii_render(:left)
    test_render.should == "-   \n--  \n -  \n    \n"
  end
  
  it "should draw Z up correctly" do
    test_render = Tetrominoes::MinoZ.ascii_render(:up)
    test_render.should == "--  \n -- \n    \n    \n"
  end
  
  it "should draw Z right correctly" do
    test_render = Tetrominoes::MinoZ.ascii_render(:right)
    test_render.should == " -  \n--  \n-   \n    \n"
  end
  
  it "should draw Z down correctly" do
    test_render = Tetrominoes::MinoZ.ascii_render(:down)
    test_render.should == "--  \n -- \n    \n    \n"
  end
  
  it "should draw Z left correctly" do
    test_render = Tetrominoes::MinoZ.ascii_render(:left)
    test_render.should == " -  \n--  \n-   \n    \n"
  end
  
  it "should draw T up correctly" do
    test_render = Tetrominoes::MinoT.ascii_render(:up)
    test_render.should == " -  \n--- \n    \n    \n"
  end
  
  it "should draw T right correctly" do
    test_render = Tetrominoes::MinoT.ascii_render(:right)
    test_render.should == "-   \n--  \n-   \n    \n"
  end
  
  it "should draw T down correctly" do
    test_render = Tetrominoes::MinoT.ascii_render(:down)
    test_render.should == "--- \n -  \n    \n    \n"
  end
  
  it "should draw T left correctly" do
    test_render = Tetrominoes::MinoT.ascii_render(:left)
    test_render.should == " -  \n--  \n -  \n    \n"
  end
  
end
