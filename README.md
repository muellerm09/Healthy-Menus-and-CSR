# Healthy-Menus-and-CSR

**Title:** Restaurant corporate social responsibility and associations with business practices relevant to cardiovascular health

**Grant information:** American Heart Association, Career Development Award, Award Number 19CDA34700007

**Links/information to other repository data:** These data are from publically available resources. Menu Stat (https://www.menustat.org/) contains nutrition information for a sample of the top grossing US restaurant chains. At the time of the initial abstraction/coding of these data were only available from 2012-2018. The second publically available resources is WayBack Machine (https://web.archive.org/), which includes web captures of historical versions of urls including those for restaurant chain websites.

**Citation information to any relevant publications**: Health and non-health related corporate social responsibility statements in top selling restaurant
chains in the United States between 2012-2018: a content analysis

**The project description (Who were the subjects? What did they do? What were the conditions?)**: The subjects in this project were restaurant chains. We utilized their menu item and nutrition information to evaluate the healthfulness and nutrition content of their menu items over 2012-2018. We also utlitized any statments made about corporated social responsibility (CSR) on their websites to understand which resturants had health related CSR statements on their webpages and during which year(s). The groups/conditions in the project were restaurants that had CSR statements vs. those that did not during each year. 

**How was the project carried out?**: 

**Aim 1.**
We identified 96 top selling US restaurant chains to include in our analysis. Top selling restaurants were identified by system-wide sales (the total revenue generated by all the company-owned and franchised outlet locations across all restaurant chains). These 96 restaurants met two criteria. First, historical archives of restaurant websites were available on WayBack machine (https://web.archive.org/), an Internet archive database that has over 306 billion web pages that have been saved from 1996 to the present48. Second, these restaurants also had data on menu nutrition content in the New York City Department of Health’s MenuStat database49. The selected restaurant chains accounted for $245 billion in total sales in 2018 and are among the top 200 restaurants based on system-wide sales50. We focused on the restaurants from this database because a subsequent aim of this research project was to evaluate the associations between CSR and the nutrition quality of offerings. The most complete data on menu nutrition content/quality that was available from the New York City Department of Health’s MenuStat database at the time of abstraction was from 2012-2018. Restaurants in the MenuStat database that were evaluated here include n=47 quick service (fast food) chains, n=25 full-service chains, and n=24 fast casual chains. A full list of the restaurants included in this analysis can be found on the MenuStat website: https://www.menustat.org/.

_Abstracting text information_
CSR statements were identified via archived versions of restaurant web pages using WayBack machine. Archived web pages from 2012-2018 were searched for the 96 US restaurant chains that also had data on menu nutrition content in the New York City Department of Health’s MenuStat database49. CSR content from archived web pages were collected via web scraping using the Python (Beaverton, OR) Scrapy and Beautiful Soup coding packages51. Web scraping enabled us to identify text from web pages that would correspond to CSR statements made about corporate social responsibility initiatives. The Scrapy coding packages abstracted data from the raw html code that included key words identified by the research team and previous literature; and then these data were converted into text using the Beautiful Soup coding package. Each text section in the final dataset represents all the text information after and before section breaks in the html code that contained at least one of the following keywords: “foundation”, “prosperity”, “social impact”, “helping”, “community”, “health”, “cares”, “ethical”, “citizen”, “sustainable”, “opportunity”, “community service”, “responsibility”, “stewardship”, “fundraiser”, “commitment”, “nutrition”. The key words “livewell”, “live well” were also used to identify these statements related to the National Restaurant Association Kids LiveWell program41. We then randomly extracted 60% of all text sections available for every restaurant during every year for our final sample, consistent with other content analyses using large datasets and standard practices for this analysis method52–56. In total, 6369 text sections which included possible CSR statements from archived web pages that included the above keywords were downloaded into a CSV file and used for analyses in NVivo Version 12.  After initial coding, we identified some statements as not codable because they were from website legal disclaimers, because they didn’t include enough information in the text to be codable, etc. Our final sample included 4096 text sections, some of which included multiple CSR statements (Figure 1). 

_Qualitative codebook_
A preliminary codebook was adapted from the CSR activities outlined in Richards et al. (2015), which includes “activities related to the responsible marketing initiatives and policies of the company in relation to health, for example health initiatives, provision of nutrition and health information, and resources to promote healthy behavior” for “Big Food” companies in Australia including Coca Cola, McDonald’s, and Nestle (R1). The codebook used in Richard et. al. (2015) was originally adapted from the Inclusive Social Rating Criteria, which included seven categories of CSR including community, employee relations, and the environment. The authors adapted this original tool by removing several CSR activity categories that were not prevalent in the CSR statements made by their sample of “Big Food” companies and added several new categories including consumer responsibility and partnerships. Their final tool included seven categories of CSR: environment, consumer responsibility, community, partnership, employee relations, indigenous community-specific, and diversity. 

_Modification of Richard’s et al. CSR codebook_
For this study, we further adapted the codebook from Richards et. al. (2015) to better reflect the categories of CSR that we were observing in the CSR statements made by the companies included in our sample. Moreover, we also wanted to differentiate between CSR statements that were specific to health and nutrition and those that weren’t. The purpose of identifying both health-related and non-health related CSR statements specifically was twofold: 1) for the purposes of this study, we wanted to capture the full extent of all the CSR-related activities that these top selling restaurants were participating in so as to be consistent with previous studies and 2) to address the hypothesis for our subsequent aim of this research study around CSR and menu offerings–here, we hypothesized that those restaurants that had health-related CSR were more likely to have healthier options compared to restaurants without CSR/or with CSR that wasn’t health-explicit. 

