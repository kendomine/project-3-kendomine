module EntriesHelper
  def entry_params
    params.require(:entries).permit(:day ,:date, :weighIn, :caloricGoal, :fatGoal, :carbGoal, :proteinGoal)
  end

  def company_params_id
    @entry = Entry.find(entry[:id])
  end
end
