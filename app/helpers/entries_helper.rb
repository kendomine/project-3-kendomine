module EntriesHelper
  def entry_params
    params.require(:entries).permit(:day ,:date, :weighIn, :caloricGoal, :fatGoal, :carbGoal, :proteinGoal, :actualCalories, :actualFat, :actualCarb, :actualProtein)
  end

  def entry_params_id
    @entry = Entry.find(params[:id])
  end
end
