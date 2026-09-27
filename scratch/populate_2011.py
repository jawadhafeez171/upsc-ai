import json
import os
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    master_kg = json.load(f)
valid_nids = set(master_kg['nodes'].keys())

# Complete, verified mapping of all 100 questions of 2011
M_2011 = {
    1: {
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_chemistry',
        'sub_topic': 'Bioasphalt & Eco-Friendly Road Surfacing Polymers',
        'sub_topic_hi': 'बायोऐस्फाल्ट एवं पर्यावरण-अनुकूल सड़क निर्माण बहुलक',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Bioasphalt', 'Green Chemistry', 'Road Infrastructure']
    },
    2: {
        'node_id': 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.air_pollution_atmospheric_quality',
        'sub_topic': 'Thermal Power Plant Emissions: Carbon Dioxide, NOx and SOx',
        'sub_topic_hi': 'उष्मीय शक्ति संयंत्र उत्सर्जन: कार्बन डाइऑक्साइड, नाइट्रोजन और सल्फर के ऑक्साइड',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Thermal Power Plants', 'Coal Combustion', 'Air Pollution']
    },
    3: {
        'node_id': 'science_technology_defence.space_technology_astronomy.orbits_satellite_navigation_applications',
        'sub_topic': 'Geostationary & Geosynchronous Orbit Mechanics (35,786 km Circular Equatorial Orbit)',
        'sub_topic_hi': 'भू-स्थिर एवं भू-तुल्यकालिक कक्षा यांत्रिकी',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Geostationary Orbit', 'Satellite Communications']
    },
    4: {
        'node_id': 'indian_economy_development.agriculture_food_management_subsidies.agricultural_pricing_market_reforms',
        'sub_topic': 'Food Inflation in India: Dietary Diversification & Supply Chain Constraints',
        'sub_topic_hi': 'भारत में खाद्य मुद्रास्फीति: आहार विविधीकरण एवं आपूर्ति श्रृंखला बाधाएं',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Food Inflation', 'Consumption Pattern', 'Supply Chains']
    },
    5: {
        'node_id': 'science_technology_defence.biotechnology_health_life_sciences.genomics_genetics_gene_editing',
        'sub_topic': 'Chromosome Mapping & DNA Marker-Assisted Selection in Livestock Pedigree',
        'sub_topic_hi': 'गुणसूत्र मानचित्रण एवं पशुधन वंशावली में डीएनए मार्कर-सहायता प्राप्त चयन',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Gene Mapping', 'DNA Sequencing', 'Livestock Pedigree']
    },
    6: {
        'node_id': 'indian_economy_development.external_sector_balance_of_payments_foreign_trade.balance_of_payments_architecture',
        'sub_topic': 'Invisibles & Service Exports: Tourism Earnings from International Sports Events',
        'sub_topic_hi': 'अदृश्य मदें एवं सेवा निर्यात: अंतर्राष्ट्रीय खेल आयोजनों से पर्यटन आय',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Balance of Payments', 'Service Exports', 'Tourism']
    },
    7: {
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_chemistry',
        'sub_topic': 'Microbial Fuel Cells (MFCs): Bio-Electrochemical Electricity from Wastewater',
        'sub_topic_hi': 'सूक्ष्मजैविक ईंधन सेल (MFCs): अपशिष्ट जल से जैव-विद्युत रासायनिक ऊर्जा उत्पादन',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Microbial Fuel Cells', 'Renewable Energy', 'Biotechnology']
    },
    8: {
        'node_id': 'indian_economy_development.fiscal_policy_public_finance_taxation.deficit_concepts_fiscal_discipline',
        'sub_topic': 'Keynesian Fiscal Stimulus: Government Spending & Tax Relief for Economic Recovery',
        'sub_topic_hi': 'कीन्सवादी राजकोषीय प्रोत्साहन: आर्थिक सुधार हेतु सरकारी व्यय एवं कर राहत',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Fiscal Stimulus', 'Public Spending', 'Economic Recovery']
    },
    9: {
        'node_id': 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.multilateral_environmental_agreements_meas',
        'sub_topic': 'Antarctic Ozone Hole: Polar Stratospheric Clouds & CFC Chlorine Activation',
        'sub_topic_hi': 'अंटार्कटिक ओजोन छिद्र: ध्रुवीय समतापमंडलीय बादल एवं सीएफसी क्लोरीन सक्रियण',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Ozone Hole', 'Polar Stratospheric Clouds', 'CFCs']
    },
    10: {
        'node_id': 'indian_economy_development.external_sector_balance_of_payments_foreign_trade.balance_of_payments_architecture',
        'sub_topic': 'Current Account Deficit (CAD) Management: Currency Devaluation & Trade Policies',
        'sub_topic_hi': 'चालू खाता घाटा (CAD) प्रबंधन: मुद्रा अवमूल्यन एवं व्यापार नीतियां',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Current Account Deficit', 'Currency Devaluation', 'BOP']
    },
    11: {
        'node_id': 'indian_polity_constitution_governance.local_governance.73rd_74th_constitutional_amendment_acts',
        'sub_topic': '73rd Amendment Act 1992: District Planning Committees & State Finance Commissions',
        'sub_topic_hi': '73वां संशोधन अधिनियम 1992: जिला योजना समितियां एवं राज्य वित्त आयोग',
        'diff': 'medium',
        'tags': ['UPSC 2011', '73rd Amendment', 'Panchayati Raj', 'District Planning Committee']
    },
    12: {
        'node_id': 'geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india',
        'sub_topic': 'Brahmani and Baitarani River Basins: Koel-Sankh Confluence & Bhitarkanika Habitat',
        'sub_topic_hi': 'ब्राह्मणी एवं बैतरणी नदी बेसिन: कोयल-सांख संगम एवं भितरकनिका पर्यावास',
        'diff': 'hard',
        'tags': ['UPSC 2011', 'Brahmani River', 'Baitarani River', 'Bhitarkanika', 'Mapping'],
        'is_map': True,
        'region': 'India',
        'cat': 'Rivers & Drainage',
        'skill': 'location_identification',
        'sec': ['geography_earth_systems.indian_mapping_spatial_geography.river_systems_tributaries_spatial_ordering']
    },
    13: {
        'node_id': 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting.inflation_metrics_control',
        'sub_topic': 'Base Effect in Price Index Inflation Computations',
        'sub_topic_hi': 'मूल्य सूचकांक मुद्रास्फीति गणना में आधार प्रभाव (Base Effect)',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Base Effect', 'Inflation Measurement', 'Price Indices']
    },
    14: {
        'node_id': 'geography_earth_systems.human_geography_population_settlements.global_indian_demographic_trends.demographic_attributes_and_population_dynamics',
        'sub_topic': 'Demographic Dividend in India: Bulge in Working-Age Population (15-64 Years)',
        'sub_topic_hi': 'भारत में जनसांख्यिकीय लाभांश: कार्यशील आयु जनसंख्या में उभार',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Demographic Dividend', 'Age Structure', 'Working Population']
    },
    15: {
        'node_id': 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.international_climate_architecture_treaties',
        'sub_topic': 'Carbon Credits & Clean Development Mechanism (CDM) under Kyoto Protocol',
        'sub_topic_hi': 'क्योतो प्रोटोकॉल के तहत कार्बन क्रेडिट एवं स्वच्छ विकास तंत्र (CDM)',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Carbon Credits', 'Kyoto Protocol', 'Clean Development Mechanism']
    },
    16: {
        'node_id': 'indian_economy_development.fiscal_policy_public_finance_taxation.indirect_taxation_gst_architecture',
        'sub_topic': 'Value Added Tax (VAT): Multipoint Taxation with Input Tax Credit',
        'sub_topic_hi': 'मूल्य वर्धित कर (VAT): इनपुट टैक्स क्रेडिट सहित बहु-बिंदु कराधान',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Value Added Tax', 'VAT', 'Input Tax Credit', 'Indirect Taxes']
    },
    17: {
        'node_id': 'indian_economy_development.external_sector_balance_of_payments_foreign_trade.foreign_trade_policy_international_agreements',
        'sub_topic': 'Closed Economy Paradigm: Zero International Trade (Exports = Imports = 0)',
        'sub_topic_hi': 'बंद अर्थव्यवस्था प्रतिमान: शून्य अंतर्राष्ट्रीय व्यापार',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Closed Economy', 'Foreign Trade', 'Macroeconomics']
    },
    18: {
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
        'sub_topic': 'Plant Physiology: Girdling Experiment & Phloem Nutrient Starvation in Roots',
        'sub_topic_hi': 'पादप कार्यिकी: गर्डलिंग प्रयोग एवं जड़ों में फ्लोएम पोषक तत्वों की कमी',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Plant Physiology', 'Phloem', 'Girdling', 'Botany']
    },
    19: {
        'node_id': 'science_technology_defence.nuclear_technology_energy.international_nuclear_governance_treaties',
        'sub_topic': 'New START Treaty: Strategic Arms Reduction between United States and Russia',
        'sub_topic_hi': 'न्यू स्टार्ट संधि: संयुक्त राज्य अमेरिका एवं रूस के बीच रणनीतिक हथियार कटौती',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'New START Treaty', 'USA-Russia', 'Nuclear Arms Reduction']
    },
    20: {
        'node_id': 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.biodiversity_fundamentals_patterns',
        'sub_topic': 'Western Ghats & Indo-Burma Biodiversity Hotspots: Norman Myers Endemism Criteria',
        'sub_topic_hi': 'पश्चिमी घाट एवं इंडो-बर्मा जैव विविधता हॉटस्पॉट: नॉर्मन मायर्स स्थानिक प्रजाति मानदंड',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Western Ghats', 'Biodiversity Hotspots', 'Indo-Burma', 'Mapping'],
        'is_map': True,
        'region': 'India',
        'cat': 'Protected Areas & Biogeography',
        'skill': 'location_identification',
        'sec': ['geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes']
    },
    21: {
        'node_id': 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.climate_change_science_global_warming',
        'sub_topic': 'Carbon Cycle Dynamics: Atmospheric Carbon Dioxide Sinks & Terrestrial Sequestration',
        'sub_topic_hi': 'कार्बन चक्र गतिशीलता: वायुमंडलीय कार्बन डाइऑक्साइड सिंक एवं स्थलीय पृथक्करण',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Carbon Cycle', 'Carbon Dioxide', 'Photosynthesis', 'Greenhouse Gases']
    },
    22: {
        'node_id': 'geography_earth_systems.oceanography_marine_systems.ocean_water_dynamics',
        'sub_topic': 'Coastal & Oceanic Upwelling: Wind-Driven Divergence & Nutrient-Rich Epipelagic Ecosystems',
        'sub_topic_hi': 'तटीय एवं महासागरीय अपवेलिंग: पवन-प्रेरित विचलन एवं पोषक-समृद्ध पारिस्थितिकी तंत्र',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Ocean Upwelling', 'Marine Ecosystems', 'Ocean Currents', 'Oceanography']
    },
    23: {
        'node_id': 'geography_earth_systems.climatology_atmospheric_dynamics.world_climate_regions',
        'sub_topic': 'Tropical Rainforest Biome: Nutrient-Poor Oxisols & Intensive Leaching Dynamics',
        'sub_topic_hi': 'उष्णकटिबंधीय वर्षावन बायोम: पोषक तत्व-विहीन मिट्टी एवं तीव्र निक्षालन (Leaching)',
        'diff': 'hard',
        'tags': ['UPSC 2011', 'Tropical Rainforest', 'Soil Leaching', 'Nutrient Cycling', 'Biomes']
    },
    24: {
        'node_id': 'geography_earth_systems.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india',
        'sub_topic': 'Himalayan Biogeography: Altitudinal Zonation from Tropical to Alpine Ecosystems',
        'sub_topic_hi': 'हिमालयी जैव-भूगोल: उष्णकटिबंधीय से अल्पाइन पारिस्थितिकी तंत्र तक ऊंचाई आधारित क्षेत्रीकरण',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Himalayas', 'Altitudinal Zonation', 'Species Diversity', 'Mapping'],
        'is_map': True,
        'region': 'India',
        'cat': 'Mountains, Passes & Plateaus',
        'skill': 'location_identification',
        'sec': ['geography_earth_systems.indian_mapping_spatial_geography.himalayan_mountain_ranges_passes_glaciers']
    },
    25: {
        'node_id': 'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india.core_environmental_legislation',
        'sub_topic': 'Statutory Environmental Framework: Wildlife Protection Act 1972 & Biological Diversity Act 2002',
        'sub_topic_hi': 'वैधानिक पर्यावरणीय ढांचा: वन्यजीव संरक्षण अधिनियम 1972 एवं जैविक विविधता अधिनियम 2002',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Environmental Laws', 'Biodiversity Act', 'Foreign Trade Act']
    },
    26: {
        'node_id': 'history.world_history.industrial_revolution_rise_of_capitalism_and_socialism.rise_of_economic_ideologies_capitalism_to_marxism',
        'sub_topic': 'Marxist Dialectical Materialism: Class Struggle & Means of Production',
        'sub_topic_hi': 'मार्क्सवादी द्वंद्वात्मक भौतिकवाद: वर्ग संघर्ष एवं उत्पादन के साधन',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Karl Marx', 'Dialectical Materialism', 'Class Struggle', 'Socialism']
    },
    27: {
        'node_id': 'geography_earth_systems.climatology_atmospheric_dynamics.atmosphere_structure_heat_budget',
        'sub_topic': 'Atmospheric Layering: Ionosphere, Radio Wave Reflection & Solar Flare Disturbance',
        'sub_topic_hi': 'वायुमंडलीय स्तर: आयनमंडल, रेडियो तरंग परावर्तन एवं सौर ज्वाला विक्षोभ',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Ionosphere', 'Radio Communication', 'Atmospheric Layers', 'Solar Activity']
    },
    28: {
        'node_id': 'indian_economy_development.external_sector_balance_of_payments_foreign_trade.balance_of_payments_architecture',
        'sub_topic': 'Foreign Direct Investment (FDI) vs Foreign Institutional Investment (FII)',
        'sub_topic_hi': 'प्रत्यक्ष विदेशी निवेश (FDI) बनाम विदेशी संस्थागत निवेश (FII)',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'FDI', 'FII', 'Capital Account', 'Foreign Investment']
    },
    29: {
        'node_id': 'science_technology_defence.biotechnology_health_life_sciences.agricultural_biotechnology_bio-economy',
        'sub_topic': 'Transgenic Crops: Bt-Brinjal, Bacillus thuringiensis Cry1Ac Gene & Pest Resistance',
        'sub_topic_hi': 'ट्रांसजेनिक फसलें: बीटी-बैंगन, बैसिलस थुरिंजिएंसिस Cry1Ac जीन एवं कीट प्रतिरोध',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Bt Brinjal', 'Genetic Modification', 'Biotechnology', 'Transgenic Crops']
    },
    30: {
        'node_id': 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections.protection_of_marginalised_groups',
        'sub_topic': 'Aam Admi Bima Yojana (AABY): Social Security & Life Insurance for Rural Landless Households',
        'sub_topic_hi': 'आम आदमी बीमा योजना (AABY): ग्रामीण भूमिहीन परिवारों हेतु सामाजिक सुरक्षा एवं जीवन बीमा',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Aam Admi Bima Yojana', 'Social Security', 'Life Insurance', 'Rural Welfare']
    },
    31: {
        'node_id': 'geography_earth_systems.oceanography_marine_systems.ocean_floor_relief_features',
        'sub_topic': 'Brent Crude Oil: North Sea Offshore Hydrocarbon Extraction & Global Benchmark',
        'sub_topic_hi': 'ब्रेंट क्रूड ऑयल: उत्तरी सागर अपतटीय हाइड्रोकार्बन निष्कर्षण एवं वैश्विक मानक',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Brent Crude', 'North Sea', 'Oil Extraction', 'Mapping'],
        'is_map': True,
        'region': 'World',
        'cat': 'Seas, Straits & Water Bodies',
        'skill': 'location_identification',
        'sec': ['geography_earth_systems.world_mapping_geopolitical_locations.enclosed_seas_bordering_nations']
    },
    32: {
        'node_id': 'science_technology_defence.nuclear_technology_energy.fundamental_particle_physics_research_facilities',
        'sub_topic': 'Pressurized Heavy Water Reactors (PHWR): Heavy Water (D2O) as Neutron Moderator',
        'sub_topic_hi': 'दाबित भारी जल रिएक्टर (PHWR): न्यूट्रॉन मंदक के रूप में भारी जल (D2O)',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Heavy Water', 'Nuclear Reactor', 'Moderator', 'Nuclear Physics']
    },
    33: {
        'node_id': 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35',
        'sub_topic': 'National Minorities Statutory & Constitutional Safeguards (Articles 29 & 30)',
        'sub_topic_hi': 'राष्ट्रीय अल्पसंख्यक वैधानिक एवं संवैधानिक सुरक्षा उपाय (अनुच्छेद 29 एवं 30)',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'National Minorities', 'Article 30', 'Prime Minister 15 Point Programme']
    },
    34: {
        'node_id': 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections.protection_of_marginalised_groups',
        'sub_topic': 'Persons with Disabilities Act 1995: Inclusive Education & Statutory Reservations',
        'sub_topic_hi': 'दिव्यांगजन अधिनियम 1995: समावेशी शिक्षा एवं वैधानिक आरक्षण',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Persons with Disabilities', 'Equal Opportunities', 'Social Justice']
    },
    35: {
        'node_id': 'indian_economy_development.agriculture_food_management_subsidies.food_processing_supply_chain_logistics',
        'sub_topic': 'Mega Food Parks Scheme: Farm-to-Fork Logistics Infrastructure & Processing Value Chains',
        'sub_topic_hi': 'मेगा फूड पार्क योजना: खेत से उपभोक्ता तक लॉजिस्टिक्स अवसंरचना एवं प्रसंस्करण मूल्य श्रृंखला',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Mega Food Parks', 'Food Processing', 'Supply Chain Management']
    },
    36: {
        'node_id': 'indian_polity_constitution_governance.parliament_state_legislatures.legislative_procedure_bills',
        'sub_topic': 'Parliamentary Control over Public Funds: Appropriation Bill & Article 114',
        'sub_topic_hi': 'लोक वित्त पर संसदीय नियंत्रण: विनियोग विधेयक एवं अनुच्छेद 114',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Consolidated Fund of India', 'Appropriation Bill', 'Parliament', 'Article 114']
    },
    37: {
        'node_id': 'indian_economy_development.fiscal_policy_public_finance_taxation.union_budget_public_finance_architecture_contingency_fund_article_267_public_account_article_266_revenue_receipts_vs_capital_receipts_revenue_expenditure_vs_capital_expenditure_capex_multiplier_effect',
        'sub_topic': 'Consolidated Fund of India (Article 266): Tax Revenues, Loans & Treasury Receipts',
        'sub_topic_hi': 'भारत की संचित निधि (अनुच्छेद 266): कर राजस्व, ऋण एवं राजकोषीय प्राप्तियां',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Consolidated Fund', 'Article 266', 'Public Finance', 'Government Accounts']
    },
    38: {
        'node_id': 'indian_economy_development.monetary_policy_banking_architecture.banking_structure_regulatory_framework',
        'sub_topic': 'Microfinance Delivery Architecture: SHG-Bank Linkage Programme & Joint Liability Groups',
        'sub_topic_hi': 'माइक्रोफाइनेंस वितरण संरचना: एसएचजी-बैंक लिंकेज कार्यक्रम एवं संयुक्त देयता समूह',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Microfinance', 'SHG Bank Linkage', 'Financial Inclusion']
    },
    39: {
        'node_id': 'geography_earth_systems.geography_of_the_world.regional_geography_south_east_asia',
        'sub_topic': 'Geopolitical Location of Southeast Asia: Maritime Chokepoints between Pacific and Indian Oceans',
        'sub_topic_hi': 'दक्षिण-पूर्व एशिया की भू-राजनीतिक स्थिति: प्रशांत एवं हिंद महासागर के बीच समुद्री चोकपॉइंट',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Southeast Asia', 'Malacca Strait', 'Indo-Pacific', 'Mapping'],
        'is_map': True,
        'region': 'World',
        'cat': 'Seas, Straits & Water Bodies',
        'skill': 'location_identification',
        'sec': ['geography_earth_systems.world_mapping_geopolitical_locations.strategic_straits_chokepoints_canals']
    },
    40: {
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
        'sub_topic': 'Trans-Fatty Acids: Hydrogenation of Vegetable Oils & Cardiovascular Disease Risks',
        'sub_topic_hi': 'ट्रांस-फैटी एसिड: वनस्पति तेलों का हाइड्रोजनीकरण एवं हृदय रोग जोखिम',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Trans Fats', 'Hydrogenated Oils', 'Lipids', 'Public Health']
    },
    41: {
        'node_id': 'indian_society_social_justice.poverty_inequality_developmental_challenges.poverty_concepts_measurement',
        'sub_topic': 'MGNREGA 2005: Universal Statutory Right to Unskilled Manual Work for Adult Rural Households',
        'sub_topic_hi': 'मनरेगा 2005: वयस्क ग्रामीण परिवारों हेतु अकुशल शारीरिक श्रम का वैधानिक अधिकार',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'MGNREGA', 'Right to Work', 'Rural Livelihoods', 'Social Security']
    },
    42: {
        'node_id': 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations.guiding_principles_of_foreign_policy',
        'sub_topic': "India's Look East Policy: Economic Integration, Connectivity & ASEAN Regional Engagement",
        'sub_topic_hi': 'भारत की लुक ईस्ट नीति: आर्थिक एकीकरण, कनेक्टिविटी एवं आसियान क्षेत्रीय जुड़ाव',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Look East Policy', 'ASEAN', 'Act East', 'Foreign Policy']
    },
    43: {
        'node_id': 'indian_polity_constitution_governance.parliament_state_legislatures.legislative_procedure_bills',
        'sub_topic': 'Parliamentary Defeat of Union Budget in Lok Sabha: Collective Responsibility & Resignation of Ministry',
        'sub_topic_hi': 'लोकसभा में केंद्रीय बजट का अस्वीकार होना: सामूहिक उत्तरदायित्व एवं मंत्रिमंडल का त्यागपत्र',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Union Budget', 'No-Confidence', 'Collective Responsibility', 'Parliament']
    },
    44: {
        'node_id': 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35',
        'sub_topic': 'Fundamental Duties (Article 51A): Scope & Excluded Non-Duties (Voting in Elections)',
        'sub_topic_hi': 'मूल कर्तव्य (अनुच्छेद 51A): दायरा एवं गैर-कर्तव्य (चुनावों में मतदान)',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Fundamental Duties', 'Article 51A', 'Swaran Singh Committee']
    },
    45: {
        'node_id': 'indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies.constitutional_bodies',
        'sub_topic': 'Finance Commission of India (Article 280): Mandate, Devolution & Recommendations Status',
        'sub_topic_hi': 'भारत का वित्त आयोग (अनुच्छेद 280): अधिदेश, कर अंतरण एवं अनुशंसाओं की प्रकृति',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Finance Commission', 'Article 280', 'Fiscal Federalism']
    },
    46: {
        'node_id': 'international_relations_global_institutions.global_institutions_agreements_treaties.international_organisations_reform',
        'sub_topic': 'Universal Declaration of Human Rights (UDHR 1948): Socio-Economic & Political Entitlements',
        'sub_topic_hi': 'मानवाधिकारों की सार्वभौम घोषणा (UDHR 1948): सामाजिक-आर्थिक एवं राजनीतिक अधिकार',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'UDHR 1948', 'Human Rights', 'United Nations']
    },
    47: {
        'node_id': 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.water_pollution_aquatic_degradation',
        'sub_topic': 'Harmful Algal Blooms (HABs): Eutrophication, Dinoflagellates & Marine Upwelling Triggers',
        'sub_topic_hi': 'हानिकारक शैवाल प्रस्फुटन (HABs): सुपोषण, डाइनोफ्लैगलेट्स एवं महासागरीय अपवेलिंग कारक',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Algal Blooms', 'Red Tide', 'Eutrophication', 'Marine Ecology']
    },
    48: {
        'node_id': 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.climate_change_science_global_warming',
        'sub_topic': 'Global Carbon Cycle: Photosynthetic Fixation vs Atmospheric Carbon Release Mechanisms',
        'sub_topic_hi': 'वैश्विक कार्बन चक्र: प्रकाश संश्लेषक स्थिरीकरण बनाम वायुमंडलीय कार्बन उत्सर्जन तंत्र',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Carbon Cycle', 'Photosynthesis', 'Respiration', 'Carbon Sequestration']
    },
    49: {
        'node_id': 'science_technology_defence.nuclear_technology_energy.international_nuclear_governance_treaties',
        'sub_topic': 'Multilateral Export Control Regimes: NSG, MTCR, Australia Group & Wassenaar Arrangement',
        'sub_topic_hi': 'बहुपक्षीय निर्यात नियंत्रण व्यवस्थाएं: एनएसजी, एमटीसीआर, ऑस्ट्रेलिया समूह एवं वासेनार व्यवस्था',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'NSG', 'MTCR', 'Wassenaar Arrangement', 'Australia Group', 'Export Controls']
    },
    50: {
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_physics',
        'sub_topic': 'Anomalous Expansion of Water: Density Inversion at 4°C & Survival of Aquatic Organisms',
        'sub_topic_hi': 'जल का असामान्य प्रसार: 4°C पर घनत्व उत्क्रमण एवं जलीय जीवों का जीवन संरक्षण',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Anomalous Expansion', 'Water Density', 'Thermal Physics']
    },
    51: {
        'node_id': 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.in-situ_conservation_architecture',
        'sub_topic': 'Indian Wild Ass (Equus hemionus khur): Endemic Saline Habitat in Little Rann of Kutch',
        'sub_topic_hi': 'भारतीय जंगली गधा (खुर): कच्छ के छोटे रण में स्थानिक लवणीय पर्यावास',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Indian Wild Ass', 'Rann of Kutch', 'Gujarat', 'Wildlife', 'Mapping'],
        'is_map': True,
        'region': 'India',
        'cat': 'Protected Areas & Biogeography',
        'skill': 'location_identification',
        'sec': ['geography_earth_systems.indian_mapping_spatial_geography.protected_areas_wildlife_corridors_spatial_layout']
    },
    52: {
        'node_id': 'geography_earth_systems.oceanography_marine_systems.ocean_water_dynamics.enso_dynamics_and_indian_ocean_dipole',
        'sub_topic': 'ENSO Dynamics: La Niña Pacific Cooling & Australian Flood Teleconnections',
        'sub_topic_hi': 'ईएनएसओ गतिशीलता: ला नीना प्रशांत शीतलन एवं ऑस्ट्रेलियाई बाढ़ संबंध',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'La Nina', 'El Nino', 'ENSO', 'Oceanography', 'Climatology']
    },
    53: {
        'node_id': 'history.modern_india.economic_impact_of_british_rule.colonial_land_revenue_systems',
        'sub_topic': 'Cornwallis Permanent Settlement 1793: Abolition of Zamindari Judicial Authority & Litigation Explosion',
        'sub_topic_hi': 'कॉर्नवालिस स्थायी बंदोबस्त 1793: जमींदारी न्यायिक शक्तियों की समाप्ति एवं मुकदमों में वृद्धि',
        'diff': 'hard',
        'tags': ['UPSC 2011', 'Permanent Settlement', 'Lord Cornwallis', 'Land Revenue', 'Modern History']
    },
    54: {
        'node_id': 'history.indian_freedom_struggle.wwii_cripps_mission_quit_india_movement_ina.quit_india_movement_august_kranti_1942',
        'sub_topic': 'Quit India Movement 1942: Spontaneous Leaderless Upsurge, Underground Networks & Parallel Governments',
        'sub_topic_hi': 'भारत छोड़ो आंदोलन 1942: स्वतःस्फूर्त नेतृत्वविहीन जनउभार, भूमिगत नेटवर्क एवं समानांतर सरकारें',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Quit India Movement', 'Do or Die', 'August Kranti', 'Indian Freedom Struggle']
    },
    55: {
        'node_id': 'history.modern_india.early_peasant_tribal_civil_uprisings.tribal_movements_insurrections',
        'sub_topic': '19th Century Tribal Insurrections: Complete Disruption of Traditional Agrarian & Forest Autonomy',
        'sub_topic_hi': '19वीं सदी के जनजातीय विद्रोह: पारंपरिक कृषि एवं वन स्वायत्तता का पूर्ण विघटन',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Tribal Movements', 'Dikus', 'Colonial Forest Laws', 'Peasant Uprisings']
    },
    56: {
        'node_id': 'history.ancient_india.indian_influence_in_south-east_asia',
        'sub_topic': 'Ancient Maritime Trade with Southeast Asia: Monsoon Wind Navigation across Bay of Bengal',
        'sub_topic_hi': 'दक्षिण-पूर्व एशिया के साथ प्राचीन समुद्री व्यापार: बंगाल की खाड़ी में मानसूनी पवनों द्वारा नौकायन',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Maritime Trade', 'Bay of Bengal', 'Monsoon Navigation', 'Cultural Contacts']
    },
    57: {
        'node_id': 'science_technology_defence.information_communication_technology_ai_cyber_security.telecommunications_wireless_infrastructure',
        'sub_topic': 'Short-Range Wireless Standards: Bluetooth (2.4 GHz FHSS) vs Wi-Fi (802.11 DSSS/OFDM)',
        'sub_topic_hi': 'लघु-दूरी वायरलेस मानक: ब्लूटूथ (2.4 GHz FHSS) बनाम वाई-फाई (802.11 DSSS/OFDM)',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Bluetooth', 'Wi-Fi', 'Wireless Technology', 'ICT']
    },
    58: {
        'node_id': 'indian_economy_development.agriculture_food_management_subsidies.irrigation_infrastructure_water_productivity',
        'sub_topic': 'Micro-Irrigation Agronomy: Fertigation, Water Use Efficiency & Evaporation Loss Reduction',
        'sub_topic_hi': 'सूक्ष्म-सिंचाई कृषि विज्ञान: फर्टिगेशन, जल उपयोग दक्षता एवं वाष्पीकरण ह्रास में कमी',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Micro-irrigation', 'Drip Irrigation', 'Fertigation', 'Water Efficiency']
    },
    59: {
        'node_id': 'history.modern_india.economic_impact_of_british_rule.drain_of_wealth_famine_dynamics',
        'sub_topic': 'Colonial Drain of Wealth: Home Charges Components (India Office, Railway Guarantees & War Pensions)',
        'sub_topic_hi': 'औपनिवेशिक धन की निकासी: गृह प्रभार घटक (इंडिया ऑफिस, रेलवे गारंटी एवं युद्ध पेंशन)',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Home Charges', 'Drain of Wealth', 'Dadabhai Naoroji', 'Economic Nationalism']
    },
    60: {
        'node_id': 'history.indian_freedom_struggle.gandhian_era_early_satyagrahas_non-cooperation_movement.early_indian_satyagrahas',
        'sub_topic': 'Kheda Satyagraha 1918: Revenue Code Remission Rights during Crop Failure',
        'sub_topic_hi': 'खेड़ा सत्याग्रह 1918: फसल बर्बादी के दौरान राजस्व संहिता के तहत लगान माफी अधिकार',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Kheda Satyagraha', 'Mahatma Gandhi', 'Sardar Patel', 'Revenue Remission']
    },
    61: {
        'node_id': 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.biodiversity_fundamentals_patterns',
        'sub_topic': 'Ecosystem Services of Biodiversity: Soil Genesis, Pollination, Nutrient Cycling & Waste Processing',
        'sub_topic_hi': 'जैव विविधता की पारिस्थितिकी सेवाएं: मृदा निर्माण, परागण, पोषक तत्व चक्र एवं अपशिष्ट निस्तारण',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Ecosystem Services', 'Biodiversity', 'Nutrient Cycling', 'Pollination']
    },
    62: {
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_chemistry',
        'sub_topic': 'Artificial Sweeteners: Aspartame Dipeptide (Aspartic Acid & Phenylalanine) Biochemical Caloric Value',
        'sub_topic_hi': 'कृत्रिम मिठास कारक: एस्पार्टेम डाइपेप्टाइड जैव-रासायनिक कैलोरी मान',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Aspartame', 'Artificial Sweeteners', 'Amino Acids', 'Food Chemistry']
    },
    63: {
        'node_id': 'history.indian_freedom_struggle.foundation_of_inc_moderate_phase.foundation_of_indian_national_congress',
        'sub_topic': 'British Committee of the Indian National Congress (1889): Sir William Wedderburn & W.S. Caine',
        'sub_topic_hi': 'भारतीय राष्ट्रीय कांग्रेस की ब्रिटिश समिति (1889): सर विलियम वेडरबर्न एवं डब्ल्यू.एस. केन',
        'diff': 'hard',
        'tags': ['UPSC 2011', 'British Committee of INC', 'William Wedderburn', 'Moderates', 'London Lobbying']
    },
    64: {
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_physics',
        'sub_topic': 'Lighting Technologies: Compact Fluorescent Lamps (CFL - Mercury Discharge) vs LEDs (Semiconductor Diodes)',
        'sub_topic_hi': 'प्रकाश प्रौद्योगिकियां: सीएफएल (पारा विसर्जन) बनाम एलईडी (अर्धचालक डायोड)',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'CFL vs LED', 'Mercury Toxicity', 'Energy Efficiency', 'Semiconductors']
    },
    65: {
        'node_id': 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.water_pollution_aquatic_degradation',
        'sub_topic': 'Marine Oil Spill Bioremediation: TERI Oilzapper Bacterial Consortium for Crude Sludge Degradation',
        'sub_topic_hi': 'समुद्री तेल रिसाव जैव-उपचार: कच्चे तेल गाद अपघटन हेतु टेरी का ऑयलजैपर जीवाणु संघ',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Oilzapper', 'TERI', 'Bioremediation', 'Oil Spill', 'Marine Pollution']
    },
    66: {
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
        'sub_topic': 'Mendelian Genetics: ABO Blood Group Multi-Allelic Inheritance Patterns',
        'sub_topic_hi': 'मेंडेलियन आनुवंशिकी: एबीओ रक्त समूह बहु-एलीलिक वंशागति प्रतिरूप',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'ABO Blood Groups', 'Genetics', 'Inheritance', 'Human Physiology']
    },
    67: {
        'node_id': 'history.indian_freedom_struggle.gandhian_era_early_satyagrahas_non-cooperation_movement.emergence_of_mahatma_gandhi',
        'sub_topic': "Gandhian Philosophy: Ruskin's 'Unto This Last' & The Welfare of All (Sarvodaya)",
        'sub_topic_hi': "गांधीवादी दर्शन: जॉन रस्किन की 'अनटू दिस लास्ट' एवं सर्वोदय संकल्पना",
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Mahatma Gandhi', 'Unto This Last', 'John Ruskin', 'Sarvodaya']
    },
    68: {
        'node_id': 'history.indian_freedom_struggle.wwii_cripps_mission_quit_india_movement_ina.quit_india_movement_august_kranti_1942',
        'sub_topic': 'Underground Resistance in Quit India 1942: Usha Mehta & Secret Congress Radio Broadcasting',
        'sub_topic_hi': 'भारत छोड़ो आंदोलन 1942 में भूमिगत प्रतिरोध: उषा मेहता एवं गुप्त कांग्रेस रेडियो प्रसारण',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Usha Mehta', 'Congress Radio', 'Quit India Movement 1942', 'Secret Radio']
    },
    69: {
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_physics',
        'sub_topic': 'Optical Storage Media: Blu-ray Disc (405 nm Blue Laser) vs DVD (650 nm Red Laser)',
        'sub_topic_hi': 'ऑप्टिकल स्टोरेज मीडिया: ब्लू-रे डिस्क (405 nm ब्लू लेज़र) बनाम डीवीडी (650 nm रेड लेज़र)',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Blu-ray Disc', 'Laser Wavelength', 'Optical Storage', 'Physics']
    },
    70: {
        'node_id': 'history.indian_freedom_struggle.swadeshi_movement_extremism_revolutionary_nationalism_phase_i.partition_of_bengal_swadeshi_movement',
        'sub_topic': 'Calcutta INC Session 1906: Dadabhai Naoroji & The Four Historic Resolutions (Swaraj, Swadeshi, Boycott, National Education)',
        'sub_topic_hi': 'कलकत्ता कांग्रेस अधिवेशन 1906: दादाभाई नौरोजी एवं चार ऐतिहासिक प्रस्ताव (स्वराज, स्वदेशी, बहिष्कार, राष्ट्रीय शिक्षा)',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Calcutta Session 1906', 'Dadabhai Naoroji', 'Swaraj Resolution', 'Swadeshi']
    },
    71: {
        'node_id': 'geography_earth_systems.economic_resource_geography.agricultural_geography_and_food_security',
        'sub_topic': 'Plantation Agriculture Geography: Nilgiri & Anaimalai Highlands (Tea, Coffee, Rubber, Cinchona)',
        'sub_topic_hi': 'बागान कृषि भूगोल: नीलगिरि एवं अन्नामलाई उच्चभूमि (चाय, कॉफी, रबर, सिनकोना)',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Plantation Agriculture', 'Western Ghats', 'Coffee and Tea', 'Mapping'],
        'is_map': True,
        'region': 'India',
        'cat': 'Minerals, Ports & Infrastructure',
        'skill': 'location_identification',
        'sec': ['geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes']
    },
    72: {
        'node_id': 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.in-situ_conservation_architecture',
        'sub_topic': 'In-Situ vs Ex-Situ Conservation Strategies: Botanical Gardens & Gene Banks as Ex-Situ Slices',
        'sub_topic_hi': 'स्व-स्थाने (In-Situ) बनाम पर-स्थाने (Ex-Situ) संरक्षण रणनीतियां: वानस्पतिक उद्यान एवं जीन बैंक',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'In-situ Conservation', 'Ex-situ Conservation', 'Botanical Garden', 'Biodiversity']
    },
    73: {
        'node_id': 'indian_polity_constitution_governance.local_governance.73rd_74th_constitutional_amendment_acts',
        'sub_topic': 'Metropolitan Planning Committee (Article 243ZE): Composition, Draft Development Plan & Mandate',
        'sub_topic_hi': 'महानगर योजना समिति (अनुच्छेद 243ZE): संरचना, प्रारूप विकास योजना एवं अधिदेश',
        'diff': 'hard',
        'tags': ['UPSC 2011', 'Metropolitan Planning Committee', 'Article 243ZE', '74th Amendment', 'Urban Governance']
    },
    74: {
        'node_id': 'indian_polity_constitution_governance.parliament_state_legislatures.legislative_procedure_bills',
        'sub_topic': 'Vote on Account (Article 116) vs Interim Budget: Constitutional Scope & Expenditure Sanctions',
        'sub_topic_hi': 'लेखानुदान (अनुच्छेद 116) बनाम अंतरिम बजट: संवैधानिक दायरा एवं व्यय स्वीकृति',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Vote on Account', 'Interim Budget', 'Article 116', 'Parliamentary Budget']
    },
    75: {
        'node_id': 'international_relations_global_institutions.global_institutions_agreements_treaties.international_organisations_reform',
        'sub_topic': 'International Monetary Fund (IMF): Balance of Payments Lending Exclusively to Member Sovereign Nations',
        'sub_topic_hi': 'अंतर्राष्ट्रीय मुद्रा कोष (IMF): केवल सदस्य संप्रभु राष्ट्रों को भुगतान संतुलन ऋण सुविधा',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'IMF', 'Balance of Payments', 'Bretton Woods', 'International Finance']
    },
    76: {
        'node_id': 'geography_earth_systems.oceanography_marine_systems.marine_ecosystems_conservation',
        'sub_topic': 'Coastal Bioshields: Mangrove Root Complexes Attenuating Tsunami Wave Energy & Storm Surges',
        'sub_topic_hi': 'तटीय जैव-कवच: सुनामी तरंग ऊर्जा एवं तूफानी महोर्मियों को कम करने वाले मैंग्रोव जड़ तंत्र',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Mangroves', 'Tsunami Buffer', 'Coastal Protection', 'Marine Ecology']
    },
    77: {
        'node_id': 'history.ancient_india.religious_movements_jainism',
        'sub_topic': 'Jain Metaphysics: Uncreated & Eternal Cosmos Governed by Universal Natural Law (Anekantavada)',
        'sub_topic_hi': 'जैन तत्वमीमांसा: सार्वभौमिक प्राकृतिक नियम द्वारा संचालित अनादि एवं अनंत ब्रह्मांड',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Jain Philosophy', 'Universal Law', 'Cosmology', 'Ancient History']
    },
    78: {
        'node_id': 'geography_earth_systems.indian_physical_geography_monsoon_architecture.soils_natural_vegetation_of_india',
        'sub_topic': 'Soil Salinization in Irrigated Lands: Capillary Action, Impermeability & Agricultural Desertification',
        'sub_topic_hi': 'सिंचित भूमि में मृदा लवणीकरण: केशिकीय क्रिया, अपारगम्यता एवं कृषि मरुस्थलीकरण',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Soil Salinization', 'Canal Irrigation', 'Land Degradation', 'Soil Science']
    },
    79: {
        'node_id': 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.biodiversity_fundamentals_patterns',
        'sub_topic': 'IUCN Red Data Books: Global Conservation Status Classification (CR, EN, VU)',
        'sub_topic_hi': 'आईयूसीएन रेड डाटा बुक्स: वैश्विक संरक्षण स्थिति वर्गीकरण (गंभीर संकटग्रस्त, संकटग्रस्त, सुभेद्य)',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'IUCN', 'Red Data Book', 'Threatened Species', 'Conservation']
    },
    80: {
        'node_id': 'indian_economy_development.monetary_policy_banking_architecture.banking_structure_regulatory_framework',
        'sub_topic': 'Teaser Loans: Introductory Subprime Rates, Repayment Shock & Non-Performing Asset (NPA) Risks',
        'sub_topic_hi': 'टीज़र ऋण: प्रारंभिक रियायती दरें, पुनर्भुगतान झटका एवं गैर-निष्पादित परिसंपत्ति (NPA) जोखिम',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Teaser Loans', 'Subprime Crisis', 'Commercial Banks', 'NPA Risks']
    },
    81: {
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_physics',
        'sub_topic': 'Orbital Mechanics: Earth Gravitational Attraction as Centripetal Acceleration for Orbiting Satellites',
        'sub_topic_hi': 'कक्षीय यांत्रिकी: परिक्रमा कर रहे उपग्रहों हेतु अभिकेंद्रीय त्वरण के रूप में पृथ्वी का गुरुत्वाकर्षण',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Centripetal Force', 'Satellite Orbit', 'Gravitation', 'Orbital Mechanics']
    },
    82: {
        'node_id': 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting.national_income_aggregates',
        'sub_topic': 'National Income Accounting: Real GDP Growth vs Per Capita Income Divergence with Population Growth',
        'sub_topic_hi': 'राष्ट्रीय आय लेखांकन: वास्तविक जीडीपी वृद्धि बनाम जनसंख्या वृद्धि के साथ प्रति व्यक्ति आय में अंतर',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'GDP Growth', 'Per Capita Income', 'National Income Accounting']
    },
    83: {
        'node_id': 'indian_economy_development.monetary_policy_banking_architecture.banking_structure_regulatory_framework',
        'sub_topic': 'Agricultural Credit Architecture in India: Commercial Banks (~70%), RRBs & Cooperative Credit Share',
        'sub_topic_hi': 'भारत में कृषि ऋण संरचना: वाणिज्यिक बैंक (~70%), क्षेत्रीय ग्रामीण बैंक एवं सहकारी साख हिस्सा',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Agricultural Credit', 'Commercial Banks', 'Cooperatives', 'Rural Banking']
    },
    84: {
        'node_id': 'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth.inclusive_growth_inequality_dynamics',
        'sub_topic': 'Inclusive Growth Strategy: Micro-Credit, MSME Support & Free Universal Primary Education',
        'sub_topic_hi': 'समावेशी विकास रणनीति: सूक्ष्म ऋण, एमएसएमई समर्थन एवं निःशुल्क सार्वभौमिक प्राथमिक शिक्षा',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Inclusive Growth', 'SHGs', 'MSMEs', 'Right to Education']
    },
    85: {
        'node_id': 'indian_economy_development.industrial_policy_manufacturing_services.public_sector_enterprises_disinvestment',
        'sub_topic': 'CPSE Disinvestment Policy: Capital Formation, Fiscal Deficit Financing & Market Discipline',
        'sub_topic_hi': 'सीपीएसई विनिवेश नीति: पूंजी निर्माण, राजकोषीय घाटा वित्तपोषण एवं बाजार अनुशासन',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Disinvestment', 'CPSEs', 'Fiscal Management', 'National Investment Fund']
    },
    86: {
        'node_id': 'science_technology_defence.space_technology_astronomy.deep_space_observatories_cosmology_astrophysics',
        'sub_topic': 'Solar System Small Bodies: Rocky Asteroids (Main Belt) vs Icy Volatile Comets (Glowing Coma & Tails)',
        'sub_topic_hi': 'सौर मंडल के लघु पिंड: चट्टानी क्षुद्रग्रह बनाम बर्फ युक्त पुच्छल तारे (चमकदार कोमा एवं पूंछ)',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Asteroids', 'Comets', 'Solar System', 'Kuiper Belt']
    },
    87: {
        'node_id': 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting.inflation_metrics_control',
        'sub_topic': 'Phillips Curve Dynamics: Moderate Demand-Pull Inflation as Concomitant of Robust Economic Growth',
        'sub_topic_hi': 'फिलिप्स वक्र गतिशीलता: सुदृढ़ आर्थिक विकास के साथ मध्यम मांग-प्रेरित मुद्रास्फीति',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Economic Growth', 'Inflation', 'Macroeconomics', 'Phillips Curve']
    },
    88: {
        'node_id': 'indian_economy_development.monetary_policy_banking_architecture.monetary_policy_framework_rbi_operations',
        'sub_topic': 'RBI Quantitative Monetary Tools: Bank Rate Lowering & Expansion of Commercial Liquidity',
        'sub_topic_hi': 'आरबीआई के मात्रात्मक मौद्रिक साधन: बैंक दर में कमी एवं वाणिज्यिक तरलता में विस्तार',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Bank Rate', 'RBI', 'Monetary Policy', 'Market Liquidity']
    },
    89: {
        'node_id': 'geography_earth_systems.climatology_atmospheric_dynamics.atmospheric_pressure_global_wind_belts',
        'sub_topic': 'Planetary Wind Systems: Stronger Southern Hemisphere Westerlies (Roaring Forties / Minimal Land Friction)',
        'sub_topic_hi': 'ग्रहीय पवन प्रणालियां: दक्षिणी गोलार्ध में तीव्र पछुआ पवनें (गरजता चालीसा / न्यूनतम भू-घर्षण)',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Westerlies', 'Roaring Forties', 'Planetary Winds', 'Climatology']
    },
    90: {
        'node_id': 'geography_earth_systems.oceanography_marine_systems.marine_ecosystems_conservation',
        'sub_topic': 'Strategic Maritime Chokepoints: Strait of Malacca Bypass via Kra Isthmus Canal Proposal',
        'sub_topic_hi': 'रणनीतिक समुद्री चोकपॉइंट: क्रा इस्थमस नहर प्रस्ताव द्वारा मलक्का जलडमरूमध्य का वैकल्पिक मार्ग',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Strait of Malacca', 'Kra Isthmus', 'Maritime Trade', 'Mapping'],
        'is_map': True,
        'region': 'World',
        'cat': 'Seas, Straits & Water Bodies',
        'skill': 'location_identification',
        'sec': ['geography_earth_systems.world_mapping_geopolitical_locations.strategic_straits_chokepoints_canals']
    },
    91: {
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
        'sub_topic': 'Nutritional Biochemistry: Dietary Antioxidants (Vitamins C & E, Carotenoids) Neutralizing Free Radicals',
        'sub_topic_hi': 'पोषण जैव-रसायन: आहार एंटीऑक्सीडेंट (विटामिन सी व ई, कैरोटेनॉइड्स) एवं मुक्त कण निष्प्रभावीकरण',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Antioxidants', 'Free Radicals', 'Human Nutrition', 'Biochemistry']
    },
    92: {
        'node_id': 'history.ancient_india.indus_valley_civilization',
        'sub_topic': 'Indus Valley Civilization Social Structure: Secular Urban Character & Absence of Monumental Palaces/Temples',
        'sub_topic_hi': 'सिंधु घाटी सभ्यता सामाजिक संरचना: धर्मनिरपेक्ष नगरीय चरित्र एवं विशाल महलों/मंदिरों का अभाव',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Indus Valley Civilization', 'Harappan Society', 'Secular Character']
    },
    93: {
        'node_id': 'geography_earth_systems.economic_resource_geography.agricultural_geography_and_food_security',
        'sub_topic': 'Agro-Ecological Belts of Lower Gangetic Plain: Humid Alluvial Lowlands for High-Yielding Paddy & Jute',
        'sub_topic_hi': 'निम्न गंगा मैदान के कृषि-पारिस्थितिकीय क्षेत्र: उच्च उपज वाले धान एवं जूट हेतु आर्द्र जलोढ़ तराई',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Lower Gangetic Plain', 'Paddy and Jute', 'Cropping Patterns', 'Mapping'],
        'is_map': True,
        'region': 'India',
        'cat': 'Minerals, Ports & Infrastructure',
        'skill': 'location_identification',
        'sec': ['geography_earth_systems.indian_mapping_spatial_geography.river_systems_tributaries_spatial_ordering']
    },
    94: {
        'node_id': 'geography_earth_systems.climatology_atmospheric_dynamics.world_climate_regions',
        'sub_topic': 'Genesis of Tropical Deserts: Subtropical High-Pressure Subsidence & Offshore Trade Winds (Sahara & Arabian)',
        'sub_topic_hi': 'उष्णकटिबंधीय मरुस्थलों की उत्पत्ति: उपोष्णकटिबंधीय उच्च-दाब अवतलन एवं अपतटीय व्यापारिक पवनें',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Tropical Deserts', 'Subtropical High Pressure', 'Trade Winds', 'Climatology']
    },
    95: {
        'node_id': 'geography_earth_systems.climatology_atmospheric_dynamics.atmosphere_structure_heat_budget',
        'sub_topic': 'Aviation Meteorology: Lower Stratosphere Stability (Absence of Water Vapour, Clouds & Convection Turbulence)',
        'sub_topic_hi': 'विमानन मौसम विज्ञान: निचला समतापमंडल स्थायित्व (जलवाष्प, बादलों एवं संवहन विक्षोभ का अभाव)',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Stratosphere', 'Aviation Meteorology', 'Atmospheric Layers', 'Turbulence']
    },
    96: {
        'node_id': 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.biodiversity_fundamentals_patterns',
        'sub_topic': 'Spatial Ecology: Latitudinal Diversity Gradient & Altitudinal Biodiversity Declines',
        'sub_topic_hi': 'स्थानिक पारिस्थितिकी: अक्षांशीय विविधता प्रवणता एवं ऊंचाई आधारित जैव विविधता ह्रास',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'Latitudinal Gradient', 'Biodiversity Patterns', 'Altitudinal Gradient']
    },
    97: {
        'node_id': 'geography_earth_systems.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india',
        'sub_topic': 'Eastern Himalayan Syntaxially Bent Drainage: Tsangpo-Brahmaputra, Irrawaddy & Mekong Antecedent Valleys',
        'sub_topic_hi': 'पूर्वी हिमालयी अक्षीय विवर्तनिकी मोड़ अपवाह: त्सांगपो-ब्रह्मपुत्र, इरावदी एवं मेकांग पूर्ववर्ती घाटियां',
        'diff': 'hard',
        'tags': ['UPSC 2011', 'Brahmaputra', 'Irrawaddy', 'Mekong', 'Namcha Barwa', 'Syntaxial Bend', 'Mapping'],
        'is_map': True,
        'region': 'India',
        'cat': 'Rivers & Drainage',
        'skill': 'spatial_ordering',
        'sec': ['geography_earth_systems.indian_mapping_spatial_geography.river_systems_tributaries_spatial_ordering']
    },
    98: {
        'node_id': 'geography_earth_systems.economic_resource_geography.agricultural_geography_and_food_security',
        'sub_topic': 'Regional Agrarian Profile of Gujarat: Arid North, Black Soil Saurashtra Cotton Belt & Groundnut Primacy',
        'sub_topic_hi': 'गुजरात का क्षेत्रीय कृषि परिदृश्य: शुष्क उत्तर, काली मिट्टी सौराष्ट्र कपास पेटी एवं मूंगफली प्रधानता',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Gujarat Geography', 'Cotton Belt', 'Saurashtra', 'Mapping'],
        'is_map': True,
        'region': 'India',
        'cat': 'Minerals, Ports & Infrastructure',
        'skill': 'location_identification',
        'sec': ['geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes']
    },
    99: {
        'node_id': 'science_technology_defence.information_communication_technology_ai_cyber_security.cyber_security_threats_digital_governance',
        'sub_topic': 'Virtual Private Network (VPN): Encrypted Tunneling & Secure Telecommunication over Public Internet',
        'sub_topic_hi': 'वर्चुअल प्राइवेट नेटवर्क (VPN): सार्वजनिक इंटरनेट पर एन्क्रिप्टेड टनलिंग एवं सुरक्षित दूरसंचार',
        'diff': 'easy',
        'tags': ['UPSC 2011', 'VPN', 'Cyber Security', 'Network Tunneling', 'Encryption']
    },
    100: {
        'node_id': 'history.ancient_india.vedic_age',
        'sub_topic': 'Rigvedic Philosophy: Dharma (Individual Duty & Social Order) and Rita (Cosmic Harmony & Natural Order)',
        'sub_topic_hi': 'ऋग्वैदिक दर्शन: धर्म (व्यक्तिगत कर्तव्य एवं सामाजिक व्यवस्था) और ऋत (ब्रह्मांडीय सामंजस्य एवं प्राकृतिक नियम)',
        'diff': 'medium',
        'tags': ['UPSC 2011', 'Dharma and Rita', 'Vedic Age', 'Rigvedic Philosophy', 'Ancient India']
    }
}

