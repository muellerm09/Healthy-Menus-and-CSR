# Healthy-Menus-and-CSR

**Title:** Restaurant corporate social responsibility and associations with business practices relevant to cardiovascular health

**Grant information:** American Heart Association, Career Development Award, Award Number 19CDA34700007

**Links/information to other repository data:** These data are from publically available resources. Menu Stat (https://www.menustat.org/) contains nutrition information for a sample of the top grossing US restaurant chains. At the time of the initial abstraction/coding of these data were only available from 2012-2018. The second publically available resources is WayBack Machine (https://web.archive.org/), which includes web captures of historical versions of urls including those for restaurant chain websites.

**Citation information to any relevant publications**: Health and non-health related corporate social responsibility statements in top selling restaurant
chains in the United States between 2012-2018: a content analysis

**The project description (Who were the subjects? What did they do? What were the conditions?)**: The subjects in this project were restaurant chains. We utilized their menu item and nutrition information to evaluate the healthfulness and nutrition content of their menu items over 2012-2018. We also utlitized any statments made about corporated social responsibility (CSR) on their websites to understand which resturants had health related CSR statements on their webpages and during which year(s). The groups/conditions in the project were restaurants that had CSR statements vs. those that did not during each year. 

**How was the project carried out?**: Data on CSR initiatives were abstracted from the internet archives restaurant pages using WayBack machine (https://web.archive.org/).
To identify relevant web text sections for our initial qualitative content analysis of corporate CSR in the restaurant setting, we used web scraping to identify html code that included keywords via the Python (Beaverton, OR) Scrapy and Beautiful Soup coding packages. The keywords used included: “foundation”, “prosperity”, “social impact”, “helping”, “community”, “health”, “cares”, “ethical”, “citizen”, “sustainable”, “opportunity”, “community service”, “responsibility”, “stewardship”, “livewell”, “live well”, “fundraiser”, “commitment”, “nutrition”. Then, for each year and restaurant, we randomly sampled 60% of text that included CSR keywords and coded them into 7 primary and/or 13 secondary/tertiary nodes based on the descriptions of the activities included in the text and our codebook adapted from the CSR activities outlined in Richards et al. (2015). For this study, we 1) further differentiated the community activities identified in Richards et. al. (2015) by whether they were health-related or not; 2) made distinctions between health-related activities the restaurant participated in directly on location through their business practices (like offering healthier menu options or having calories posted prior to the federal mandate in the US; coded as health initiatives) and those that they participated in indirectly (like hosting an event to address hunger in their community; coded as community activities health-related); 3) added health-related philanthropic activities as a separate category, which included elements of the partnerships activities and community activities from Richards et. al. (2015). 

For the second aim of this funded project, we specifically focused on the health-related CSR commitments that restaurants may engage in because we hypothesized that they are more-likely to be related to our outcomes of interest—the overall nutrition quality of the restaurant menu and/or the nutrition content of the menu items. All restaurants with statements coded as “health-related community activities”, “health initiatives”, “explicit health-related CSR”, and “health-related philanthropic” efforts (e.g., donations to organizations like the American Cancer Society) were identified as having a health-related CSR activity. To check the robustness of our results, we conducted sensitivity analyses where we identify CSR initiatives by searching all archives of each of the 66 restaurant’s websites and labeling them as discussing CSR if they include any of the keywords mentioned above (n=10,615 web text sections for sensitivity analyses). 

The nutritional quality of menu offerings was assessed using two different approaches: 1) the overall nutritional quality of the menu offerings and 2) the nutrition content of menu items. To evaluate the overall nutritional quality of the menu items offered, our study team developed an algorithm to categorize menu items based on a modified version of the previously validated NEMS-R nutrition and food-based criteria (Table C1 and C2). Whether menu items contained foods that met food-based criteria was assessed based on whether the menu item descriptions included food groups listed in Supplemental Tables C1 and C2 and detailed below. Briefly, keywords for fruits without sugar and non-fried vegetables were determined via the 2015-2020 Dietary Guidelines for Americans (DGAs) and MyPlate41, similar to the approach used by Mueller MP et. al. (2019)42. Entrées that did not meet the nutrition criteria in Table C1 (or did not have nutrition information) but included keywords like “healthy” or a nutrient content claim (i.e. low sodium) were coded as healthy based on having a regulated health designation40. We also modified the previous NEMS-R criteria to include a point for restaurants that had menu items with healthy fats like salmon or walnuts (high in omega-3s) or avocados or seed oils (high in monounsaturated fats), as intake of these healthy fats is associated with lower rates of cardiovascular disease risk and related deaths(Table C1). To identify these items, menu item descriptions were searched for keywords like salmon, sunflower, soy, and almond (as detailed in Table C1).

