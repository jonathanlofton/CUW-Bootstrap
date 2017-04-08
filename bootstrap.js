



var random_sample = function (array) {
  new_array = []
  for ( i = 0 ; i < array.length ; i++) {
  new_array.push(array[Math.floor(Math.random()*array.length)])
}
  return(new_array)
}


var median = function (un_values) {
    values = un_values.sort()
    var half = Math.floor(values.length/2);

    if (values.length % 2)
        return (values[half]);
    else
        return ((values[half-1] + values[half]) / 2.0);
}

var percent_removal = function (influent, effluent) {
  median_influent = median(random_sample(influent));
  median_effluent = median(random_sample(effluent));

  return (median_influent - median_effluent) / median_influent * 100
}

var percent_removal_lower_CI = function (influent, effluent) {
  list = []
  for (var i = 0 ; i < 5000; i ++) {
    list.push(percent_removal(influent, effluent));
  }
  console.log(list[ list.length * 0.05])
}

var upper_CI_effluent_conc = function (effluent_s) {
  effluent = split_the_string_into_array(effluent_s)
  list_of_effluent_medians = []
  for (var i = 0; i < 5000; i++) {
    list_of_effluent_medians.push(median(random_sample(effluent)));
  }
  sorted_list_of_effluent_medians = list_of_effluent_medians.sort()
  console.log(sorted_list_of_effluent_medians[sorted_list_of_effluent_medians.length * 0.95])
}

var split_the_string_into_array = function (string) {
  array = string.split(" ")
}

influent = "100"
effluent = "99, 90, 99, 98"


split_the_string_into_array(effluent)
// percent_removal(influent, effluent)
// percent_removal_lower_CI(influent, effluent)
upper_CI_effluent_conc(effluent)