To make sure our codebook reflected what the restaurants in our sample included in their CSR statements and to capture both the health and non-health related CSR statements made by restaurants, we made the following changes (as displayed in Table 1): 1) further differentiated the community activities identified in Richards et. al. (2015) by whether they were health-related or not; 2) made distinctions between health-related activities the restaurant participated in directly on location through their business practices (Table 1: including calorie labeling prior to the federal mandate; providing healthy or quality foods/options; providing nutrition information; and sodium reduction initiatives; coded as health initiatives) and those that they participated in indirectly (like hosting an event to address hunger in their community; coded as community activities health-related); 3) added philanthropic activities as a separate category, which included elements of the partnerships activities and community activities from Richards et. al. (2015); 4) included the diversity activity category within the employee initiatives activity category, since those were the only diversity initiatives that were mentioned in the texts we examined; 5) removed the indigenous community-specific activity category, which were not mentioned at all in the CSR statements evaluated here; and 6) added a category to capture restaurants that mentioned general CSR initiatives on their websites. 

We also further identified more explicit health-related CSR statements for two activity categories: health-related community activities and health initiatives within the restaurant like calorie labeling and sodium reduction initiatives. Previous literature indicated that CSR statements are often vague in content60–62, and we hypothesized these two CSR activities were the most likely to be related to our subsequent research question around whether restaurants with CSR have healthier menu offerings compared to restaurants without CSR. Statements were coded as explicit if they included one of the following: 1) specific goals or criteria for the nutrient content of menu items; 2) location of nutrition information (e.g., in store or on the website); 3) the amount of money invested or the number of individuals served during a health initiative; 4) specific outcomes from a health initiative; or 5) details on the execution of a health initiative.

Our final codebook contained 7 activity categories: community activities health-related, community activities not health-related, employee initiatives, health initiatives, philanthropy, sustainability, and general CSR initiatives and an additional 13 activity subcategories ranging from health-related community activities that were directed towards young children to philanthropic activities including volunteer work (Table 1).

**Table 1.** Categories Included in Corporate Social Responsibility (CSR) Statement Coding Instrument Adapted from Richards et. al. (2015)
Community activities that were health related	
	Health and wellness	Activities that address exercise, nutrition, mental health, health and wellness.
		Efforts toward young children	Activities that address exercise, nutrition, mental health, health and wellness specifically related to children.
		Healthcare	Activities that address healthcare reform, healthcare issue, raising awareness about a healthcare issue
	Hunger relief	Activities that describe food being donated or served directly to hungry people (not a food bank).