_Criteria for “Healthy” Items based on the Nutrition Environment Measures Survey in Restaurants (NEMS-R) tool_

To determine each restaurants’ NEMS-R score, menu offerings at all 66 restaurants with data from the NY City Department of Health and Mental Hygiene MenuStat database were evaluated using the below nutrient (Table C1) and food-based criteria (Table C1 aand below) for each year. For each restaurant, a score, referred to herein as the overall nutritional quality score, was computed by summing the points given for each eligible item offered at each restaurant during each year based on the criteria outlined below.

Healthy entrées (standard/adult menu and kid’s menu) and healthy sides (just the kid’s menu) were identified using the following criteria: To be healthy based on the nutrition criteria, an item must meet the cut points in Table C1 for calories and fat. If saturated fat data is available, then the items must meet the cut points for calories, fat, and sat fat as well to be classified as healthy. All entrées are listed as “Entrées”, “Sandwiches”, “Burgers”, “Salads”, “Pizza”, and “Soup” under “Food Category”. “Salads” and “Soups” were considered entrées unless they included the word “side” in the item name. Separate nutrient criteria were used for entrées identified as sandwiches and burgers (Table C1). If there was no nutrition information/the item didn’t meet the above criteria, then we evaluated if the item included one of the regulated “healthy” definitions listed in Table C1, detailed under superscript c. To be “healthy” kid’s sides need to meet all the above nutrient criteria OR be any of the following: fruit without added sugar, nonfried vegetables without sauce or toppings, baked chips, whole grain bread, and salads with low-fat or fat free dressing (Table C1). 

_Table C1. Criteria used to identify menu items as “healthy” based on the Nutrition Environment Measures-Restaurants (NEMS-R) tool_
Item category	Nutrition and Food-Based Criteriaa
Healthy Entrées (non-salad)	Either must meet all of the following nutrition criteria:
●	≤800 calories (for adult/standard menu items), ≤600 calories (for children’s menu items) b
●	≤30% calories from Total fat
●	≤10% calories from saturated fat
OR  include a regulated health designation (i.e. light or low fat)c
Healthy Main Dish Salad	
Either must meet all of the above nutrition criteria 
OR Meet both of the following:
●	Use low fat or fat free dressing
●	No more than two of the ingredients ≥50% calories from fat
Specific Healthy Food and Beverage Availability	
Whether the following were available in entrées or as sides or beverages:
●	Fruit without added sugard
●	Non-fried vegetables without sauce or toppingsd
●	Baked chips
●	Whole grain bread
●	Beverage: Diet soda, 100% fruit juice, or 1% fat or nonfat milke
●	Items with healthy fats (i.e. fish high in omega 3 fatty acids, nuts, olive oil)f
aHealthy Entrées or Salads (1option=1 point, 2-4 Option=2 points, 5+ options=3 points); 1 point for fruit, non-fried vegetables, baked chips, whole grain bread, 100% fruit juice, 1% or non-fat milk, or healthy fats).  
b The calorie cut points were determined as two fifths of the Food and Drug Administration Food Label standard and one third of the calorie needs for a sedentary child age 5-1241. 
cThe item name and description were evaluated for the following key words:  “heart healthy,” “healthy”, Nutrit*, Skinny, Lite, Free, Diet, Gluten, Fat, Protein, Fiber, Sugar, Sodium, Salt, Calorie, Carb.****this did not include those items with the terms  “light fare” or “light” because there were too many items that were misclassified (i.e. light beers, entrées with light sour cream, etc.).
dTo identify these items, we included search terms for “baked” “low fat” “whole grain” and the list of fruits and veggies in Supplemental Table C2 and Supplemental C. For vegetables available as sides, if there was nutrition information available for the sides, we made sure that the vegetable qualifies. For example, if the item says “broccoli” but the nutrition information states 80 calories with 6 grams of fat that meant that this item would not qualify as a non-fried vegetable. 
eTo be “healthy” beverages need to be the following: Diet soda, 100% fruit juice, 1% or nonfat milk, a low calorie drink (<=40 calories per serving). Examples of a low calorie drink that is not a soft drink like lemonade sweetened with splenda or nutrasweet, diet Snapple, low-calorie Sobe, unsweetened iced tea, bottled/flavored water, Perrier. To identify beverages that were 100% fruit juice, we searched for the terms: 100%; 100% fruit juice; or 100% apple, orange, cranberry, etc.
fAll entrées, sides, and beverages (because of soy milk) were also coded as having healthy fats or not. Item descriptions and item names that included any of the following keywords: salmon, tuna,  sardines,  herring,  swordfish, anchovies,  lobster, crab, eel, caviar, clams, mackerel,  trout,  walleye, polluck, shrimp,  snapper, tilapia, scallops, char, carp, oysters, mussels, olive oil, guacamole, avocado,  walnuts, pumpkin seeds,  sunflower seed, soy milk, canola oil, flax seed,  chia seed,  flax oil,  corn oil, safflower oil,  sunflower oil, mustard oil, soybean oil, walnut oil, sesame oil, peanut oil, nut, almond, cashew, pistachio, and pecan were coded as having healthy fats. 


