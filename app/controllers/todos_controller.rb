class TodosController < ApplicationController
before_action :find_todo, only: [ :edit, :update, :destroy, :active, :complete]
	def index
		@todo = Todo.new
		@todos = Todo.all
		if params[ :filter ].present?
			@todos = @todos.active if params[ :filter ] == "active"
			@todos = @todos.completed if params[ :filter ] == "completed"
		end
	end

	def create
		@todo =Todo.new(todo_params)
		if  @todo.save
			redirect_to root_path
		else
			render  :index			
		end
	end

	def edit
			
	end

	def update
		if @todo.update(todo_params)
			redirect_to root_path
		else
			render  :edit
		end		
	end

	def complete
		@todo.completed!
		redirect_to root_path		
	end

	def active
		@todo.active!
		redirect_to root_path
	end

	def destroy
		@todo.destroy
		redirect_to root_path
	end

	private

	def find_todo
		@todo = Todo.find(params[ :id])		
	end

	def todo_params
		params.require( :todo) .permit( :content)		
	end
end