# 1. Verify that all 100 node_ids are strictly in master_kg
invalid_count = 0
for q_num, m in M_2011.items():
    nid = m['node_id']
    if nid not in valid_nids:
        print(f"ERROR: Q{q_num} has invalid node_id '{nid}'")
        invalid_count += 1

if invalid_count > 0:
    print(f"FAILED: {invalid_count} invalid node IDs. Exiting without updating.")
    sys.exit(1)

print(f"SUCCESS: All {len(M_2011)} node IDs in 2011 mapping table are 100% valid in master KG!")

# 2. Load 2011.json and apply the mappings
with open('src/data/upsc_pyq/2011.json', 'r', encoding='utf-8') as f:
    questions = json.load(f)

updated_count = 0
mapping_count = 0

for q in questions:
    q_num = q.get('question_number')
    if q_num in M_2011:
        m = M_2011[q_num]
        node = master_kg['nodes'][m['node_id']]
        
        q['node_id'] = m['node_id']
        q['subject'] = node['subject']
        # Domain name from parent node
        parent_id = node['parentId']
        q['domain'] = master_kg['nodes'].get(parent_id, {}).get('name', '') if parent_id else node['name']
        q['sub_topic'] = m['sub_topic']
        
        # Hindi translations for taxonomy
        # Map subjects to standard Hindi titles
        subject_hi_map = {
            'History': 'इतिहास',
            'Indian Polity, Constitution & Governance': 'भारतीय राजव्यवस्था, संविधान एवं शासन',
            'Indian Economy & Development': 'भारतीय अर्थव्यवस्था एवं विकास',
            'Geography & Earth Systems': 'भूगोल एवं पृथ्वी प्रणाली',
            'Environment, Ecology & Disaster Management': 'पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन',
            'Science, Technology & Defence': 'विज्ञान, प्रौद्योगिकी एवं रक्षा',
            'International Relations & Global Institutions': 'अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं',
            'Indian Society & Social Justice': 'भारतीय समाज एवं सामाजिक न्याय'
        }
        q['subject_hindi'] = subject_hi_map.get(node['subject'], 'सामान्य अध्ययन')
        q['domain_hindi'] = q['domain']  # Can be enriched or keep domain title
        q['sub_topic_hindi'] = m['sub_topic_hi']
        q['difficulty'] = m['diff']
        q['tags'] = m['tags']
        
        if m.get('is_map', False):
            q['is_mapping'] = True
            q['mapping'] = {
                'is_mapping': True,
                'region': m['region'],
                'category': m['cat'],
                'spatial_skill': m['skill'],
                'has_image': False
            }
            q['secondary_node_ids'] = m.get('sec', [])
            mapping_count += 1
        else:
            q['is_mapping'] = False
            q.pop('mapping', None)
            q.pop('secondary_node_ids', None)
            
        updated_count += 1

with open('src/data/upsc_pyq/2011.json', 'w', encoding='utf-8') as f:
    json.dump(questions, f, indent=4, ensure_ascii=False)

print(f"Successfully populated 2011.json: {updated_count}/100 questions mapped ({mapping_count} mapping questions identified).")
