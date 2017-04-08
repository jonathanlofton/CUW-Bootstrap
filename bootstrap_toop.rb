def median(array)
  sorted = array.sort
  len = sorted.length
  (sorted[(len - 1) / 2] + sorted[len / 2]) / 2
end

def random_sample(array)
  new_array = []
  array.length.times { new_array << array.sample }
  return new_array
end

def percent_removal(influent, effluent)
  median_influent = median(random_sample(influent)).to_f
  median_effluent = median(random_sample(effluent)).to_f

  ((median_influent - median_effluent) / median_influent) * 100
end

def percent_removal_lower_CI(influent, effluent, n)
  list = []
  until list.length == n
    list << percent_removal(influent, effluent)
  end
  list.sort!
  list[list.length * 0.05]
end

def upper_CI_effluent_conc(effluent)
  list_of_effluent_medians = []
  until list_of_effluent_medians.length == 5000
    list_of_effluent_medians<< median(random_sample(effluent)).to_f
  end
    list_of_effluent_medians.sort!
    list_of_effluent_medians[list_of_effluent_medians.length * 0.95]
end


influent = [95, 94, 93,95, 94, 93,95, 94, 93, 95]
effluent = [85, 84, 83,85, 84, 83,85, 84, 83,85, 84, 83,]



p "The lower 95% CI of percent removal is #{percent_removal_lower_CI(influent, effluent, 5000).round(2)}%"
p "The upper 95% CI of effluent concentration is #{upper_CI_effluent_conc(effluent)}"
