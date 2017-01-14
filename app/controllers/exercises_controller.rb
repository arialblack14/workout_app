class ExercisesController < ApplicationController
  def index
    # e.g with named scopes we would have something like this for
    # displaying last weeks workouts in desc order
    # @exercises = current_user.exercises.last_week.desc_date
    @exercises = current_user.exercises
  end

  def show
    @exercise = current_user.exercises.find(params[:id])
  end

  def new
    @exercise = current_user.exercises.new
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)

    if @exercise.save
      flash[:notice] = "Exercise has been created"
      # redirect_to user_exercise_path(current_user, @exercise)
      # instead of the shorthand below
      redirect_to [current_user, @exercise]
    else
      flash.now[:alert] = "Exercise has not been created"
      render :new
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
  end
end