Community activities that were non-health related	Activities in the community not related to health or hunger-relief. Examples include scholarships, grants, percentage nights, public safety, raising awareness about a non-health related issue, summer camps, commitment to the community (including rewarding individuals and organizations who work to improve the community).
Employee initiatives	Activities provide employee benefits, training, career development. Additionally, company efforts around diversity and inclusion or building relationships between employees were included.
Health initiatives	
	Calorie labeling	When restaurants listed calories on menu or menu board prior to the federal mandate via the Affordable Care Act
	Provide healthy or quality foods or options	Restaurants reported offering menu items that were healthy, quality, organic, light, vegetarian, gluten-free, low-fat, no high-fructose corn syrup or trans fat
	Provide nutrition information	Restaurants reported providing the nutrition content of menu items (outside of calorie information) in store or online
	Sodium reduction	Activities aimed at reducing the sodium content across all or a subset of menu items
Philanthropy	
	Donations to charity	Activities that address the donations of money, food, or other products to an organization or a food bank
	Established foundation arm of the restaurant	When the restaurant has a foundation or nonprofit organization associated with the parent company
	Established relationship with an organization	Activities that address partnership with an organization with welfare connotations, including charity partners.  Examples also included when there was evidence of a long history (10+ years) of donating to an organization or when describing the activities of another organization.
	Fundraising	Activities that address the restaurant or foundation raising money from patrons, community members, or employees.
	Volunteer work	Activities including offering employees paid time or otherwise encouraging employees to volunteer with outside organizations. Statements around the restaurant’s support of community service were also included.
Sustainability	Activities that address the environment, ethical farming/sourcing/pesticide use, animal welfare, antibiotic use. Examples include the purchasing of products with environmentally friendly certifications (e.g., Ethical Tea Partnership, Rainforest Alliance).
General CSR initiatives	Activities that include any mention of the following: corporate social responsibility, responsibility, mission, value followed by a description of the restaurant’s CSR (e.g., supporting the environment, employees, strengthening communities, etc.)


_Analysis_
Content analysis was performed in Nvivo12 to evaluate whether the aforementioned activities were commonly included on restaurant websites as well as to assess: 1) whether CSR statements (or thematically coded portions of the text section) were explicit (i.e., include specific goals for the nutrient content of menu items), 2) frequencies of different categories of health-related CSR statements, the nature of these messages (explicit vs. not), and 3) relationships between themes. Statements were coded using the keywords described in Table 1. Three trained research staff coded the statements. We established intercoder reliability through an iterative method where we read and coded a subsample of articles, calculated Cohen’s kappa statistics, discussed differences, and adjusted the coding instrument. This was repeated until approximately 250 statements had been coded and an acceptable level of agreement was reached (kappa = 0.8). During the coding process, statements that were difficult to interpret were reviewed as a research team and coded based on consensus. We used the matrix query function to quantify the frequency of activities reported in CSR statements and the nature of these statements overall and over time. All data abstraction and analyses were completed November 2019-November 2023. 


**Aim 2.** 
Data on CSR initiatives were abstracted from the internet archives restaurant pages using WayBack machine (https://web.archive.org/).
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
Notes: The list of foods that were categorized as fruits and vegetables is included in Supplemental C as adapted from the NEMS-R (https://nems-upenn.org/tools/).
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


For the menu item-level outcome, total calories (kcal), total fat, saturated fat, sugar, and the fiber content of menu items were evaluated. Trans fat, sugar, saturated fat, and sodium were also evaluated because the DGAs include these as nutrients to limit (since they are overconsumed). Fiber was evaluated because it is a nutrient of concern in the DGAs (are under-consumed). All available nutrition information for menu items offered at these 66 restaurant chains between 2012 and 2018 was included in the MenuStat database. 

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
