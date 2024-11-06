working_directory = "C:/Users/JWang/Documents/GitHub/Healthy-Menu-Item-Study/"
import sys
import os
import pandas as pd
import multiprocessing
from multiprocessing import Pool
sys.path.append(working_directory)
os.chdir(working_directory) 
import CheckForHealthy
checkforhealthy = CheckForHealthy.CheckForHealthy()
checkforhealthy.working_directory = working_directory
year_range = range(2012, 2018 + 1)
def checkyear(year):
    checkforhealthy.year = year
    checkforhealthy.menu_path = "MenuStat_" + str(year) + "_fullsample.csv" 
    output_path = "menu_healthyitems_" + str(year) + ".csv"
    checkforhealthy.run_all_save(output_path = output_path)
    checkforhealthy.nemsscore(scores_path = "restaurant_scores_" + str(year) + ".csv", file_path = output_path, load = True)
    

if __name__ == '__main__':
    with Pool(multiprocessing.cpu_count()-1) as p:
        p.map(checkyear, year_range)
    proportion_healthy = {}    
    for year in year_range:
        menu = pd.DataFrame.from_csv("menu_healthyitems_" + str(year) + ".csv", encoding = "utf8", sep = ",")
        proportion_healthy.update({year:sum(menu.is_healthy)/len(menu.is_healthy)})
    f = open(working_directory + "proportion_healthy.txt","w")
    f.write( str(proportion_healthy) )
    f.close()
    
        