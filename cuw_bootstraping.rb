class Boot
  attr_accessor :data, :list_of_medians, :num_of_data_sets

  def initialize(data, num_of_data_sets)
    @data = data
    @list_of_medians = []
    @num_of_data_sets = num_of_data_sets
  end

  def median(array)
      sorted = array.sort
      len = sorted.length
      (sorted[(len - 1) / 2] + sorted[len / 2]) / 2
  end


  def create_list_of_medians
      temporary_data_set = []

      until list_of_medians.length == num_of_data_sets
              temporary_data_set << data.sample

              if temporary_data_set.length == data.length
                  list_of_medians << median(temporary_data_set)
                  temporary_data_set = []
              end

      end

      list_of_medians.sort
  end

  def mean_effluent_conc
    print "The upper 95% CI around the median effluent concentration is #{create_list_of_medians[num_of_data_sets * 0.95]}\n"
  end

  def lower_95_effluent_removal
    print "The lower 95% CI around the median pollutant removal efficiency is #{create_list_of_medians[num_of_data_sets * 0.05]}\n"
  end

end


data_set_1 = Boot.new([1,2,3,4,5,6,7,8,9,10,11], 5000)
data_set_1.mean_effluent_conc
data_set_1.lower_95_effluent_removal

data_set_2 = Boot.new([1000,1234,512351235,23412314,12341,1234], 10000)
data_set_2.mean_effluent_conc
data_set_2.lower_95_effluent_removal
