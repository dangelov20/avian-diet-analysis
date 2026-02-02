Avian Dietary & Morphological Analysis 🐦
Project Overview
This project explores a global dataset of over 11,000 bird species to understand the relationship between dietary niches and body mass. Using R and the Tidyverse, I cleaned raw ornithological data and visualized how different feeding habits influence species frequency and physical size.

Key Questions
Which dietary strategies are the most common among birds globally?

How does median body mass vary across different primary diets?

Data Processing
The analysis was performed using R and the following libraries:

tidyverse: For data manipulation and visualization.

readxl: For importing Excel data.

scales: For formatting large numeric values.

Key Cleaning Steps:

Skipped metadata headers to ensure correct column alignment.

Filtered out "No Information" and NA values to ensure statistical accuracy.

Applied a Log10 Scale to body mass data to account for the extreme variance between small passerines and large flightless birds.

Visualizations
1. Global Distribution of Diets
This chart shows that invertebrate-based diets are the most successful evolutionary strategy in terms of species count.

2. Median Body Mass by Diet
By calculating the median weight for each niche, we see that "Vert Fish" (Vertebrate and Fish) eaters tend to be significantly heavier than nectar or invertebrate specialists.

How to Run This Code
Clone this repository.

Ensure you have bird_base.xlsx in your directory.

Run analysis.R in RStudio.


## Data Source
The data used in this analysis is sourced from the **BIRDBASE** dataset, a comprehensive global database of avian traits.

**Citation:**
> Şekercioğlu, Çağan H; Kittelberger, Kyle D.; Mota, Flávia; Buxton, Amy N.; Orton, Nikolas; DeNiro, Adara; et al. (2025). **BIRDBASE: A Global Database of Avian Biogeography, Conservation, Ecology and Life History Traits.** figshare. Dataset. [https://doi.org/10.6084/m9.figshare.27051040.v1](https://doi.org/10.6084/m9.figshare.27051040.v1)