_Table C2. Foods that count as fruits and vegetables for the Nutrition Environment Measures Survey in Restaurants (NEMS-R) scores_

	Fruits Without Added Sugar
Included Fruits	Yes	No
	■	Fresh fruit or canned fruit (in fruit juice)
■	Fresh fruit compote
■	Fresh fruit salad without dressing or on the side
■	Fresh fruit with yogurt
■	Fresh fruit plate with cottage cheese
■	Fresh fruit on the salad bar	■	Cinnamon apples
■	Fruit canned in syrup
■	Fruit salad with dressing
■	Applesauce (unless specifically know that no sugar is added)
	
	Non-fried Vegetables Without Added Sauce
Included Vegetables 	Yes	No
	▪	Raw (e.g., sliced tomato)
▪	Steamed
▪	Grilled or chargrilled
▪	Baked
▪	Pickled	▪	Mixed dishes, such as lasagna, pot pie, stew, spinach calzone, or shepherd’s pie
▪	Fried, stir-fried
▪	Breaded
▪	Au gratin
▪	Casserole
▪	Creamed
▪	Scalloped
▪	With sauce
▪	Glazed
▪	Sauteed
▪	Potatoes
▪	Pinto beans or other dried beans or peas
Notes: The list of foods that were categorized as fruits and vegetables is included in Supplemental C as adapted from the NEMS-R (https://nems-upenn.org/tools/)40.
dTo identify these items, we included search terms for “baked” “low fat” “whole grain” and the list of fruits and veggies in this table and Supplemental C. For vegetables available as sides, if there was nutrition information available for the sides, we made sure that the vegetable qualifies. For example, if the item says “broccoli” but the nutrition information states 80 calories with 6 grams of fat that meant that this item would not qualify as a non-fried vegetable. 




**List of Foods Categorized as Fruits and Vegetables for Nutrition Environment Measures Survey in Restaurants (NEMS-R) tool**
What Foods Are in the Fruit Group?
http://www.choosemyplate.gov/food-groups/fruits.html
View Fruits Food Gallery
Commonly eaten fruits
o	Apples
o	Apricots
o	Bananas
o	Cherries
o	Grapefruit
o	Grapes
o	Kiwi fruit
o	Lemons
o	Limes
o	Mangoes
o	Nectarines
o	Oranges
o	Peaches
o	Pears
o	Papaya
o	Pineapple
o	Plums
o	Prunes
o	Raisins
o	Tangerines
Berries
o	strawberries
o	blueberries
o	raspberries
Melons
o	cantaloupe
o	honeydew
o	watermelon

What Foods Are in the Vegetable Group?
http://www.choosemyplate.gov/food-groups/vegetables.html
Any vegetable or 100% vegetable juice counts as a member of the Vegetable Group. Vegetables may be raw or cooked; fresh, frozen, canned, or dried/dehydrated; and may be whole, cut-up, or mashed.

Vegetables are organized into 5 subgroups, based on their nutrient content.
Key Consumer Message
Make half your plate fruits and vegetables.
View Vegetables Food Gallery
Commonly eaten vegetables in each subgroup
●	
o	Dark Green Vegetables
▪	bok choy
▪	broccoli
▪	collard greens
▪	dark green leafy lettuce
▪	kale
▪	mesclun
▪	mustard greens
▪	romaine lettuce
▪	spinach
▪	turnip greens
▪	watercress
o	Starchy vegetables
▪	cassava
▪	corn
▪	fresh cowpeas, field peas, or black-eyed peas (not dry)
▪	green bananas
▪	green peas
▪	green lima beans
▪	plantains
▪	potatoes
▪	taro
▪	water chestnuts
o	Red & orange vegetables
▪	acorn squash
▪	butternut squash
▪	carrots
▪	hubbard squash
▪	pumpkin
▪	red peppers
▪	sweet potatoes
▪	tomatoes
▪	tomato juice

o	Beans and peas*
▪	black beans
▪	black-eyed peas (mature, dry)
▪	garbanzo beans (chickpeas)
▪	kidney beans
▪	lentils
▪	navy beans
▪	pinto beans
▪	soy beans
▪	split peas
▪	white beans
o	Other vegetables
▪	artichokes
▪	asparagus
▪	avocado
▪	bean sprouts
▪	beets
▪	Brussels sprouts
▪	cabbage
▪	cauliflower
▪	celery
▪	cucumbers
▪	eggplant
▪	green beans
▪	green peppers
▪	iceberg (head) lettuce
▪	mushrooms
▪	okra
▪	onions
▪	turnips
▪	wax beans
▪	zucchini


For the menu item-level outcome, total calories (kcal), total fat, saturated fat, sugar, and the fiber content of menu items were evaluated. Trans fat, sugar, saturated fat, and sodium were also evaluated because the DGAs include these as nutrients to limit (since they are overconsumed)40. Fiber was evaluated because it is a nutrient of concern in the DGAs (are under-consumed)40. All available nutrition information for menu items offered at these 66 restaurant chains between 2012 and 2018 was included in the MenuStat database. 

Covariates of interest included other information about the menu items that was already coded in the MenuStat database such as: the food category (appetizer/side, beverage, dessert, topping, or entrée); whether an item was available on the standard menu or the kid’s menu; the year(s) that the item was offered; whether an item was shareable or meant to be shared; whether the item was a limited time offering; and whether the item was offered only regionally36. Additionally, restaurant type (fast food, fast casual, and full service) was identified by the restaurant name based on the methods used in Moran et. al. (2017). Whether menu labeling was implemented in a particular restaurant during a particular year was determined as well to capture those restaurants that were implementing menu labeling prior to the labeling mandates of the Affordable Care Act54 consistent with the methods outlined in Bleich SN et. al. (2020).



**Describe any code, scripts, or software used to process, visualize, analyze, and/or compress the data**: The Python+Scrapy code for scraping CSR statements from webpages is listed under ## Scrape Restaurant Corporate Social Responsibility Pages below; the Python code for categorizing the overall healthfulness/nutrition quality of menus is included here ## MenuSta NEMS scoring and in the file; the NVivo code for evaluating the content of CSR statements is included in this project; Merging data was completed via STATA and Python; the STATA code for analyzing the associations between having a CSR statement ant the nutrition quality/content of the menus is included in this project. 
**How to credit you**: The Python code here for identifying CSR statements and coding the healthfulness of the menu items and the overall menus was developed in collaboration Drs. Jason Wang and Megan Mueller. The Nvivo coding was done in collaboration, and led by Alyssa Leib and Megan Mueller. The STATA coding for the analysis 

****Code and scripts used to process the data****

## Scrape Restaurant Corporate Social Responsibility Pages
* Scrape restaurant websites with Python + Scrapy
* Identify any page with keywords in text
  * keywords = ['prosperity','foundation','social impact','wellness','communit','helping','health','cares','ethical','citizen','sustainab','opportunit','community service','responsib','stewardship','nutrition','livewell', 'fundrais', 'commitment']
* Collect all web archives of CSR pages (pages with at least one keyword) from [WayBackMachine](https://archive.org/web/) 2012-2018
* Scrape archives with Python + Scrapy

## Merging to MenuStat
* For each year, for each restaurant determine if restaurant contains CSR information
* Rough estimates calculated by checking if any archived page of a restaurant's website contains keyword

## MenuSta NEMS scoring
* At most 16 points
* Do for both kids and adults menus
  1. Count all entrees considered healthy (is_healthy)
    * 3 points for > 5 items
    * 2 points for between 2 and 4 items
    * 1 point for 1 item
    * 0 otherwise
  2. Count healthy main salads
    * 3 points for > 5 items
    * 2 points for between 2 and 4 items
    * 1 point for 1 item
    * 0 otherwise
  3. Count main salads with healthy dressing options
    * 3 points for > 2 items
    * 2 points for 2 items
    * 1 point for 1 item
    * 0 otherwise
  4. Count sides with healthy fruits (healthyfruit)
    * 1 point for > 0 items
    * 0 otherwise
  5. Count sides with healthy vegetables (healthyvegetable)
    * 1 point for > 0 items
    * 0 otherwise
  6. Count sides with healthy chips (healthychip)
    * 1 point for > 0 items
    * 0 otherwise
  7. Count sides with healthy bread (healthybread)
    * 1 point for > 0 items
    * 0 otherwise
  8. Count beverages with healthy milk (healthymilk)
    * 1 point for > 0 items
    * 0 otherwise
  9. Count sides with healthy juice (healthyjuice)
    * 1 point for > 0 items
    * 0 otherwise
  10. Count non-beverage items with healthy fat (has_healthyfat)
    * 1 point for > 0 items
    * 0 otherwise   

## is_healthy variable: An item is considered healthy if
* Item meets nutrition criteria if nutrition criteria available 
* If nutrition criteria is not available:
  1. For sides: check for if item has fruit or vegetable without unhealthy adjective or baked chips/potatos or whole grain bread
  2. For beverages: if beverage contains healthy adjective or less than 40 calories
  3. For entrees: check for "healthy" in item description
  
#### Checking nutrition criteria for non-beverages
* Four categories to check: "kid_entree", "kid_side", "adult_entree", "adult_burgsand"
* Three nutrition criteria: calories, fat, and saturated fat
  * If saturated fat is provided: check all three
  * If only calories and fat provided: check these two
* 12 columns

#### Checking healthy dressing in main salads
* Check for "low fat" or "fat free" in salad item description

#### Checking nutrition criteria for beverages
* Check if calories =< 40

#### Checking item description in sides
* First check if a Salad category item is a side salad:
* Check all appetizers & sides and side salads 
* Healthyside if it meets two criteria:
  1. Does not contain unhealthy fruit or unhealthy vegetable adjective
    * CheckForHealthy.unhealthyfruits_adj
    * CheckForHealthy.unhealthyvegetables_adj
  2. Contains a fruit or vegertable OR if item is potato/chip: contains "baked" OR if item is bread: contains "whole grain"
    * CheckForHealthy.fruits
    * CheckForHealthy.vegetables
* Create variables for having fruits (without unhealthy adjective), having vegetables (without unhealthy adjective), having baked chips (without unhealthy adjective), having whole grain bread ((without unhealthy adjective) 
 
 #### Checking item description in beverage
 * Item is healthy if item description does not contain an unhealthy adjective and contains a healthy adjective
  * CheckForHealthy.unhealthybeverages_adj
  * CheckForHealthy.healthybeverages_adj_milk
  * CheckForHealthy.healthybeverages_adj_juice
 * Create variables for having healthy milk and having healthy juice

 #### Checking healthy fats
 * Item description contains one of healthy fat terms 
  * CheckForHealthy.healthyfats
  
 #### Checking NEM regulated healthy term
 * Item description or item name contains "healthy"
