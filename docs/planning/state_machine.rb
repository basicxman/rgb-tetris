#!/usr/bin/env ruby

# Andrew Horsman

# Tetris Planning
# Action State Machine

# Holds actions with a current state in order to provide relative keyboard 
# polling cycles thus allowing for smooth motion.
class KeyboardStateMachine
  
  # Creates a new KeyboardStateMachine instance with a blank actions Hash.
  def initialize
    @actions = {}
  end
  
  # Defines a new action with a state, iteration and action. 
  #
  # @param [Symbol] symbol_call a symbol which references an action/state pair.
  # @param [Fixnum] threshold the state will refresh to :none after this threshold is reached.
  # @param [Block] &proc a block containing an executable action.
  def define_action(symbol_call, threshold, &proc)
    raise AlreadyDefinedAction, "Action #{symbol_call.inspect} is already defined." if @actions.member? symbol_call
    raise NoProcedureGiven, "No block given to execute." unless block_given?
    
    @actions[symbol_call] = { :state => :none, :method => proc, :iterator => 1, :threshold => threshold }
  end
  
  def execute_if_clear(symbol_call)
    raise InvalidAction, "Action does not exist." unless @actions.member? symbol_call
    
    if check_state_of? symbol_call, :none
      @actions[symbol_call][:method].call 
      change_state_of symbol_call, :just_pressed
      reset_iterator_of symbol_call
    end
  end
  
  def advance_state
    @actions.each_key do |action|
      increment_iterator_of action if check_state_of? action, :just_pressed
    end
  end
  
  protected
  
    def check_state_of?(symbol_call, state)
      @actions[symbol_call][:state] == state
    end
    
    def reached_threshold?(symbol_call)
      @actions[symbol_call][:iterator] == @actions[symbol_call][:threshold]
    end
    
    def increment_iterator_of(symbol_call)
      @actions[symbol_call][:iterator] += 1
      if reached_threshold? symbol_call
        reset_iterator_of symbol_call
        change_state_of   symbol_call, :none
      end
    end 
    
    def reset_iterator_of(symbol_call)
      @actions[symbol_call][:iterator] = 1
    end
    
    def change_state_of(symbol_call, new_state)
      @actions[symbol_call][:state] = new_state
    end   
  
end
