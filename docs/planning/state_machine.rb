#!/usr/bin/env ruby

# Andrew Horsman

# Tetris Planning
# Action State Machine

# Holds actions with a current state in order to provide relative keyboard 
# polling cycles thus allowing for smooth motion.
class KeyboardStateMachine
  
  # Creates a new KeyboardStateMachine instance with a blank actions Hash.
  #
  # @example create a new state machine
  #   keyboard = KeyboardStateMachine.new
  #   keyboard.define_action(....)
  def initialize
    @actions = {}
  end
  
  # Defines a new action with a state, iteration and action. 
  #
  # @param [Symbol] symbol_call a symbol which references an action/state pair.
  # @param [Fixnum] threshold the state will refresh to :none after this threshold is reached.
  # @param [Block] &proc a block containing an executable action.
  #
  # @raise AlreadyDefinedAction if the action already exists in the instance's Hash.
  # @raise NoProcedureGiven if no block is given to execute
  #
  # @example Defining an action which refreshes state after five cycles.
  #   keyboard_state_machine.define_action(:move_left, 5) do
  #     character.position.x -= 1
  #   end
  def define_action(symbol_call, threshold, &proc)
    raise AlreadyDefinedAction, "Action #{symbol_call.inspect} is already defined." if @actions.member? symbol_call
    raise NoProcedureGiven, "No block given to execute." unless block_given?
    
    @actions[symbol_call] = { :state => :none, :method => proc, :iterator => 1, :threshold => threshold }
  end
  
  # Executes an action via it's symbol reference if it's current state is :none
  #
  # @param [Symbol] symbol_call the action's reference symbol
  #
  # @raise InvalidAction if the action does not exist in the instance's Hash
  #
  # @example Calling the move_left action
  #   keyboard_state_machine.execute_if_clear(:move_left)
  def execute_if_clear(symbol_call)
    raise InvalidAction, "Action does not exist." unless @actions.member? symbol_call
    
    if check_state_of? symbol_call, :none
      @actions[symbol_call][:method].call 
      change_state_of symbol_call, :just_pressed
      reset_iterator_of symbol_call
    end
  end
  
  # Increments the iterator of every action not at the :none state, resets them
  # to :none when they reach their threshold.
  #
  # @example Advancing the state of all actions in an instance
  #   keyboard_state_machine.advance_state
  def advance_state
    @actions.each_key do |action|
      increment_iterator_of action if check_state_of? action, :just_pressed
    end
  end
  
  protected
  
    # Compares the state of an action via it's symbol reference to a given state.
    #
    # @param [Symbol] symbol_call the action's symbol reference.
    # @param [Symbol] state the state to compare to
    #
    # @example checking whether the move_left action is at a :none state.
    #   check_state_of(:move_left, :none)
    #
    # @return [Boolean] returns true if the state of the action being checked is
    # equal to the state given.
    def check_state_of?(symbol_call, state)
      @actions[symbol_call][:state] == state
    end
    
    # Checks if an action has reached it's iteration threshold.
    #
    # @param [Symbol] symbol_call the action's symbol reference
    #
    # @example checks whether the move_left action has reached it's threshold.
    #   reached_threshold?(:move_left)
    # @return [Boolean] returns true if the given action has reached it's threshold.
    def reached_threshold?(symbol_call)
      @actions[symbol_call][:iterator] == @actions[symbol_call][:threshold]
    end
    
    # Increments the iterator of an action via it's symbol reference, resets the
    # iterator and state to :none if the action has reached it's threshold.
    #
    # @param [Symbol] symbol_call the action's symbol reference
    #
    # @example increment the iterator of the move_left action
    #   increment_iterator_of(:move_left)
    # 
    # @return [Fixnum] returns the new value of the action's iterator.
    def increment_iterator_of(symbol_call)
      @actions[symbol_call][:iterator] += 1
      if reached_threshold? symbol_call
        reset_iterator_of symbol_call
        change_state_of   symbol_call, :none
      end
      return @actions[symbol_call][:iterator]
    end 
    
    # Resets the action's iterator to 1.
    #
    # @param [Symbol] symbol_call the action's symbol reference
    #
    # @example reseting move_left's iterator.
    #   reset_iterator_of(:move_left)
    def reset_iterator_of(symbol_call)
      @actions[symbol_call][:iterator] = 1
    end
    
    # Changes the state of an action via it's symbol reference to a new given state.
    # 
    # @param [Symbol] symbol_call the action's symbol reference
    # @param [Symbol] new_state the new state to give the action.
    # 
    # @example set the state of move_left to just_pressed
    #   change_state_of(:move_left, :just_pressed)
    def change_state_of(symbol_call, new_state)
      @actions[symbol_call][:state] = new_state
    end   
  
end
