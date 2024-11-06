import pandas as pd
import os
import re
import numpy as np
class CheckForHealthy:
    def __init__(self):
        self.menu_path = None
        self.working_directory = None
        self.year = None
        # fruits
        self.fruits = ["apple", "apricot", "banana", "cherr", "grapefruit", "grape", "kiwi", "lemon", "lime", 
                       "mango", "nectarine", "orange", "peach", "pear", "papaya", "pineapple", "plum", "prune", 
                       "raisin", "tangerine", "strawberr", "blueberr", "raspberr", "cantaloupe", "honeydew", 
                       "watermelon", "fruit"] #
        self.healthyfruits_adj = ["fresh", "compote", "yogurt", "fruit snack"]
        self.unhealthyfruits_adj = ["cinnamon", "syrup", "dressing", "sauce", "caramel", "drunk"]
        # vegetables
        self.vegetables = ["bok choy", "broccoli", "collard green", "kale", "mesclun", "mustard green", 
                           "spinach", "turnip green", "watercress", "cassava", " corn", "green banana", 
                           "plantain", "sweet potato", "taro", "water chestnut", "carrot", "pumpkin", "red pepper",
                           "tomato", "lentil", "artichoke", "asparagus", "avocado", "beet", "brussel sprout", 
                           "cabbage", "cauliflower", "celery", "cucumber", "eggplant", "green pepper", 
                           "mushroom", "okra", "onion", "turnip", "zucchini", "squash", "pea", "lettuce", 
                           "bean", "vegetable"] 
        # covered by "squash", "pea", "lettuce", "bean"
        # "fresh cowpea", "field pea", "green pea", "green lima bean", "black bean", "black-eyed pea", "garbanzo bean", "kidney bean", "navy bean", "pinto bean", "soy bean", "split pea", "white bean", "bean sprout", "green bean", "acorn squash", "butternut squash", "wax bean", "romaine lettuce", "hubbard squash", "iceberg lettuce", "dark green leafy lettuce", "tomato juice"
        self.healthyvegetables_adj = ["raw", "steamed", "grilled", "baked", "pickled"]
        self.unhealthyvegetables_adj = ["lasagna", "pot pie", "stew", "calzone", "fries", "fried", "stir fried", "stir fry", "breaded", "au gratin", "casserole", "creamed", "scalloped", "sauce", "glaze", "sautee", "sugar", "bourbon", "nacho", "dip", "stuffed", "loaded", "butter", "aioli", "queso", "ranch", "sour cream", "chili pie", "buffalo", "wing", "bacon", "stuffing", "egg roll", "potsticker", "potato salad", "cole slaw", "coleslaw", "onion petal", "onion ring", "onion chip", "onion tangler", "mayonnaise", "onion string", "salsa", "guacamole"]
        # beverages 
        self.healthybeverages_adj_milk = ["1% milk", "nonfat milk", "non fat milk"]
        self.healthybeverages_adj_juice = ["100% fruit", "apple juice", "grape juice", "orange juice", "tangerine juice", "purely orange", "purely carrot", "orange carrot twist", "cranberry juice", "pineapple juice", "tomato juice", "grapefruit juice"]
        self.unhealthybeverages_adj = ["syrup", "caramel", "mocha", "vanilla", "frappuccino", "lemonade", "sauce", "whipped cream", "chai latte",  "green tea latte", "vodka", "baiju", "gin", "rum", "tequila", "mezcal", "whiskey", "whisky", "brandy", "cachaca", "schnapps", "mimosa", "sangria", "bourbon", "makers mark", "moonshine", "bahama mama", "absolut citron", "liqueur"]
        self.healthysalads_adj = ["low fat", "fat free", "w out dressing"]
		# regulated healthy
        self.NEMS_reg_hlthy_adj = ["healthy"]
        self.reg_hlthy_adj = ["nutrit", "skinny", "lite", "free", "diet", "gluten", "fat", "protein", "fiber", "sugar", "sodium", "salt", "calorie", "carb"]
        self.healthyfats = ["salmon", "tuna",  "sardines",  "herring",  "swordfish", "anchovies",  "lobster", "crab", "eel", "caviar", "clams", "mackerel",  "trout",  "walleye", "polluck", "shrimp",  "snapper", "tilapia", "scallops", "char", "carp", "oysters", "mussels", "olive oil", "guacamole", "avocado",  "walnuts", "pumpkin seeds",  "sunflower seed", "soy milk", "canola oil", "flax seed",  "chia seed",  "flax oil",  "corn oil", "safflower oil",  "sunflower oil", "mustard oil", "soybean oil", "walnut oil", "sesame oil", "peanut oil", " nut", "almond", "cashew", "pistachio", "pecan"]

    ##########################################
    # Run all checks and save output
    ##########################################   
    def run_all_save(self, output_path = "menu_new.csv"):
        # Cutoffs
        self.cutoffs = pd.DataFrame({"major_category":["kid_entree", "kid_side", "adult_entree", "adult_burgsand"], 
                                "Calories_" + str(self.year):[600, 200, 800, 650], 
                                "Total_Fat_" + str(self.year):[23.33, 7.78, 26.67, 21.67], 
                                "Saturated_Fat_" + str(self.year):[6.67, 2.22, 8.89, 7.22],
                                "food_categories":[["Burgers", "Sandwiches", "Entrees", "Pizza", "Soup", "Salads"], 
                                                  ["Salads", "Appetizers & Sides"], 
                                                  ["Burgers", "Sandwiches", "Entrees", "Pizza", "Soup", "Salads"], 
                                                  ["Burgers", "Sandwiches"]]})
        self.nutrition_types = ["Calories_" + str(self.year), "Total_Fat_" + str(self.year), "Saturated_Fat_" + str(self.year)]
        if self.working_directory:
            os.chdir(self.working_directory)
        self.import_menu()
        self.check_nutrition_criteria()
        self.side_salad_entree_check()
        self.check_healthysides()
        self.main_healthysalad()
        self.beverage_meets_calories_criteria()
        self.check_healthybeverage_desc()        
        self.is_reg_hlthy()
        self.has_healthyfat()
        self.is_healthy()
        self.menu.to_csv(output_path, encoding = "utf8")
    def import_menu(self):        
        self.menu = pd.read_csv("MenuStat_" + str(self.year) + "_fullsample.csv", index_col = 0, engine = "python")
    ##########################################
    # Cleaning text function 
    ##########################################
    # Text-preprocessing 
    def clean_string(self, text, replace = '[^a-z ]+'): # lowercase all characters and replace non alphabet characters with space. no more than single spaces
        if isinstance(text, list):
            text_clean = [' '.join(re.sub(replace, ' ', s.lower()).split()) for s in text]
        elif isinstance(text, str):
            text = text.lower()
            text_clean = ' '.join(re.sub(replace, ' ', text).split())
            text_clean = ' ' + text_clean + ' '
        else:
            text_clean = None
        return(text_clean)
    # Remove word after "w out" (cleaned from w/out)
    def wout(self, text, keyword = " w out "):
        if keyword in text:
            print(text)
            before_keyword, keyword, after_keyword = text.partition(keyword)
            text_clean = "".join([before_keyword, after_keyword[after_keyword.find(" "):]])
        else:
            text_clean = text
        # if multiple w/out
        if keyword in text_clean:
            text_clean = self.wout(text_clean, keyword = keyword)
        return(text_clean)
        
    ##########################################
    # Check if menu items meet cutoffs
    ##########################################
    '''
    Create variables for each nutrition type (e.g Calories) and major_category(e.g. kid_entree) combination:
        For entrees: check ["Burgers", "Sandwiches", "Entrees", "Pizza", "Soup"] and "Salad" if 'side' is not in name description
        For kids sides: check "Appetizers & Sides" and "Salad" if 'side' is in name or description
        For adult entrees: check ["Burgers", "Sandwiches"]
    '''
    # Run nutrition check
    def check_nutrition_criteria(self):
        for t in self.nutrition_types:
            for c in self.cutoffs["major_category"]:
                print("Checking: " + t + "_" + c)
                colname = t + "_" + c
                meets_criteria = self.meets_nutrition_criteria(nutrition_type = t, cutoff_category = c)
                self.menu[colname] = meets_criteria
    # Meets nutrition criteria
    def meets_nutrition_criteria(self, nutrition_type, cutoff_category):
        meets_nutrition = [] # empty output
        if "kid" in cutoff_category: 
            kid_item = 1
        else:
            kid_item = 0
        valid_food_categories = self.cutoffs.loc[self.cutoffs["major_category"] == cutoff_category]["food_categories"].values[0]
        cutoff_value = self.cutoffs.loc[self.cutoffs["major_category"] == cutoff_category][nutrition_type].values[0]
        # Loop through each menu item
        for idx in self.menu.index:
            item = self.menu.loc[idx]
            # Nutrition checks
            '''
            Check nutrition cutoff if:
                - Kids_Meal == kid_item
                - Item's food category is one of the valid food categories
                - Nutrition type (Calories or Total_Fat or Saturated_Fat) is not NaN
            '''
            if (item["Kids_Meal_" + str(self.year)] == kid_item) & (item.Food_Category in valid_food_categories) & (not np.isnan(item[nutrition_type])): 
                if "entree" in cutoff_category: # for entrees
                    if item.Food_Category in ["Burgers", "Sandwiches", "Entrees", "Pizza", "Soup"]: # exclude salad
                        meets_nutrition.append(item[nutrition_type] <= float(cutoff_value))
                    elif item.Food_Category == "Salads": # entree vs side salad
                        if ("side" in item["Item_Name_" + str(self.year)]) | ("side" in item["Item_Description_" + str(self.year)]):
                            meets_nutrition.append(None)
                        else:
                            meets_nutrition.append(item[nutrition_type] <= float(cutoff_value))
                    else:
                        meets_nutrition.append(None)
                elif "side" in cutoff_category: # for sides
                    if item.Food_Category ==  "Appetizers & Sides":  
                        meets_nutrition.append(item[nutrition_type] <= float(cutoff_value))
                    elif item.Food_Category == "Salads": 
                        if ("side" in item["Item_Name_" + str(self.year)]) | ("side" in item["Item_Description_" + str(self.year)]):
                            meets_nutrition.append(item[nutrition_type] <= float(cutoff_value))
                        else:
                            meets_nutrition.append(None)
                    else:
                        meets_nutrition.append(None)
                else: # burgers and sandwiches
                    if item.Food_Category in ["Burgers", "Sandwiches"]:  
                        meets_nutrition.append(item[nutrition_type] <= float(cutoff_value))
                    else:
                        meets_nutrition.append(None)
            else:
                meets_nutrition.append(None)
        return(meets_nutrition)
    ##########################################
    # Check if side is healthy (Only count if Appetizers & Sides or Salad with "side")
    ##########################################
    '''
    First check if a Salad category item is a side salad:
        if it is then check for healthy side ingredients
    Check the Item Description for healthy ingredients
        Healthy if it meets two criteria:
            1. Does not contain unhealthy fruit or unhealthy vegetable adjective
            2. Contains a fruit or vegertable
                OR if item is potato/chip: contains "baked"
                OR if item is bread: contains "whole grain"
    '''
    # Variable for "side" in salad entrees item name or description (needed before running check_healthyside_ingredient)
    def side_salad_entree_check(self):
        side_salad_entree = []
        for idx in self.menu.index:
            item = self.menu.loc[idx]
            if item["Food_Category"] ==  "Salads":
                if any("side" in s for s in [item["Item_Name_" + str(self.year)].lower(), item["Item_Description_" + str(self.year)].lower()]):
                    side_salad_entree.append(True)
                else:
                    side_salad_entree.append(False)
            else:
                side_salad_entree.append(False)
        self.menu["side_salad_entree"] = side_salad_entree
    
    # Add variables to menu dataframe
    def check_healthysides(self): 
        colnames = ["healthyside", "healthyfruit", "healthyvegetable", "healthychip", "healthybread"]
        healthyside_desc = pd.DataFrame(columns = colnames)
        print("Checking: item description for sides")
        # Loop through each menu item
        for idx in self.menu.index:
            item = self.menu.loc[idx]
            # Description of item
            desc = item["Item_Description_" + str(self.year)]
            desc = self.clean_string(desc)
            # Stricter criteria for being healthy (if any unhealthy items then not healthy)
            if item["Food_Category"] ==  "Appetizers & Sides": # if a non salad side then search through healthy items Megan noted
                desc = self.wout(desc)
                healthyside_desc = healthyside_desc.append(self.check_side(desc, is_side = True), ignore_index = True)
            elif item["Food_Category"] ==  "Salads":
                if item["side_salad_entree"] == True:
                    healthyside_desc = healthyside_desc.append(self.check_side(desc, is_side = True, onlysalad = True), ignore_index = True)
                else:
                    healthyside_desc = healthyside_desc.append(self.check_side(desc, is_side = False), ignore_index = True)
            else: # does not apply if not a side
                healthyside_desc = healthyside_desc.append(self.check_side(desc, is_side = False), ignore_index = True)
            if healthyside_desc.shape[0] % 1000 == 0:
                print(str(healthyside_desc.shape[0]) + "/" + str(self.menu.shape[0]))
        healthyside_desc.columns = [x for x in colnames]
        out = healthyside_desc
        out.index = self.menu.index
        self.menu = self.menu.merge(out, left_index = True, right_index = True)
    # Counting function
    def check_side(self, text, is_side = True, onlysalad = False): # output None's if not a side
        healthyside = False
        healthyfruit = False
        healthyvegetable = False
        healthychip = False
        healthybread = False
        if is_side & isinstance(text, str):
            if onlysalad:
                healthyside = self.check_healthysalad_desc(text)
            elif ("salad bar" not in text) & (onlysalad == False): # if salad bar is any item in the list then don't count
                # Check for unhealthy first
                if any(u in text for u in self.unhealthyvegetables_adj) | any(u in text for u in self.unhealthyfruits_adj):
                    pass
                else:
                    if any(h in text for h in self.fruits) :
                        healthyside = True
                        healthyfruit = True
                    if any(' ' + h + ' ' in text for h in self.vegetables):
                        healthyside = True
                        healthyvegetable = True
                    if "chips" in text:
                        if "baked" in text:
                            healthyside = True
                            healthychip = True
                    if "potato" in text:
                        if "baked" in text:
                            healthyside = True
                    if "bread" in text:
                        if "whole grain" in text:
                            healthyside = True   
                            healthybread = True
                out = {"healthyside":healthyside, "healthyfruit":healthyfruit, "healthyvegetable":healthyvegetable,
                       "healthychip":healthychip, "healthybread":healthybread}
            else:
                pass
        out = {"healthyside":healthyside, "healthyfruit":healthyfruit, "healthyvegetable":healthyvegetable,
               "healthychip":healthychip, "healthybread":healthybread}
        return(out)
    # Create healthy main side variable (adult menu)
    def main_healthysalad(self):
        colnames = ["main_healthysalad"]
        main_healthysalad = pd.DataFrame(columns = colnames)
        print("Checking: item description for healthy main salad")
        # Loop through each menu item
        for idx in self.menu.index:
            item = self.menu.loc[idx]
            # Description of item
            desc = item["Item_Description_" + str(self.year)]
            desc = self.clean_string(desc)
            if (item["Kids_Meal_" + str(self.year)] == 0) & (item["Food_Category"] ==  "Salads"):
                main_healthysalad = main_healthysalad.append({"main_healthysalad":self.check_healthysalad_desc(desc)}, ignore_index = True)
            else:
                main_healthysalad = main_healthysalad.append({"main_healthysalad":None}, ignore_index = True)
        out = main_healthysalad
        out.index = self.menu.index
        self.menu = self.menu.merge(out, left_index = True, right_index = True)
        
    # Check if text contains healthy salad adjectives
    def check_healthysalad_desc(self, text):
        if any(h in text for h in self.healthysalads_adj):
            healthysalad = True
        else:
            healthysalad = False
        return(healthysalad)

    ##########################################
    # Check if beverage is healthy (only if beverage)
    ##########################################   
    # Add variables to menu dataframe
    def check_healthybeverage_desc(self):
        colnames = ["healthybeverage", "healthymilk", "healthyjuice"]
        healthybeverage_desc = pd.DataFrame(columns = colnames)
        print("Checking: item description for beverages")
        for idx in self.menu.index:
            item = self.menu.loc[idx]
            # Description of item
            desc = item["Item_Description_" + str(self.year)]
            desc = self.clean_string(desc, "[^a-z0-9% ]+") 
            if item["Food_Category"] ==  "Beverages":
                healthybeverage_desc = healthybeverage_desc.append(self.count_beverages(desc, is_beverage = True), ignore_index = True)
            else: # does not apply if not a beverage
                healthybeverage_desc = healthybeverage_desc.append(self.count_beverages(desc, is_beverage = False), ignore_index = True)
            if healthybeverage_desc.shape[0] % 1000 == 0:
                print(str(healthybeverage_desc.shape[0]) + "/" + str(self.menu.shape[0]))
            else:
                pass
        healthybeverage_desc.columns = [x for x in colnames]
        out = healthybeverage_desc
        out.index = self.menu.index
        self.menu = self.menu.merge(out, left_index = True, right_index = True)
    # Counting function 
    def count_beverages(self, text, is_beverage = False):
        healthybeverage = False
        healthymilk = False
        healthyjuice = False
        if is_beverage:
            if any(' ' + h + ' ' in text for h in self.unhealthybeverages_adj):
                pass
            else:
                if any(' ' + h + ' ' in text for h in self.healthybeverages_adj_milk):
                    healthybeverage = True
                    healthymilk = True
                if any(' ' + h + ' ' in text for h in self.healthybeverages_adj_juice):
                    healthybeverage = True
                    healthyjuice = True
        out = {"healthybeverage":healthybeverage, "healthymilk":healthymilk, "healthyjuice":healthyjuice}
        return(out)
    # Check if drink meets calories function
    def beverage_meets_calories_criteria(self, cutoff_value = 40):
        meets_nutrition = []
        print("Checking: beverage calories")
        for idx in self.menu.index:
            item = self.menu.loc[idx]
            if item.Food_Category == "Beverages":
                if not np.isnan(item["Calories_" + str(self.year)]):
                    meets_nutrition.append(item["Calories_" + str(self.year)] <= float(cutoff_value))
                else:
                    meets_nutrition.append(None)
            else:
                meets_nutrition.append(None)                
        self.menu["Calories_beverage"] = meets_nutrition
    ##########################################
    # Check if item contains healthy fats
    ##########################################   
    def has_healthyfat(self, replace = '[^a-z, ]+'):
        has_healthyfat = []
        print("Checking: healthy fats")
        for idx in self.menu.index:
            item = self.menu.loc[idx]
            desc = self.clean_string(item["Item_Description_" + str(self.year)])
            if any(h in desc for h in self.healthyfats):
                has_healthyfat.append(True)
            else:
                has_healthyfat.append(False)
        self.menu["has_healthyfat"] = has_healthyfat
    
    ##########################################
    # NEMS_reg_hlthy + reg_hlthy variables (False if baked good, dessert, fried potato, or topping/ingredient)
    ##########################################   
    '''
    These regulated healthy terms cannot be part of a larger word like in the vegetable and fruit words
    '''
    def is_reg_hlthy(self):
        print("Checking: NEMs regulated healthy + regulated healthy")
        colnames = ["NEMS_reg_hlthy", "reg_hlthy"]
        out = pd.DataFrame(columns = colnames)
        # Loop through each menu item
        for idx in self.menu.index:
            item = self.menu.loc[idx]
            if item.Food_Category in ['Appetizers & Sides', 'Beverages', 'Burgers', 'Entrees', 'Pizza', 'Salads', 'Sandwiches', 'Soup']:
                text = item["Item_Description_" + str(self.year)]
                text = " " + re.sub('[^a-z]+', ' ', text.lower()) + " "
                if any(" " + h + " " in text for h in self.NEMS_reg_hlthy_adj):
                    nems = True
                else:
                    nems = False
                if any(" " + h + " " in text for h in self.reg_hlthy_adj):
                    reg = True
                else:
                    reg = False
                toadd = {"NEMS_reg_hlthy":nems,
                       "reg_hlthy":reg}
            else:
                toadd = {"NEMS_reg_hlthy":False,
                       "reg_hlthy":False}
            out = out.append(toadd, ignore_index = True)
        out.index = self.menu.index
        self.menu = self.menu.merge(out, left_index = True, right_index = True)
    ##########################################
    # Final outcome
    ##########################################
    '''
    An item is considered healthy if:
        - Item meets nutrition criteria (Calories + Fat + Saturated Fat (if exists)) if nutrition criteria available 
        - Otherwise:
            1. For sides: check for if item has fruit or vegetable without unhealthy adjective or baked chips/potatos or whole grain bread
            2. For beverages: if beverage contains healthy adjective or less than 40 calories
            3. For entrees: check for "healthy" in item description
    '''
    def is_healthy(self):
        print("Creating final healthy variable.")
        is_healthy = []
        for idx in self.menu.index:
            item = self.menu.loc[idx]
            #####################
            # Meets nutrition (True, False, None)
            #####################
            if (item["Calories_" + str(self.year) + "_kid_entree"] is not None) & (item["Total_Fat_" + str(self.year) + "_kid_entree"] is not None):
                if item["Saturated_Fat_" + str(self.year) + "_kid_entree"] is not None:
                    meet_nutrition = (item["Calories_" + str(self.year) + "_kid_entree"] * item["Total_Fat_" + str(self.year) + "_kid_entree"] * item["Saturated_Fat_" + str(self.year) + "_kid_entree"])
                else:
                    meet_nutrition = (item["Calories_" + str(self.year) + "_kid_entree"] * item["Total_Fat_" + str(self.year) + "_kid_entree"])
            elif (item["Calories_" + str(self.year) + "_adult_entree"] is not None) & (item["Total_Fat_" + str(self.year) + "_adult_entree"] is not None):
                if item["Saturated_Fat_" + str(self.year) + "_adult_entree"] is not None:
                    meet_nutrition = (item["Calories_" + str(self.year) + "_adult_entree"] * item["Total_Fat_" + str(self.year) + "_adult_entree"] * item["Saturated_Fat_" + str(self.year) + "_adult_entree"])
                else:
                    meet_nutrition = (item["Calories_" + str(self.year) + "_adult_entree"] * item["Total_Fat_" + str(self.year) + "_adult_entree"])
            elif (item["Calories_" + str(self.year) + "_kid_side"] is not None) & (item["Total_Fat_" + str(self.year) + "_kid_side"] is not None):
                if item["Saturated_Fat_" + str(self.year) + "_kid_side"] is not None:
                    meet_nutrition = (item["Calories_" + str(self.year) + "_kid_side"] * item["Total_Fat_" + str(self.year) + "_kid_side"] * item["Saturated_Fat_" + str(self.year) + "_kid_side"])
                else:
                    meet_nutrition = (item["Calories_" + str(self.year) + "_kid_side"] * item["Total_Fat_" + str(self.year) + "_kid_side"])
            else:
                meet_nutrition = None
            #####################
            # Healthy Side (True, False)
            #####################
            side_healthy = item["healthyside"]
            #####################
            # Healthy Beverage (True, False)
            ##################### 
            beverage_healthy = item["healthybeverage"]
            if (beverage_healthy == False) and (item["Calories_beverage"] is not None):
                beverage_healthy = item["Calories_beverage"]
            #####################
            # Healthy item (True, False)
            ##################### 
            # Final healthy variable
            if meet_nutrition:
                itemhealthy = meet_nutrition
            elif (item["side_salad_entree"] == 0) and (item["Food_Category"] in ["Burgers", "Sandwiches", "Entrees", "Pizza", "Soup", "Salads"]):
                itemhealthy = item["NEMS_reg_hlthy"] #max(sidehas_healthyword, beveragehas_healthyword, reg_hlthy, beverage_meets_calories)
            else:
                itemhealthy = max([side_healthy, beverage_healthy])
            is_healthy.append(itemhealthy)
        self.menu["is_healthy"] = is_healthy

    ##########################################
    # NEMS-R score
    ##########################################        
    def nemsscore(self, scores_path, file_path, load = True):
        if load == True:
            self.menu = pd.DataFrame.from_csv(file_path, encoding = "utf8", sep = ",")
        restaurants = list(set(self.menu["Restaurant"]))
        self.scores = pd.DataFrame(columns = ["Restaurant", "KidsMenu", "HealthyEntreeScore", "HealthyMainSaladScore", "LowFatFreeDressingScore", "FruitScore", "VegetableScore", "ChipScore", "BreadScore", "JuiceScore", "MilkScore", "HealthyFatScore"])
        for r in restaurants:
            self.scores = self.scores.append(self.restaurant_score(r, kids = 0), ignore_index = True)
            self.scores = self.scores.append(self.restaurant_score(r, kids = 1), ignore_index = True)
            self.scores["FinalScore"] = self.scores[["HealthyEntreeScore", "HealthyMainSaladScore", "LowFatFreeDressingScore", "FruitScore", "VegetableScore", "ChipScore", "BreadScore", "JuiceScore", "MilkScore", "HealthyFatScore"]].sum(axis = 1)        
        self.scores.to_csv(scores_path, encoding = "utf8")
        
    def restaurant_score(self, r, kids):
        menu_r = self.menu.loc[self.menu["Restaurant"] == r]
        healthy_entree = menu_r.loc[(menu_r["Kids_Meal_" + str(self.year)] == kids) & ([x in ["Burgers", "Sandwiches", "Entrees", "Pizza", "Soup", "Salads"] for x in menu_r["Food_Category"]]) & (menu_r["side_salad_entree"] == False) & (menu_r["is_healthy"] == True)].shape[0]
        healthy_mainsalad = menu_r.loc[(menu_r["Kids_Meal_" + str(self.year)] == kids) & (menu_r["Food_Category"] == "Salads") & (menu_r["side_salad_entree"] == False) & (menu_r["is_healthy"] == True)].shape[0]
        lowfatfree_mainsalad = menu_r.loc[(menu_r["Kids_Meal_" + str(self.year)] == kids) & (menu_r["Food_Category"] == "Salads") & (menu_r["side_salad_entree"] == False) & (menu_r["main_healthysalad"] == True)].shape[0]
        healthy_fruit = menu_r.loc[(menu_r["Kids_Meal_" + str(self.year)] == kids) & ((menu_r["side_salad_entree"] == True) | (menu_r["Food_Category"] == "Appetizers & Sides")) & (menu_r["healthyfruit"] == True)].shape[0]
        healthy_vegetable = menu_r.loc[(menu_r["Kids_Meal_" + str(self.year)] == kids) & ((menu_r["side_salad_entree"] == True) | (menu_r["Food_Category"] == "Appetizers & Sides")) & (menu_r["healthyvegetable"] == True)].shape[0]
        healthy_chip = menu_r.loc[(menu_r["Kids_Meal_" + str(self.year)] == kids) & ((menu_r["side_salad_entree"] == True) | (menu_r["Food_Category"] == "Appetizers & Sides")) & (menu_r["healthychip"] == True)].shape[0]
        healthy_bread = menu_r.loc[(menu_r["Kids_Meal_" + str(self.year)] == kids) & ((menu_r["side_salad_entree"] == True) | (menu_r["Food_Category"] == "Appetizers & Sides")) & (menu_r["healthybread"] == True)].shape[0]
        healthy_milk = menu_r.loc[(menu_r["Kids_Meal_" + str(self.year)] == kids) & (menu_r["Food_Category"] == "Beverages") & (menu_r["healthymilk"] == True)].shape[0]
        healthy_juice = menu_r.loc[(menu_r["Kids_Meal_" + str(self.year)] == kids) & (menu_r["Food_Category"] == "Beverages") & (menu_r["healthyjuice"] == True)].shape[0]
        healthy_fat = menu_r.loc[(menu_r["Kids_Meal_" + str(self.year)] == kids) & (menu_r["has_healthyfat"] == True) & (menu_r["Food_Category"] != "Beverages")].shape[0]
        # HealthyEntreeScore
        if healthy_entree > 4:
            HealthyEntreeScore = 3
        elif 2 <= healthy_entree <= 4:
            HealthyEntreeScore = 2
        elif healthy_entree > 0:
            HealthyEntreeScore = 1
        else:
            HealthyEntreeScore = 0
        # HealthyMainSaladScore
        if healthy_mainsalad > 4:
            HealthyMainSaladScore = 3
        elif 2 <= healthy_mainsalad <= 4:
            HealthyMainSaladScore = 2
        elif healthy_mainsalad > 0:
            HealthyMainSaladScore = 1
        else:
            HealthyMainSaladScore = 0
        # LowFatFreeDressingScore
        if lowfatfree_mainsalad > 2:
            LowFatFreeDressingScore = 3
        elif lowfatfree_mainsalad == 2:
            LowFatFreeDressingScore = 2
        elif lowfatfree_mainsalad == 1:
            LowFatFreeDressingScore = 1
        else:
            LowFatFreeDressingScore = 0
        # FruitScore
        if healthy_fruit > 0:
            FruitScore = 1
        else:
            FruitScore = 0
        # VegetableScore
        if healthy_vegetable > 0:
            VegetableScore = 1
        else:
            VegetableScore = 0
        # ChipScore
        if healthy_chip > 0:
            ChipScore = 1
        else:
            ChipScore = 0
        # BreadScore
        if healthy_bread > 0:
            BreadScore = 1
        else:
            BreadScore = 0
        # JuiceScore
        if healthy_juice > 0:
            JuiceScore = 1
        else:
            JuiceScore = 0
        # MilkScore
        if healthy_milk > 0:
            MilkScore = 1
        else:
            MilkScore = 0
        # HealthyFatScore
        if healthy_fat > 0:
            HealthyFatScore = 1
        else:
            HealthyFatScore = 0
        # Output
        scores = {"Restaurant":r, "KidsMenu":kids, "HealthyEntreeScore":HealthyEntreeScore, "HealthyMainSaladScore":HealthyMainSaladScore, "LowFatFreeDressingScore":LowFatFreeDressingScore, "FruitScore":FruitScore, "VegetableScore":VegetableScore, "ChipScore":ChipScore, "BreadScore":BreadScore, "JuiceScore":JuiceScore, "MilkScore":MilkScore, "HealthyFatScore": HealthyFatScore}
        return(scores)
        
        
        
        
        
        
        
        
        
        
        
        
