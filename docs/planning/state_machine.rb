#!/usr/bin/env ruby

# Andrew Horsman

# Tetris Planning
# Action State Machine

class GameStateMachine
  
  def initialize
    @actions = {}
  end
  
  def define_action(symbol_call, &proc)
    raise AlreadyDefinedAction, "Action #{symbol_call.inspect} is already defined." if @actions.member? symbol_call
    raise NoProcedureGiven, "No block given to execute." unless block_given?
    
    @actions[symbol_call] = { :state => :none, :method => proc, :iterator => 0 }
  end
  
  def change_state(symbol_call, new_state)
    raise InvalidState, "State must be a symbol." unless new_state.kind_of? Symbol
    raise InvalidAction, "Action does not exist." unless @actions.member? symbol_call
    
    @actions[symbol_call][:state] = new_state
  end 
  
  def execute_if_clear(symbol_call)
    raise InvalidAction, "Action does not exist." unless @actions.member? symbol_call
    
    @actions[symbol_call][:method].call if check_state_of? symbol_call, :none
  end
  
  protected
  
    def check_state_of?(symbol_call, state)
      @actions[symbol_call][:state] == state
    end
  
end
